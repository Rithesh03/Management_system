<%@ include file="employee.html"%>
<%@ page import="java.io.*;"%>
<%@ page import="java.sql.*;"%>
<html>
<body bgcolor=pink><center>
<table></table>
<form action="checkstatus.jsp" method=post>
<font color="indigo" size=6><b><strong>Check Status</strong></b></font>
<table border=0 cellspacing=10 cellpadding=5>
<tr><td>Submit ID<td><input type=text name=t1></tr>
<tr><th colspan="2"><input type=submit name=b1 value=click>
</table>
<%
try
{
String sid=request.getParameter("t1");
if(request.getParameter("b1")!=null)
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","root");
PreparedStatement ps=c.prepareStatement("select Status from submitreview  where SID=?");
ps.setString(1,sid);
%>

<table border=0>
<tr>
Your Status</tr>
<%
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>
<tr><td><%=rs.getString(1)%></td>
</tr>
<%
}}}
catch(Exception e)
{
out.println(e);
}
%>
</table></form></center></body></html>
