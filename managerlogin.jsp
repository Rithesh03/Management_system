<%@ include file="main.html"%>
<%@page import="java.io.*;"%>
<%@page import="java.sql.*;"%>
<html>
<body>
<center>
<br><form action="managerlogin.jsp"method="post">
<table border=0 bgcolor="white"><tr><td><font size=6 color=indigo>Manager login</font></tr></table><br>
<table  border=1 bgcolor=gray>
<tr><th>User Name<td><input type="Text"name=t1></tr>
<tr><th>Password<td><input type="password"name=t2></tr>
</tr><tr><th colspan="2"><input type="submit" name=b1 value="login"></tr>
<%
try
{
String un=request.getParameter("t1");
String pw=request.getParameter("t2");
if(request.getParameter("b1")!=null)
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","root");
PreparedStatement ps=c.prepareStatement("select Name,Password from addmanager  where Name=? and Password=?");
ps.setString(1,un);
ps.setString(2,pw);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
out.println("<script>alert('login success');</script>");
response.sendRedirect("manager.html");                                                                                                                       
}
else
{
out.println("<script>alert('login fail');</script>");
}}}
catch(Exception e)
{
out.println(e);
}
%>
</table></form></center></body></html>
