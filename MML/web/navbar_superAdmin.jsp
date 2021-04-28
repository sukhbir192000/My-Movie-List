<%-- 
    Document   : navbar_superAdmin
    Created on : Apr 28, 2021, 1:32:25 PM
    Author     : Ishjot Singh
--%>

<%@page import="beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession ses = request.getSession();
    User user = (User) ses.getAttribute("adminUser");
    String email = user.getEmail();
    String username = user.getUsername();
%>
<div
    class="w-100 bg-white text-left mt-0 shadow pe-4 d-flex flex-row py-2 justify-content-end sticky-top">
    <div class="d-flex flex-column me-3 justify-content-center align-items-end">
        <small class="p-0 m-0 font-weight-bold"><%=username%></small>
        <small class="p-0 m-0"><%=email%></small>
    </div>
    <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg" class="rounded-circle z-depth-0 "
         alt="avatar image" height="55" />

</div>

