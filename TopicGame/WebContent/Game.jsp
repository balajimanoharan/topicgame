<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Topic Influence Game</title>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.ArrayList"%>
</head>
<body>
	<FORM ACTION="basic.jsp" METHOD="POST">
                <%
                	ArrayList<String> names = new ArrayList<String>();
                	BufferedReader br = new BufferedReader(new FileReader("E:\\Discollab.txt"));
                	String[] s = br.readLine().split(":");
                	out.println("Topic: <strong>" +s[1]+"</strong><br/><br/>");
                	br.close();
                	BufferedReader br1 = new BufferedReader(new FileReader("E:\\Discollab.csv"));
                	String str = br1.readLine();
                	while((str = br1.readLine())!=null){
                		String[] strs = str.split(",");
                		names.add(strs[0]);
                	}
                	br1.close();
                	out.println("Who is more influential?<BR>");
                	long i = 0;
                	do{
                		i=Math.round(Math.random()*names.size());
                	}while(i>4);
                	long j=-1;
                	do{
                		j = Math.round(Math.random()*names.size());
                	}while(j==i || j>4);
                	out.println("<input type='radio' name='user' value="+names.get((int)i)+"><label id='user1'>"+names.get((int)i)+"<//label><br>");
                	out.println("<input type='radio' name='user' value="+names.get((int)j)+"><label id='user1'>"+names.get((int)j)+"<//label><br>");
                %>
                <INPUT TYPE="SUBMIT" VALUE="Next">
      </FORM>
</body>
</html>