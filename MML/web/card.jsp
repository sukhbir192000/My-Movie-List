
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    JSONParser parse = new JSONParser();
    JSONObject contentItem = (JSONObject) parse.parse(request.getParameter("contentItem"));
%>
<div class="<%= request.getParameter("style") %> content">
    <a href="/MML/movie?id=<%=contentItem.get("id")%>" class="text-white">
        <div class="card h-100 bg-dark text-white">
            <div class="row g-0">
                <div class="img-container col-4 col-sm-12">
                    <img src="https://image.tmdb.org/t/p/w342/<%=contentItem.get("poster_path")%>" class="card-img-top" />
                </div>
                <div class="card-body bg-dark col-8 col-sm-12 d-flex flex-column justify-content-evenly">
                    <h5 class="card-title"><%=contentItem.get(request.getParameter("contentName"))%></h5>
                    <p class="card-text line-clamp d-sm-none my-1 card-desc"><%= contentItem.get("overview") %></p>
                    <p class="card-text m-0 text-muted">
                        <%=contentItem.get(request.getParameter("contentDate"))%>
                    </p>
                </div>
            </div>
        </div>
    </a>
</div>

