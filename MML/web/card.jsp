
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    JSONParser parse = new JSONParser();
    JSONObject contentItem = (JSONObject) parse.parse(request.getParameter("contentItem"));
    boolean isMovie = Boolean.parseBoolean(request.getParameter("isMovie"));
%>
<div class="<%= request.getParameter("style") %> content">
    <a href="/MML/<%= isMovie ? "movie" : "show" %>?id=<%=contentItem.get("id")%>" class="text-white">
        <div class="card h-100 bg-dark text-white">
            <div class="row g-0">
                <div class="img-container col-4 col-sm-12">
                    <% if(contentItem.get("poster_path")!=null) { %>
                        <div style="height:0; padding-top:160%; width:100%; background:url('https://image.tmdb.org/t/p/w342/<%=contentItem.get("poster_path")%>') no-repeat center center; background-size: cover;"></div>
                    <% } else { %>
                        <div style="height:0; padding-top:160%; width:100%; background:#777 url('images/default.png') no-repeat center center;"></div>
                    <% } %>
                </div>
                <div class="card-body bg-dark col-8 col-sm-12 d-flex flex-column justify-content-evenly">
                    <h5 class="card-title"><%=contentItem.get(isMovie ? "title" : "name")%></h5>
                    <p class="card-text line-clamp d-sm-none my-1 card-desc"><%= contentItem.get("overview") %></p>
                    <p class="card-text m-0 text-muted">
                        <%=contentItem.get(isMovie ? "release_date" : "first_air_date")%>
                    </p>
                </div>
            </div>
        </div>
    </a>
</div>

