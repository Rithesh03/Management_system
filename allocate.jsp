<%@ include file="manager.html"%>
<%@page import="java.io.*;"%>
<%@page import="java.sql.*;"%>
<html>
<body bgcolor="cyan"><center>
<form action="allocate.jsp" method="post">
<table border=1 bgcolor=white cellspacing=10 cellpadding=5>
<tr><th colspan="2"><font color=indigo size="6">Allocate Schedule</font>
</tr></table><br>
<table border=1 bgcolor=gray cellspacing=10 cellpadding=5>
<tr><th>Schedule No<td><input type="number" name=t1>
</tr>
<tr><th>Department<td><input type="text" name=t2>
</tr>
<tr><th>Start Date<td><input type="date" name=t3>
</tr>
<tr><th>End Date<td><input type="date" name=t4>
</tr>
<tr>
<th>Needed<td><input type="text" name=t5>
</tr>
<tr><th>Status<td><input type="text" name=t6></tr>
<tr><th colspan="2"><input type="submit" name=b1 value="Allocate">
</tr>
<%
try
{
int sn=Integer.parseInt(request.getParameter("t1"));
String d=request.getParameter("t2");
String sd=request.getParameter("t3");
String ed=request.getParameter("t4");
String nee=request.getParameter("t5");
String st=request.getParameter("t6");
if(request.getParameter("b1")!=null)
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","root");
PreparedStatement ps=c.prepareStatement("insert into allocate values(?,?,?,?,?,?)");
ps.setInt(1,sn);
ps.setString(2,d);
ps.setString(3,sd);
ps.setString(4,ed);
ps.setString(5,nee);
ps.setString(6,st);
int x=ps.executeUpdate();
if(x>0)
{
out.println("<script>alert('Insert success');</script>");
}
else
{
out.println("<script>alert('Insert fail');</script>");
}}}
catch(Exception e)
{
out.println(e);
}
%>
</table></form></center></body></html>
