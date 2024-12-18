<%@ include file="manager.html"%>
<%@page import="java.io.*;"%>
<%@page import="java.sql.*;"%>
<html>
<body bgcolor=pink><center>
<form action="viewreview.jsp" method=post>
<table border=0 bgcolor=white cellspacing=10>
<tr>
<th colspan="2"  bgcolor=white><font color=indigo >View Review</font>
</tr></table><br>
<table border=1 bgcolor=gray cellspacing=10 cellpadding=5>
<tr><td>Project Name<td><input type=text name=t1></tr>
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
PreparedStatement ps=c.prepareStatement("select * from submitreview  where Project_Name=?");
ps.setString(1,de);
%>
<br><br><font color="indigo"><b><strong><h1>Submit Review</h1></strong></b></font>
<table bgcolor=gray border=1>
<tr>
<td>SID<td>EID<td>Project_Name<td>Review<td>Status<td>Date<td>Document
</tr>
<%
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>
<tr><td><%=rs.getInt(1)%></td><td><%=rs.getInt(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td></tr>
<%
}}}
catch(Exception e)
{
out.println(e);
}
%>
</table></form></center</body></html>
