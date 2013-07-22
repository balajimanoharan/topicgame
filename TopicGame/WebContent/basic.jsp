<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result</title>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
</head>
<body>
	  <%
        Map<String, Integer> infCount = new HashMap<String, Integer>();
		BufferedReader br1 = new BufferedReader(new FileReader("E:\\Discollab.csv"));
	  	String str = br1.readLine();
	  	while((str = br1.readLine())!=null){
	  		String[] strs = str.split(",");
	  		//out.println(strs[0] +":"+strs[1]);
	  		infCount.put(strs[0],Integer.parseInt(strs[1]));
	  	}
	  	br1.close();
		String name = request.getParameter("user"); 
		out.println("User: "+name);
		infCount.put(name, infCount.get(name)+1);
		out.println("Count: "+infCount.get(name));
		PrintWriter pw = new PrintWriter("E:\\Discollab.csv");
		pw.write("Name, Count\n");
		Iterator it = infCount.entrySet().iterator();
	    while (it.hasNext()) {
	        Map.Entry pairs = (Map.Entry)it.next();
	        pw.println(pairs.getKey() + "," + pairs.getValue());
	    }
	    pw.close();
		%>
</body>
</html>