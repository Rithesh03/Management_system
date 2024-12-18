<%@ include file="manager.html"%>
<%@page import="java.io.*;"%>
<%@page import="java.sql.*;"%>
<%@page import="java.util.*;"%>
<html>
<body bgcolor="pink"><center>
<form action="sendinfo.jsp" method=post>
<table border=1 bgcolor=white cellspacing=10 >
<tr><td colspan=2 align=center><font color=indigo><b>Send Information</b></tr></table><br>
<table border=1 bgcolor=gray cellspacing=10 cellpadding=5>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","root");
PreparedStatement ps=c.prepareStatement("select max(Circular_NO) from sendinformation");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
int a=rs.getInt(1);
int b=a+1;
out.println("<tr><th>Circular No<td><input type=text name=t1 value="+b+" readonly></tr>");
%>
<tr><th>Name<td><input type=text name=t2></tr>
<tr><th>Department<td><input type=text name=t3></tr>
<tr><th>Message<td><input type=text name=t4></tr>
<tr><th>Date<td><input type=date name=t5></tr>
<tr><th colspan="2"><input type=submit name=b1 value=Submit></tr>
<%
Random ob=new Random();
int c1=ob.nextInt(10000);
int cn=Integer.parseInt(request.getParameter("t1"));
String an=request.getParameter("t2");
String de=request.getParameter("t3");
String me=request.getParameter("t4");
String da=request.getParameter("t5");
if(request.getParameter("b1")!=null)
{
PreparedStatement ps1=c.prepareStatement("insert into sendinformation value(?,?,?,?,?)");
ps1.setInt(1,cn);
ps1.setString(2,an);
ps1.setString(3,de);
ps1.setString(4,me);
ps1.setString(5,da);
int x=ps1.executeUpdate();
if(x>0)
 {
out.println("<script> alert('Your otp'+"+c1+"); </script>");
 }
else
  {
out.println("<script> alert('Insert Fail'); </script>");
  }}}
catch(Exception e)
{
out.println(e);
}}
%>
</table></form></center></body></html>
