<%@ include file="employee.html"%>
<%@ page import="java.io.*;"%>
<%@ page import="java.sql.*;"%>
<%@ page import="java.util.*;"%>
<html>
<body bgcolor="pink"><center>
<form action="submitreview.jsp" method=post>
<table></table><font color="indigo" size=6><b><strong>Submit Review</strong></b></font>
<table border=0 cellspacing=10>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","root");
PreparedStatement ps=c.prepareStatement("select max(SID) from submitreview");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
int a=rs.getInt(1);
int b=a+1;
out.println("<tr><td>Submit ID<td><input type=text name=t1 value="+b+" readonly></tr>");
%>
<tr><td>Employee ID<td><input type=text name=t2></tr>
<tr><td>Project Name<td><input type=text name=t3></tr>
<tr><td>Review<td><input type=radio name=t4 value=I>I
<input type=radio name=t4 value=II>II
<input type=radio name=t4 value=III>III</tr>
<tr><td>Status<td><input type=text name=t5></tr>
<tr><td>Date<td><input type=date name=t6></tr>
<tr><td>Document<td><input type=text name=t7></tr>

<tr><th colspan="2"><input type=submit name=b1 value=submit></tr>
<%
Random ob=new Random();
int c1=ob.nextInt(10000);
int sid=Integer.parseInt(request.getParameter("t1"));
int eid=Integer.parseInt(request.getParameter("t2"));
String pn=request.getParameter("t3");
String r=request.getParameter("t4");
String st=request.getParameter("t5");
String date=request.getParameter("t6");
String d2=request.getParameter("t7");
if(request.getParameter("b1")!=null)
{
PreparedStatement ps1=c.prepareStatement("insert into submitreview value(?,?,?,?,?,?,?)");
ps1.setInt(1,sid);
ps1.setInt(2,eid);
ps1.setString(3,pn);
ps1.setString(4,r);
ps1.setString(5,st);
ps1.setString(6,date);
ps1.setString(7,d2);

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
