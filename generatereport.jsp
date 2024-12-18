<%@ include file="admin.html"%>
<%@page import="java.io.*;"%>
<%@page import="java.sql.*;"%>
<html>
<body bgcolor="cyan"><center>
<form action="generatereport.jsp" method="post">
<br>
<table border=0 bgcolor=white cellspacing=10 cellpadding=5>
<tr><td align=center><font color="indigo"><b><strong>Generate Report
</strong></b></font></tr></table><br>
<table border=1 bgcolor=gray cellspacing=10 cellpadding=5>
<tr>
<td>Department<td><input type="text" name=t1></tr>
<tr><td>Manager<td><input type="text" name=t2></tr>
<tr><td>Project<td><input type="text" name=t3></tr>
<tr><td>Domain<td><input type="text" name=t4></tr>
<tr><td>Rating<td><input type="radio" name=t5 value=1>1
<input type="radio" name=t5 value=2>2<input type="radio" name=t5 value=3>3
<input type="radio" name=t5 value=4>4<input type="radio" name=t5 value=5>5
</tr><tr align=center><td><input type="submit" name=b1 value="Generate">
<td><input type="submit" name=b2 value="Clear">
</tr>
<%
try
{
String de=request.getParameter("t1");
String ma=request.getParameter("t2");
String pr=request.getParameter("t3");
String dom=request.getParameter("t4");
String ra=request.getParameter("t5");

if(request.getParameter("b1")!=null)
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","root");
PreparedStatement ps=c.prepareStatement("insert into generatereport values(?,?,?,?,?)");
ps.setString(1,de);
ps.setString(2,ma);
ps.setString(3,pr);
ps.setString(4,dom);
ps.setString(5,ra);

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
