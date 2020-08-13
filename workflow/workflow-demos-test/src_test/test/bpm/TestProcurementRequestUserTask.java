package test.bpm;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.TaskSelector;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmProcess;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.workflow.ITask;
import workflow.humantask.ProcurementRequest;

/**
 * Tests the ProcurementRequest using the {@link BpmClient} testing API :
 * <code>workflow-demos/processes/Humantask/ProcurementRequestUserTask.mod</code>
 *
 */
@IvyProcessTest
class TestProcurementRequestUserTask
{
  private static final BpmProcess PROCUREMENT_PROCESS = BpmProcess.path("Humantask/ProcurementRequestUserTask");
  
  private static interface HtmlDialog
  {
    BpmElement ENTER_REQUEST = PROCUREMENT_PROCESS.elementName("Enter Request");
    BpmElement VERIFY_REQUEST_MANAGER = PROCUREMENT_PROCESS.element().name().contains("Verify Request");
    BpmElement ACCEPT_REQUEST = PROCUREMENT_PROCESS.elementName("Accept Request");
  }
  
  private static interface Role
  {
    String MANAGER = "Manager";
    String EXECUTIVE_MANAGER = "Executive Manager";
  }

  @Test
  void approve(BpmClient bpmClient)
  {

	  ExecutionResult result = createProcurrementRequest(bpmClient);

    
	  bpmClient.mock().element(HtmlDialog.VERIFY_REQUEST_MANAGER)
	  .with(ProcurementRequest.class, (in, out) -> out.setDataOkManager(true));
	  bpmClient.mock().element(HtmlDialog.ACCEPT_REQUEST)
	  .with(ProcurementRequest.class, (in, out) -> out.setAccepted(true));
	  
    List<ITask> firstTasks = result.workflow().activeTasks();
    assertThat(firstTasks).hasSize(1);
    assertThat(firstTasks.get(0).getName()).startsWith("Verify Request");
    assertThat(firstTasks.get(0).getActivatorName()).startsWith("Manager");
    
    ExecutionResult verifyResult = bpmClient.start().task(firstTasks.get(0))
      .as().role(Role.MANAGER).http().post().execute();

    List<ITask> tasks = verifyResult.workflow().activeTasks();
    assertThat(tasks).hasSize(1);
    assertThat(tasks.get(0).getName()).startsWith("Accept Request");
    assertThat(tasks.get(0).getActivatorName()).startsWith("Executive Manager");
    
    ExecutionResult acceptResult = bpmClient.start()
      .task(result.workflow().anyActiveTask())
      .as().role(Role.EXECUTIVE_MANAGER).execute();
    
    ProcurementRequest request = acceptResult.data().last();
    assertThat(request.getAccepted()).isTrue();
  }

  private static ExecutionResult createProcurrementRequest(BpmClient bpmClient)
  {
    bpmClient.mock().element(HtmlDialog.ENTER_REQUEST).with(in -> newComputer());
    ExecutionResult result = bpmClient
        .start().process(PROCUREMENT_PROCESS)
        .as().user("ldv")
        .execute();
    
    assertThat(result).isNotNull();
    assertProcurementInitTasks(result);
    return result;
  }

  private static ProcurementRequest newComputer()
  {
    var testData = new ProcurementRequest();
    testData.setDescription("PC");
    testData.setAmount(3);
    testData.setPricePerUnit(1222.95);
    testData.setTotalPrice(3668.85);
    return testData;
  }
  
  private static void assertProcurementInitTasks(ExecutionResult result)
  {
    TaskSelector tasks = result.workflow().activeTask();
    assertThat(result.workflow().activeTasks()).hasSize(1);
    assertThat(tasks.activatorRole(Role.MANAGER).get().getName()).startsWith("Verify Request:");
  }
  
  private static void executeSystemTask(BpmClient client, ExecutionResult previousResult)
  {
    client.start().task(previousResult.workflow().activeTask().system())
      .as().systemUser().execute();
  }
}
