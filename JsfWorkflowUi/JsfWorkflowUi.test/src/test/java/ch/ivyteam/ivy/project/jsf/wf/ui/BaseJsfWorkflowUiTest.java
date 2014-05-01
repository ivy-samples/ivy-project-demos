package ch.ivyteam.ivy.project.jsf.wf.ui;

import static org.fest.assertions.api.Assertions.assertThat;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import ch.ivyteam.ivy.server.test.IvyWebDriverHelper;
import ch.ivyteam.ivy.server.test.WfNavigator;
import ch.ivyteam.ivy.server.test.prime.PrimeFacesWidgetHelper;

public class BaseJsfWorkflowUiTest
{
  public static final String WEB_TEST_SERVER_ADMIN_USER;
  public static final String WEB_TEST_SERVER_ADMIN_PASSWORD;
  private static final String[] PRIORITIES = {"EXCEPTION", "HIGH", "NORMAL", "LOW"};
  
  @Rule
  public TestRule globalMethodTimeout = new Timeout(10 * 60 * 1000);
  
  static
  {
      WEB_TEST_SERVER_ADMIN_USER = "Administrator";
      WEB_TEST_SERVER_ADMIN_PASSWORD = "administrator";
  }
  protected IvyWebDriverHelper driverHelper;

  @Before
  public void setUp() throws Exception
  {
    driverHelper = new IvyWebDriverHelper();
    navigate().grantAdminRights();
    login(WEB_TEST_SERVER_ADMIN_USER, WEB_TEST_SERVER_ADMIN_PASSWORD);
  }

  @After
  public void tearDown() throws Exception
  {
    driverHelper.quit();
  }

  protected void login(String username, String password)
  {
    navigate().logout();
    WebElement usernameElement = driverHelper.findElementById("loginPageComponent:loginForm:username");
    usernameElement.clear();
    usernameElement.sendKeys(username);
    WebElement passwordElement = driverHelper.findElementById("loginPageComponent:loginForm:password");
    passwordElement.clear();
    passwordElement.sendKeys(password);
    driverHelper.clickAndWaitForAjax(By.id("loginPageComponent:loginForm:loginButton"));
    driverHelper.assertAjaxElementContains(By.id("mainLayoutUnit"), "Home");
  }
  
  protected void createTask(String title, String description, int priority)
  {
    navigate().processList();
    driverHelper.findElementById("13F3D94E5C99F06F/WfJsf.ivp").click();
    driverHelper.findElementById("formRequest:caption").sendKeys(title);
    WebElement selectOneMenu = driverHelper.findElementById("formRequest:taskPriority");
    prime().selectOneMenu(selectOneMenu).selectItemByLabel(PRIORITIES[priority]);
    driverHelper.findElementById("formRequest:description").sendKeys(description);
    driverHelper.clickAndWaitForAjax(By.id("formRequest:submitJsf"));
  }
  
  protected void createHtmlTask(String title, String description)
  {
    navigate().processList();
    driverHelper.findElementById("13F3D94AF2F236BF/WfHtml.ivp").click();
    driverHelper.findElementById("caption").sendKeys(title);
    driverHelper.findElementById("description").sendKeys(description);
    driverHelper.clickAndWaitForAjax(By.id("submit"));
  }
  
  protected void createTaskWithCategory(String title, String description, int priority, String category, String process)
  {
    navigate().processList();
    driverHelper.findElementById("13F3D94E5C99F06F/WfJsf.ivp").click();
    driverHelper.findElementById("formRequest:caption").sendKeys(title);
    WebElement selectOneMenu = driverHelper.findElementById("formRequest:taskPriority");
    prime().selectOneMenu(selectOneMenu).selectItemByLabel(PRIORITIES[priority]);
    driverHelper.findElementById("formRequest:description").sendKeys(description);
    driverHelper.findElementById("formRequest:category").sendKeys(category);
    driverHelper.findElementById("formRequest:process").sendKeys(process);
    driverHelper.clickAndWaitForAjax(By.id("formRequest:submitJsf"));
  }

  protected void closeTask()
  {
    navigate().taskList();
    driverHelper.findElementById("taskLinkRow_0").click();
    driverHelper.clickAndWaitForAjax(By.id("formConfirmation:save"));
  }
  
  protected final void clickAdminElement(WebElement button, String failMessage)
  {
    assertThat(button.isEnabled())
      .as("Missing administration rights! "+ failMessage)
      .isTrue();
    button.click();
  }
  
  public WfNavigator navigate()
  {
    return new WfNavigator(driverHelper);
  }
  
  public PrimeFacesWidgetHelper prime()
  {
    return new PrimeFacesWidgetHelper(driverHelper);
  }
  
}