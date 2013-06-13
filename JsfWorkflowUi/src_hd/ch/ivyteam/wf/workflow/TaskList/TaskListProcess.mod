[Ivy]
[>Created: Fri Jun 07 13:55:13 CEST 2013]
13EE9A482A299A65 3.17 #module
>Proto >Proto Collection #zClass
Ts0 TaskListProcess Big #zClass
Ts0 RD #cInfo
Ts0 #process
Ts0 @TextInP .ui2RdDataAction .ui2RdDataAction #zField
Ts0 @TextInP .rdData2UIAction .rdData2UIAction #zField
Ts0 @TextInP .resExport .resExport #zField
Ts0 @TextInP .type .type #zField
Ts0 @TextInP .processKind .processKind #zField
Ts0 @AnnotationInP-0n ai ai #zField
Ts0 @TextInP .xml .xml #zField
Ts0 @TextInP .responsibility .responsibility #zField
Ts0 @RichDialogInitStart f0 '' #zField
Ts0 @RichDialogProcessEnd f1 '' #zField
Ts0 @GridStep f11 '' #zField
Ts0 @PushWFArc f2 '' #zField
Ts0 @PushWFArc f13 '' #zField
>Proto Ts0 Ts0 TaskListProcess #zField
Ts0 f0 guid 13EE9A482C1E853B #txt
Ts0 f0 type ch.ivyteam.wf.workflow.TaskList.TaskListData #txt
Ts0 f0 method start() #txt
Ts0 f0 disableUIEvents true #txt
Ts0 f0 inParameterDecl 'ch.ivyteam.ivy.richdialog.exec.RdMethodCallEvent methodEvent = event as ch.ivyteam.ivy.richdialog.exec.RdMethodCallEvent;
<> param = methodEvent.getInputArguments();
' #txt
Ts0 f0 outParameterDecl '<java.lang.Number taskId,java.lang.String option> result;
' #txt
Ts0 f0 outParameterMapAction 'result.taskId=in.taskId;
result.option=in.option;
' #txt
Ts0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
        <nameStyle>7,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Ts0 f0 86 54 20 20 13 0 #rect
Ts0 f0 @|RichDialogInitStartIcon #fIcon
Ts0 f1 type ch.ivyteam.wf.workflow.TaskList.TaskListData #txt
Ts0 f1 86 182 20 20 13 0 #rect
Ts0 f1 @|RichDialogProcessEndIcon #fIcon
Ts0 f11 actionDecl 'ch.ivyteam.wf.workflow.TaskList.TaskListData out;
' #txt
Ts0 f11 actionTable 'out=in;
' #txt
Ts0 f11 actionCode 'import java.util.Collection;
import java.util.ArrayList;
import ch.ivyteam.ivy.security.ISecurityMember;
import java.util.EnumSet;
import ch.ivyteam.ivy.workflow.PropertyOrder;
import ch.ivyteam.ivy.workflow.TaskState;
import ch.ivyteam.ivy.workflow.TaskProperty;
import ch.ivyteam.ivy.persistence.OrderDirection;
import ch.ivyteam.ivy.persistence.IQueryResult;
import ch.ivyteam.ivy.workflow.ITask;
import javax.servlet.http.HttpServletRequest;

IQueryResult queryResult  = ivy.session.findWorkTasks(null, PropertyOrder.create(TaskProperty.ID, OrderDirection.DESCENDING), 
          0, -1, true, EnumSet.of(TaskState.SUSPENDED, TaskState.RESUMED, TaskState.PARKED));

List<ITask> tasks = queryResult.getResultList();
out.paginator = tasks.size() >= 50;

for (ITask task : tasks)
{
	out.tasks.add(task);
}
' #txt
Ts0 f11 type ch.ivyteam.wf.workflow.TaskList.TaskListData #txt
Ts0 f11 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>taskList</name>
        <nameStyle>8
</nameStyle>
    </language>
</elementInfo>
' #txt
Ts0 f11 78 116 36 24 20 -2 #rect
Ts0 f11 @|StepIcon #fIcon
Ts0 f2 expr out #txt
Ts0 f2 96 140 96 182 #arcP
Ts0 f13 expr out #txt
Ts0 f13 96 74 96 116 #arcP
>Proto Ts0 .type ch.ivyteam.wf.workflow.TaskList.TaskListData #txt
>Proto Ts0 .processKind HTML_DIALOG #txt
>Proto Ts0 -8 -8 16 16 16 26 #rect
>Proto Ts0 '' #fIcon
Ts0 f11 mainOut f2 tail #connect
Ts0 f2 head f1 mainIn #connect
Ts0 f0 mainOut f13 tail #connect
Ts0 f13 head f11 mainIn #connect