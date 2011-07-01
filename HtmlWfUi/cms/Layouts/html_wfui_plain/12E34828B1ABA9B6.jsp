<%@ page import="ch.ivyteam.ivy.page.engine.jsp.IvyJSP"%>
<jsp:useBean id="ivy" class="ch.ivyteam.ivy.page.engine.jsp.IvyJSP" scope="session"/> 
<% ivy.setRequest(request); %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="expires" content="0">
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel="stylesheet" type="text/css" href="<%=ivy.style()%>"/>
	<title>Xpert.ivy Workflow</title>
</head>

<body>

	<div id="CompletePage">
		<div id="PageHeaderLogo">
				<%=ivy.cms.co("/Project/Banner")%>
		</div>

		<div id="PageNavigation">
			&nbsp;&nbsp;
		</div>

		<div id="CaseHeader">
			<h1><%=ivy.content("Caption","String")%></h1>
		</div>
		
		<div id="TaskHeader">

			<div>
				<%=ivy.content("Explain","Text")%>
			</diV>
			<h2></h2>
		</div>

		<div id="PageContent">
			<jsp:include page='<%=ivy.panel("Panel1")%>' flush="true"/>

		</div>
		<div id="PageFooter">
		
		<%@ page import="java.util.Date"%>
		<%@ page import="java.text.DateFormat"%>
		<%@ page import="java.util.Locale"%>
		<%@ page import="ch.ivyteam.ivy.Advisor"%>
		<%
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT, Locale.GERMAN);
			Date date = new Date();
			String dateTime = dateFormat.format(date);
		%>

		Powered by <%=ch.ivyteam.ivy.Advisor.getAdvisor().getApplicationName()%>
		<%=ch.ivyteam.ivy.Advisor.getAdvisor().getVersion()%> 
		Copyright &copy; 2001 - <%=date.getYear() + 1900%> ivyTeam 
		</div>
		<div style="position:absolute; right:0px; padding-right:10px; "> <%=dateTime%> </div>
	</div>

</body>