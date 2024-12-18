<%@ include file="employee.html"%>
<%@ page import="java.io.*;"%>
<%@ page import="java.sql.*;"%>
<html>
<body bgcolor=pink><center>
<form action="viewsendinfo.jsp" method=post>
<table></table>
<table border=0 cellpadding=5 cellspacing=5><tr>
<tr><td>Department<td><input type=text name=t1></tr>
<tr><th colspan="2"><input type=submit name=b1 value=click></tr>
</table>
<%
try
{
String de=request.getParameter("t1");
if(request.getParameter("b1")!=null)
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","root");
PreparedStatement ps=c.prepareStatement("select * from sendinformation  where Department=?");
ps.setString(1,de);
%>
<br><br><font color="indigo"><b><strong><h1>View Information</h1></strong></b></font>
<table border=1><tr>
<td>Circular_NO
<td>Name<td>Department<td>Message<td>Date</tr>
<%
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>
<tr><td><%=rs.getInt(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td></tr>
<%
}}}
catch(Exception e)
{
out.println(e);
}
%>
</table></form></center></body></html>
