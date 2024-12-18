<%@ include file="manager.html"%>
<%@page import="java.io.*;"%>
<%@page import="java.sql.*;"%>
<html>
<body bgcolor=pink><center>
<form action="addemployee.jsp" method=post>
<br>
<table border=1 bgcolor=white cellspacing=10 cellpadding=0>
<tr>
<th colspan="2"><font color=indigo >Add Employee</font>
</tr></table><br>
<table border=1 bgcolor=gray cellspacing=10 cellpadding=2>
<tr><td>Date<td><input type=date name=d12></tr>
<tr><th colspan="2"><input type=submit name=b1 value=click>
</table>
<%
try
{
String da=request.getParameter("d12");
if(request.getParameter("b1")!=null)
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","root");
PreparedStatement ps=c.prepareStatement("select * from registration  where Date=?");
ps.setString(1,da);
%>
<br><br><font color="indigo"><b><strong><h1>Registration Form</h1></strong></b></font>
<table bgcolor=gray border=1><tr>
<td>Reg_ID
<td>Name<td>Gender<td>DOB<td>Email<td>Phone_No<td>Address<td>Department<td>Project_Name<td>Domain
<td>Date<td>Status</tr>
<%
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>
<tr><td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td><%=rs.getString(9)%></td>
<td><%=rs.getString(10)%></td>
<td><%=rs.getString(11)%></td>
<td><%=rs.getString(12)%></td></tr>
<tr><td  colspan="12" align=center><a href="emid.jsp"><input type=button name=b2 value=click></a></tr>
<%
}}}
catch(Exception e)
{
out.println(e);
}
%>
</table></form></center></body></html>
