[Ivy]
[>Created: Mon May 09 16:23:37 CEST 2016]
154616078A1D629D 3.18 #module
>Proto >Proto Collection #zClass
ce0 callOwnPersonRestService Big #zClass
ce0 B #cInfo
ce0 #process
ce0 @TextInP .resExport .resExport #zField
ce0 @TextInP .type .type #zField
ce0 @TextInP .processKind .processKind #zField
ce0 @AnnotationInP-0n ai ai #zField
ce0 @MessageFlowInP-0n messageIn messageIn #zField
ce0 @MessageFlowOutP-0n messageOut messageOut #zField
ce0 @TextInP .xml .xml #zField
ce0 @TextInP .responsibility .responsibility #zField
ce0 @StartRequest f0 '' #zField
ce0 @EndTask f1 '' #zField
ce0 @GridStep f3 '' #zField
ce0 @PushWFArc f4 '' #zField
ce0 @PushWFArc f2 '' #zField
ce0 @StartRequest f5 '' #zField
ce0 @EndTask f6 '' #zField
ce0 @RichDialog f8 '' #zField
ce0 @PushWFArc f9 '' #zField
ce0 @PushWFArc f7 '' #zField
ce0 @InfoButton f10 '' #zField
ce0 @AnnotationArc f11 '' #zField
ce0 @InfoButton f12 '' #zField
ce0 @AnnotationArc f13 '' #zField
>Proto ce0 ce0 callOwnPersonRestService #zField
ce0 f0 outLink listPersons.ivp #txt
ce0 f0 type com.axonivy.connectivity.Data #txt
ce0 f0 inParamDecl '<> param;' #txt
ce0 f0 actionDecl 'com.axonivy.connectivity.Data out;
' #txt
ce0 f0 guid 154616078B31F8AD #txt
ce0 f0 requestEnabled true #txt
ce0 f0 triggerEnabled false #txt
ce0 f0 callSignature listPersons() #txt
ce0 f0 persist false #txt
ce0 f0 startName 'List REST result in the runtime log' #txt
ce0 f0 taskData 'TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody' #txt
ce0 f0 showInStartList 1 #txt
ce0 f0 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();
import ch.ivyteam.ivy.request.impl.DefaultCalendarProxy;
DefaultCalendarProxy calendarProxy = ivy.cal as DefaultCalendarProxy;
taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
ce0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>listPersons.ivp</name>
        <nameStyle>15,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
ce0 f0 @C|.responsibility Everybody #txt
ce0 f0 81 113 30 30 -40 17 #rect
ce0 f0 @|StartRequestIcon #fIcon
ce0 f1 type com.axonivy.connectivity.Data #txt
ce0 f1 337 113 30 30 0 15 #rect
ce0 f1 @|EndIcon #fIcon
ce0 f3 actionDecl 'com.axonivy.connectivity.Data out;
' #txt
ce0 f3 actionTable 'out=in;
' #txt
ce0 f3 actionCode 'import java.util.UUID;
import com.axonivy.connectivity.Person;
import ch.ivyteam.ivy.rest.client.GenericTypes;

List<Person> persons = ivy.rest.client("personService")
	.request().get(GenericTypes.listOf(Person.class)) as List<Person>;
ivy.log.info(persons);' #txt
ce0 f3 type com.axonivy.connectivity.Data #txt
ce0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Call PersonService</name>
        <nameStyle>18,7
</nameStyle>
    </language>
