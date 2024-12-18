<%@ include file="main.html"%>
<%@page import="java.io.*;"%>
<html>
<body background=img3.jpg"><center>
<form action="admin1.jsp" method="post">
<br><table border=0 bgcolor=white >
<tr>
<th><font color="indigo" size=6>ADMIN LOGIN
</tr></table><br>
<table border=1 bgcolor=gray >
<tr><td>NAME	
<td><input type=text name=t1></tr>
<tr><td>PASSWORD
<td><input type=PASSWORD name=t2></tr>
<tr>
<th colspan =2><input type=submit name=b1 value=login>
</tr>
<%
try
{
String un=request.getParameter("t1");
String pw=request.getParameter("t2");
if(request.getParameter("b1")!=null)
{
if(un.equalsIgnoreCase("admin") && pw.equalsIgnoreCase("admin"))
{
%>
<script>
alert("Login Success");
</script>
<%
response.sendRedirect("admin.html");
}
else
{
%>
<script>
alert("Login Fail");
</script>
<%
}}}
catch(Exception e)
{
out.println(e);
}
%>
</table></form></center></body></html>
