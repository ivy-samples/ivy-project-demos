[Ivy]
[>Created: Mon Jul 03 14:53:33 CEST 2017]
1518C122914A55FA 3.20 #module
>Proto >Proto Collection #zClass
Cs0 CaseListComponentProcess Big #zClass
Cs0 RD #cInfo
Cs0 #process
Cs0 @TextInP .ui2RdDataAction .ui2RdDataAction #zField
Cs0 @TextInP .rdData2UIAction .rdData2UIAction #zField
Cs0 @TextInP .resExport .resExport #zField
Cs0 @TextInP .type .type #zField
Cs0 @TextInP .processKind .processKind #zField
Cs0 @AnnotationInP-0n ai ai #zField
Cs0 @TextInP .xml .xml #zField
Cs0 @TextInP .responsibility .responsibility #zField
Cs0 @RichDialogInitStart f0 '' #zField
Cs0 @RichDialogMethodStart f2 '' #zField
Cs0 @RichDialogProcessEnd f10 '' #zField
Cs0 @RichDialogProcessEnd f18 '' #zField
Cs0 @GridStep f19 '' #zField
Cs0 @PushWFArc f25 '' #zField
Cs0 @PushWFArc f5 '' #zField
Cs0 @GridStep f1 '' #zField
Cs0 @PushWFArc f4 '' #zField
Cs0 @PushWFArc f3 '' #zField
>Proto Cs0 Cs0 CaseListComponentProcess #zField
Cs0 f0 guid 13F1D8A32D5EA95D #txt
Cs0 f0 type ch.ivyteam.wf.components.CaseListComponent.CaseListComponentData #txt
Cs0 f0 method start(String,ch.ivyteam.wf.history.AbstractCaseLazyDataModel) #txt
Cs0 f0 disableUIEvents true #txt
Cs0 f0 inParameterDecl 'ch.ivyteam.ivy.richdialog.exec.RdMethodCallEvent methodEvent = event as ch.ivyteam.ivy.richdialog.exec.RdMethodCallEvent;
<java.lang.String caseListMode,ch.ivyteam.wf.history.AbstractCaseLazyDataModel cases> param = methodEvent.getInputArguments();
' #txt
Cs0 f0 inParameterMapAction 'out.caseListMode=param.caseListMode;
out.cases=param.cases;
' #txt
Cs0 f0 outParameterDecl '<> result;
' #txt
Cs0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(String,LazyDataModel)</name>
        <nameStyle>27,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Cs0 f0 51 51 26 26 -61 26 #rect
Cs0 f0 @|RichDialogInitStartIcon #fIcon
Cs0 f0 -1|-1|-9671572 #nodeStyle
Cs0 f2 guid 13F75D933E4D0972 #txt
Cs0 f2 type ch.ivyteam.wf.components.CaseListComponent.CaseListComponentData #txt
Cs0 f2 method update() #txt
Cs0 f2 disableUIEvents false #txt
Cs0 f2 inParameterDecl 'ch.ivyteam.ivy.richdialog.exec.RdMethodCallEvent methodEvent = event as ch.ivyteam.ivy.richdialog.exec.RdMethodCallEvent;
<> param = methodEvent.getInputArguments();
' #txt
Cs0 f2 outParameterDecl '<> result;
' #txt
Cs0 f2 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>update()</name>
        <nameStyle>8,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Cs0 f2 51 147 26 26 -23 15 #rect
Cs0 f2 @|RichDialogMethodStartIcon #fIcon
Cs0 f2 -1|-1|-9671572 #nodeStyle
Cs0 f10 type ch.ivyteam.wf.components.CaseListComponent.CaseListComponentData #txt
Cs0 f10 339 147 26 26 0 12 #rect
Cs0 f10 @|RichDialogProcessEndIcon #fIcon
Cs0 f10 -1|-1|-9671572 #nodeStyle
Cs0 f18 type ch.ivyteam.wf.components.CaseListComponent.CaseListComponentData #txt
Cs0 f18 339 51 26 26 0 12 #rect
Cs0 f18 @|RichDialogProcessEndIcon #fIcon
Cs0 f18 -1|-1|-9671572 #nodeStyle
Cs0 f19 actionDecl 'ch.ivyteam.wf.components.CaseListComponent.CaseListComponentData out;
' #txt
Cs0 f19 actionTable 'out=in;
' #txt
Cs0 f19 actionCode 'import ch.ivyteam.ivy.workflow.CaseState;
import ch.ivyteam.wf.history.AdminCaseLazyDataModel;
import ch.ivyteam.wf.history.UserCaseLazyDataModel;

in.cases.setDataTableId("caseListCompontent:caseListForm:caseTable");

out.states = CaseState.values();

ch.ivyteam.ivy.request.impl.HttpProcessRequest r = ivy.request as ch.ivyteam.ivy.request.impl.HttpProcessRequest;
r.getHttpServletRequest().getSession().setAttribute("ch.ivy.wfui.returnUrl", "ivy.html.DefaultTaskListPage");' #txt
Cs0 f19 type ch.ivyteam.wf.components.CaseListComponent.CaseListComponentData #txt
Cs0 f19 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>set returnUrl</name>
        <nameStyle>13,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Cs0 f19 152 42 112 44 -40 -7 #rect
Cs0 f19 @|StepIcon #fIcon
Cs0 f19 -1|-1|-9671572 #nodeStyle
Cs0 f25 expr out #txt
Cs0 f25 264 64 339 64 #arcP
Cs0 f5 expr out #txt
Cs0 f5 77 64 152 64 #arcP
Cs0 f1 actionDecl 'ch.ivyteam.wf.components.CaseListComponent.CaseListComponentData out;
' #txt
Cs0 f1 actionTable 'out=in;
out.categories=in.cases.getCaseCategories();
out.stages=in.cases.getCaseStages();
' #txt
Cs0 f1 security system #txt
Cs0 f1 type ch.ivyteam.wf.components.CaseListComponent.CaseListComponentData #txt
Cs0 f1 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>get categories and stages</name>
        <nameStyle>25,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Cs0 f1 128 138 160 44 -71 -8 #rect
Cs0 f1 @|StepIcon #fIcon
Cs0 f4 expr out #txt
Cs0 f4 288 160 339 160 #arcP
Cs0 f3 expr out #txt
Cs0 f3 77 160 128 160 #arcP
>Proto Cs0 .type ch.ivyteam.wf.components.CaseListComponent.CaseListComponentData #txt
>Proto Cs0 .processKind HTML_DIALOG #txt
>Proto Cs0 -8 -8 16 16 16 26 #rect
>Proto Cs0 '' #fIcon
Cs0 f19 mainOut f25 tail #connect
Cs0 f25 head f18 mainIn #connect
Cs0 f0 mainOut f5 tail #connect
Cs0 f5 head f19 mainIn #connect
Cs0 f1 mainOut f4 tail #connect
Cs0 f4 head f10 mainIn #connect
Cs0 f2 mainOut f3 tail #connect
Cs0 f3 head f1 mainIn #connect
