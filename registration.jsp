<%@ include file="main.html"%>
<%@page import="java.io.*;"%>
<%@page import="java.sql.*;"%>
<%@page import="java.util.*;"%>
<html>
<body><center><br>
<form action="registration.jsp" method=post>
<table border=0  bgcolor=white>
<tr>
<th><font color="indigo" size=4><u><b><strong>Registration Form</strong></b></u></font></tr></table>
<table border=1 cellpadding=5 bgcolor=gray>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","root");
PreparedStatement ps=c.prepareStatement("select max(Reg_ID) from registration");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
int a=rs.getInt(1);
int b=a+1;
out.println("<tr><td>Reg-ID<td><input type=text name=t1 value="+b+" readonly></tr>");
%>
<tr><td>Name<td><input type=text name=t2></tr>
<tr><td>Gender<td><input type=radio name=t3 value=male>Male<input type=radio name=t3 value=female>Female</tr>
<tr><td>DOB<td><input type=date name=t4 ></tr>
<tr><td>Email<td><input type=email name=t5></tr>
<tr><td>Phone_No<td><input type=text name=t6></tr>
<tr><td>Address<td><textarea name=t7></textarea></tr>
<tr><td>Department<td><input type=text name=t8></tr>
<tr><td>Project_Name<td><input type=text name=t9></tr>
<tr><td>Domain<td><input type=text name=t10></tr>
<tr><td>Date<td><input type=date name=t11></tr>
<tr><td>Status<td><input type=text name=t12></tr>
<tr><th colspan="2"><input type=submit name=b1 value=Registration></tr>
<%
Random ob=new Random();
int c1=ob.nextInt(10000);
int reg=Integer.parseInt(request.getParameter("t1"));
String n=request.getParameter("t2");
String g=request.getParameter("t3");
String b2=request.getParameter("t4");
String e=request.getParameter("t5");
String p=request.getParameter("t6");
String a1=request.getParameter("t7");
String d=request.getParameter("t8");
String pn=request.getParameter("t9");
String d1=request.getParameter("t10");
String da=request.getParameter("t11");
String st="Pending";
if(request.getParameter("b1")!=null)
{
PreparedStatement ps1=c.prepareStatement("insert into registration value(?,?,?,?,?,?,?,?,?,?,?,?)");
ps1.setInt(1,reg);
ps1.setString(2,n);
ps1.setString(3,g);
ps1.setString(4,b2);
ps1.setString(5,e);
ps1.setString(6,p);
ps1.setString(7,a1);
ps1.setString(8,d);
ps1.setString(9,pn);
ps1.setString(10,d1);
ps1.setString(11,da);
ps1.setString(12,st);
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
</table></form></center></body></html>
