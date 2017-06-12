package com.axonivy.engine.config.ui.web.test;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import org.apache.commons.lang3.RandomUtils;
import org.junit.After;
import org.junit.Before;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.axonivy.ivy.supplements.primeui.tester.AjaxHelper;
import com.axonivy.ivy.supplements.primeui.tester.PrimeUi;
import com.axonivy.ivy.supplements.primeui.tester.PrimeUi.Accordion;
import com.axonivy.ivy.supplements.primeui.tester.PrimeUi.Dialog;

public class BaseWebTest
{
  protected static final String USERNAME = "admin";
  protected static final String PASSWORD = "nimda";
  private static final String connectionUrl = "jdbc:mysql://zugtstdbsmys:3306/";

  protected String DBNAME;
  protected WebDriver driver;
  protected PrimeUi prime;
  private AjaxHelper ajax;
  protected boolean dbCreated = false;

  @Before
  public void setUp()
  {
    File geckodriver = new File("geckodriver/geckodriver.exe");
    System.setProperty("webdriver.gecko.driver", geckodriver.getAbsolutePath());
    driver = new FirefoxDriver();
    prime = new PrimeUi(driver);
    ajax = new AjaxHelper(driver);
    openConfigUi();
  }

  protected void openConfigUi()
  {
    String processStartLink = EngineUrl.process() + "/EngineConfigUi/157E64657EEBDD9C/start.ivp";
    System.out.println("ProcessStartlink: " + processStartLink);
    driver.get(processStartLink);
  }

  @After
  public void tearDown() throws Exception
  {
    dropMySqlDatabase();
    driver.quit();
  }

  protected void setMySqlConfig()
  {
    setConfigInternal();

    prime.selectOne(By.id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:databaseTypeDropdown"))
            .selectItemByLabel("MySQL");

    clearAndSend(By.id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:hostInput"), "zugtstdbsmys");
  }

  protected void createMySqlSysDb()
  {
    await(ExpectedConditions
            .elementToBeClickable(
            By.id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:connectionStateComponent:checkConnectionButton")));
    driver.findElement(
            By.id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:connectionStateComponent:checkConnectionButton"))
            .click();
    await(ExpectedConditions
            .textToBePresentInElementLocated(
                    By.id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:connectionStateComponent:connectionState"),
                    "failed"));
    openDbCreationDialog();

    createAndValidateDb();
  }

  protected void dropMySqlDatabase() throws Exception
  {
    if (!dbCreated)
    {
      System.out.println("DB wasn't created and therefore also not dropped.");
      return;
    }

    String command = "DROP DATABASE " + DBNAME;
    Connection con = DriverManager.getConnection(connectionUrl, USERNAME, PASSWORD);
    Statement stmt = con.createStatement();
    stmt.executeUpdate(command);
    con.close();
  }

  protected void openDbCreationDialog()
  {
    await(ExpectedConditions.presenceOfElementLocated(By
            .id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:createDatabaseButton")));

    await(ExpectedConditions.elementToBeClickable(By
            .id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:createDatabaseButton")));
    driver.findElement(
            By.id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:createDatabaseButton"))
            .click();
  }

  protected void createAndValidateDb()
  {
    await(ExpectedConditions.visibilityOfElementLocated(By
            .id("accordionPanel:systemDatabaseComponent:createDatabaseForm:dialogCreateDbButton")));
    driver.findElement(
            By.id("accordionPanel:systemDatabaseComponent:createDatabaseForm:dialogCreateDbButton")).click();

    await(ExpectedConditions.textToBePresentInElementLocated(
            By.id("accordionPanel:systemDatabaseComponent:creatingDatabaseForm:finishMessage"),
            "Successfully Finished!"));
    dbCreated = true;

    driver.findElement(
            By.id("accordionPanel:systemDatabaseComponent:creatingDatabaseForm:saveAndConnectButton"))
            .click();
  }

  protected void setConfigInternal()
  {
    openTab("System Database");
    prime.selectBooleanCheckbox(
            By.id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:defaultPortCheckbox"))
            .setChecked();

    DBNAME = "tmp_engineConfigUi_testing_" + RandomUtils.nextInt(11, Integer.MAX_VALUE);
    clearAndSend(By.id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:databaseNameInput"), DBNAME);

    clearAndSend(By.id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:usernameInput"), USERNAME);
    clearAndSend(By.id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:passwordInput"), PASSWORD);
  }

  protected void clearAndSend(By by, String string)
  {
    boolean notCorrect = true;
    while (notCorrect)
    {
      await(ExpectedConditions.not(ExpectedConditions.stalenessOf(driver.findElement(by))));
      driver.findElement(by).clear();
      driver.findElement(by).sendKeys(string);
      System.out.println(driver.findElement(by).getAttribute("value"));

      if (driver.findElement(by).getAttribute("value").equals(string))
        notCorrect = false;
    }
  }

  protected void testConnection()
  {
    openTab("System Database");
    driver.findElement(
            By.id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:connectionStateComponent:checkConnectionButton"))
            .click();
    await(ExpectedConditions
            .textToBePresentInElementLocated(
                    By.id("accordionPanel:systemDatabaseComponent:systemDatabaseForm:connectionStateComponent:connectionState"),
                    "Connected"));
  }

  protected void addAdmin(String name)
  {
    Dialog dialog = prime.dialog(By.id("accordionPanel:administratorsComponent:addAdminDialog"));
    dialog.waitForVisibility(true);

    clearAndSend(By.id("accordionPanel:administratorsComponent:addAdminForm:newName"), name);
    clearAndSend(By.id("accordionPanel:administratorsComponent:addAdminForm:newFullname"), "AXONIVY");
    clearAndSend(By.id("accordionPanel:administratorsComponent:addAdminForm:newEmail"), "support@ivyteam.ch");
    clearAndSend(By.id("accordionPanel:administratorsComponent:addAdminForm:newPassword"), "password");

    driver.findElement(By.id("accordionPanel:administratorsComponent:addAdminForm:addAdminDialogButton"))
            .click();
    dialog.waitToBeClosedOrError();
  }

  protected void openTab(String tabName)
  {
    Accordion accordion = prime.accordion(By.id("accordionPanel"));
    accordion.openTab(tabName);
  }

  protected <T> T await(ExpectedCondition<T> condition)
  {
    return ajax.await(condition);
  }

  public void saveAll()
  {
    driver.findElement(By.id("saveAll")).click();
  }
}