</elementInfo>
' #txt
ce0 f3 168 106 112 44 -52 -8 #rect
ce0 f3 @|StepIcon #fIcon
ce0 f4 expr out #txt
ce0 f4 111 128 168 128 #arcP
ce0 f2 expr out #txt
ce0 f2 280 128 337 128 #arcP
ce0 f5 outLink personManager.ivp #txt
ce0 f5 type com.axonivy.connectivity.Data #txt
ce0 f5 inParamDecl '<> param;' #txt
ce0 f5 actionDecl 'com.axonivy.connectivity.Data out;
' #txt
ce0 f5 guid 15470DDE0EEFDF4F #txt
ce0 f5 requestEnabled true #txt
ce0 f5 triggerEnabled false #txt
ce0 f5 callSignature personManager() #txt
ce0 f5 persist false #txt
ce0 f5 startName 'Accesses own REST service' #txt
ce0 f5 taskData 'TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody' #txt
ce0 f5 showInStartList 1 #txt
ce0 f5 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();
import ch.ivyteam.ivy.request.impl.DefaultCalendarProxy;
DefaultCalendarProxy calendarProxy = ivy.cal as DefaultCalendarProxy;
taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
ce0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>personManager.ivp</name>
        <nameStyle>17,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
ce0 f5 @C|.responsibility Everybody #txt
ce0 f5 81 257 30 30 -52 17 #rect
ce0 f5 @|StartRequestIcon #fIcon
ce0 f6 type com.axonivy.connectivity.Data #txt
ce0 f6 337 257 30 30 0 15 #rect
ce0 f6 @|EndIcon #fIcon
ce0 f8 targetWindow NEW:card: #txt
ce0 f8 targetDisplay TOP #txt
ce0 f8 richDialogId com.axonivy.connectivity.rest.PersonManager #txt
ce0 f8 startMethod start() #txt
ce0 f8 type com.axonivy.connectivity.Data #txt
ce0 f8 requestActionDecl '<> param;' #txt
ce0 f8 responseActionDecl 'com.axonivy.connectivity.Data out;
' #txt
ce0 f8 responseMappingAction 'out=in;
' #txt
ce0 f8 windowConfiguration '* ' #txt
ce0 f8 isAsynch false #txt
ce0 f8 isInnerRd false #txt
ce0 f8 userContext '* ' #txt
ce0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Restful
PersonManager</name>
        <nameStyle>8,7
13,7
</nameStyle>
    </language>
</elementInfo>
' #txt
ce0 f8 168 248 112 48 -32 -17 #rect
ce0 f8 @|RichDialogIcon #fIcon
ce0 f9 expr out #txt
ce0 f9 111 272 168 272 #arcP
ce0 f7 expr out #txt
ce0 f7 280 272 337 272 #arcP
ce0 f10 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Invoke our simple REST service
and log it''s response</name>
        <nameStyle>31,7
21,7
</nameStyle>
    </language>
</elementInfo>
' #txt
ce0 f10 344 42 192 44 -87 -16 #rect
ce0 f10 @|IBIcon #fIcon
ce0 f11 344 64 265 106 #arcP
ce0 f11 0 0.7097590884517753 0 0 #arcLabel
ce0 f12 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Use all methods of our simple REST service
as backend for a PersonManger dialog</name>
        <nameStyle>43,7
36,7
</nameStyle>
    </language>
</elementInfo>
' #txt
ce0 f12 344 178 256 44 -121 -16 #rect
ce0 f12 @|IBIcon #fIcon
ce0 f13 344 200 264 248 #arcP
>Proto ce0 .type com.axonivy.connectivity.Data #txt
>Proto ce0 .processKind NORMAL #txt
>Proto ce0 0 0 32 24 18 0 #rect
>Proto ce0 @|BIcon #fIcon
ce0 f0 mainOut f4 tail #connect
ce0 f4 head f3 mainIn #connect
ce0 f3 mainOut f2 tail #connect
ce0 f2 head f1 mainIn #connect
ce0 f5 mainOut f9 tail #connect
ce0 f9 head f8 mainIn #connect
ce0 f8 mainOut f7 tail #connect
ce0 f7 head f6 mainIn #connect
ce0 f10 ao f11 tail #connect
ce0 f11 head f3 @CG|ai #connect
ce0 f12 ao f13 tail #connect
ce0 f13 head f8 @CG|ai #connect