<%-- 
    Document   : welcome.jsp
    Created on : 7 Apr, 2021, 6:40:56 PM
    Author     : sukhb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // New location to be redirected
    String site = new String("/MML/home");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
%>
