<%@page import="java.io.*;"%>
<%@page import="java.sql.*;"%>
<html>
<head>
<style>
body{
background-repeat;no-repeat;
background-size:100% 100%;
background-attachment:fixed;
}
</style></head>
<body background=project6.jpg><center>
<form action="emid.jsp"method="post">
<table border=1 bgcolor=gray cellpadding=5 cellspacing=10><tr><h1><font color=indigo>Add Employee</font></h1></tr>
<tr><td>Employee Id<td><input type="Text"name=t1></tr>
<tr><td>Status<td><input type="Text"name=t2></tr>
<th colspan="2"><input type=submit name=b1 value="Accept">
</tr></table><br><br>
<a href="addemployee.jsp">Back</a>
<%
try
{
int eid=Integer.parseInt(request.getParameter("t1"));
String st=request.getParameter("t2");
if(request.getParameter("b1")!=null)
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","root");
PreparedStatement ps=c.prepareStatement("update registration set Status=? where Reg_ID=?");
ps.setInt(2,eid);
ps.setString(1,st);
int x=ps.executeUpdate();
if(x>0)
{
out.println("<script>alert('Update Success');</script>");
}
else
{
out.println("<script>alert('Update Fail');</script>");
}}}
catch(Exception e)
{
out.println(e);
}
%>
</table></form></center></body></html>
