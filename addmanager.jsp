<%@ include file="admin.html"%>
<%@page import="java.io.*;"%>
<%@page import="java.sql.*;"%>
<%@page import="java.util.*;"%>
<html>
<body><center>
<form action="addmanager.jsp" method=post>
<table border=0 bgcolor=white cellspacing=2 cellpadding=2>
<tr><td align=center><font size=6 color=indigo><b>Add Manager</b></font></tr><table>
<table border=1 bgcolor=gray cellspacing=5 cellpadding=5>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","root");
PreparedStatement ps=c.prepareStatement("select max(mid) from addmanager");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
int a=rs.getInt(1);
int b=a+1;
out.println("<tr><th>MID<td><input type=text name=t1 value="+b+" readonly></tr>");
%>
<tr><th>Name<td><input type=text name=t2></tr>
<tr><th>Qualification<td><input type=text name=t3></tr>
<tr><th>Experience<td><input type=text name=t4></tr>
<tr><th>Department<td><input type=text name=t5></tr>
<tr><th>Phone_No<td><input type=text name=t6 ></tr>
<tr><th>Email<td><input type=email name=t7 placeholder=abc@gmail.com></tr>
<tr><th>Address<td><textarea name=t8></textarea></tr>
<tr><th>password<td><input type=password name=t9></tr>
<tr><th colspan="2"><input type=submit name=b1 value=Click></tr>
<%
Random ob=new Random();
int c1=ob.nextInt(10000);
int mi=Integer.parseInt(request.getParameter("t1"));
String un=request.getParameter("t2");
String q=request.getParameter("t3");
String e=request.getParameter("t4");
String de=request.getParameter("t5");
String pn=request.getParameter("t6");
String em=request.getParameter("t7");
String ad=request.getParameter("t8");
String pw=request.getParameter("t9");

if(request.getParameter("b1")!=null)
{
PreparedStatement ps1=c.prepareStatement("insert into addmanager value(?,?,?,?,?,?,?,?,?)");
ps1.setInt(1,mi);
ps1.setString(2,un);
ps1.setString(3,q);
ps1.setString(4,e);
ps1.setString(5,de);
ps1.setString(6,pn);
ps1.setString(7,em);
ps1.setString(8,ad);
ps1.setString(9,pw);
int x=ps1.executeUpdate();
if(x>0)
 {
out.println("<script> alert('Your otp'+"+c1+"); </script>");
 }
else
  {
out.println("<script> alert('Insert Fail'); </script>");
  }}}}
catch(Exception e)
{
out.println(e);
}
%>
</table></form></center></body>
</html>
