<%@ include file="admin.html"%>
<%@page import="java.io.*;"%>
<%@page import="java.sql.*;"%>
<html>
<body bgcolor=pink><center>
<form action="acceptschedule.jsp" method=post>
<table border=0 bgcolor=white cellspacing=10 cellpadding=5>
<tr><td align=center><font size=6 color=indigo><b>Accept Schedule</b></font></tr></table><br>
<table border=1 bgcolor=gray cellspacing=10 cellpadding=5 >
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
PreparedStatement ps=c.prepareStatement("select * from allocate  where Department=?");
ps.setString(1,de);
%>
<br>
<table bgcolor=gray border=1><tr>
<td>Schedule_No
<td>Department
<td>Start_Date
<td>End_Date
<td>Needed
<td>Status
</tr>
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
</tr>
<tr><td colspan="6" align=center><a href="scno.jsp"><input type=button name=b2 value=click></a></tr>
<%
}}}
catch(Exception e)
{
out.println(e);
}
%>
</table></form></center></body></html>
