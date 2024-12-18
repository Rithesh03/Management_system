<%@ include file="main.html"%>
<%@page import="java.io.*;"%>
<%@page import="java.sql.*;"%>
<html>
<body>
<center>
<br><form action="employee.jsp"method="post">
<table border=0 bgcolor="white"><tr><td><font size=6 color=indigo>Employee login</font></tr></table><br>
<table border=1 bgcolor=gray>
<tr><th>Employee ID<td><input type="Text"name=t1></tr>
<tr><th>Email<td><input type="email"name=t2 placeholder=abc@gmail.com></tr>
</tr>
<tr>
<th colspan="2"><input type="submit" name=b1 value="login">
</tr>
<%
try
{
int reg=Integer.parseInt(request.getParameter("t1"));
String e=request.getParameter("t2");
if(request.getParameter("b1")!=null)
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","root");
PreparedStatement ps=c.prepareStatement("select Reg_ID,Email from registration  where Reg_ID=? and Email=?");
ps.setInt(1,reg);
ps.setString(2,e);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
out.println("<script>alert('login success');</script>");
response.sendRedirect("employee.html");                
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
