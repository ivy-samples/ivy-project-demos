[Ivy]
[>Created: Mon Jan 18 14:19:23 CET 2016]
15254DF1CAEC5132 3.18 #module
>Proto >Proto Collection #zClass
As0 AcceptProcurementRequestProcess Big #zClass
As0 RD #cInfo
As0 #process
As0 @TextInP .ui2RdDataAction .ui2RdDataAction #zField
As0 @TextInP .rdData2UIAction .rdData2UIAction #zField
As0 @TextInP .resExport .resExport #zField
As0 @TextInP .type .type #zField
As0 @TextInP .processKind .processKind #zField
As0 @AnnotationInP-0n ai ai #zField
As0 @MessageFlowInP-0n messageIn messageIn #zField
As0 @MessageFlowOutP-0n messageOut messageOut #zField
As0 @TextInP .xml .xml #zField
As0 @TextInP .responsibility .responsibility #zField
As0 @RichDialogInitStart f0 '' #zField
As0 @RichDialogProcessEnd f1 '' #zField
As0 @RichDialogProcessStart f3 '' #zField
As0 @RichDialogEnd f4 '' #zField
As0 @PushWFArc f5 '' #zField
As0 @PushWFArc f2 '' #zField
>Proto As0 As0 AcceptProcurementRequestProcess #zField
As0 f0 guid 14FAE0B7D586F3B8 #txt
As0 f0 type workflow.demo.AcceptProcurementRequest.AcceptProcurementRequestData #txt
As0 f0 method start(workflow.demo.ProcurementRequestData) #txt
As0 f0 disableUIEvents true #txt
As0 f0 inParameterDecl 'ch.ivyteam.ivy.richdialog.exec.RdMethodCallEvent methodEvent = event as ch.ivyteam.ivy.richdialog.exec.RdMethodCallEvent;
<workflow.demo.ProcurementRequestData procurementRequestData> param = methodEvent.getInputArguments();
' #txt
As0 f0 inParameterMapAction 'out.procurementRequestData=param.procurementRequestData;
' #txt
As0 f0 outParameterDecl '<java.lang.Boolean accepted> result;
' #txt
As0 f0 outParameterMapAction 'result.accepted=in.accepted;
' #txt
As0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
        <nameStyle>7,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
As0 f0 83 51 26 26 -16 15 #rect
As0 f0 @|RichDialogInitStartIcon #fIcon
As0 f1 type workflow.demo.AcceptProcurementRequest.AcceptProcurementRequestData #txt
As0 f1 339 51 26 26 0 12 #rect
As0 f1 @|RichDialogProcessEndIcon #fIcon
As0 f3 guid 14FAE0B7D732DF57 #txt
As0 f3 type workflow.demo.AcceptProcurementRequest.AcceptProcurementRequestData #txt
As0 f3 actionDecl 'workflow.demo.AcceptProcurementRequest.AcceptProcurementRequestData out;
' #txt
As0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
As0 f3 83 147 26 26 -15 12 #rect
As0 f3 @|RichDialogProcessStartIcon #fIcon
As0 f4 type workflow.demo.AcceptProcurementRequest.AcceptProcurementRequestData #txt
As0 f4 guid 14FAE0B7D7479234 #txt
As0 f4 211 147 26 26 0 12 #rect
As0 f4 @|RichDialogEndIcon #fIcon
As0 f5 expr out #txt
As0 f5 109 160 211 160 #arcP
As0 f2 expr out #txt
As0 f2 109 64 339 64 #arcP
>Proto As0 .type workflow.demo.AcceptProcurementRequest.AcceptProcurementRequestData #txt
>Proto As0 .processKind HTML_DIALOG #txt
>Proto As0 -8 -8 16 16 16 26 #rect
>Proto As0 '' #fIcon
As0 f3 mainOut f5 tail #connect
As0 f5 head f4 mainIn #connect
As0 f0 mainOut f2 tail #connect
As0 f2 head f1 mainIn #connect