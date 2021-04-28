<%-- 
    Document   : searchResults
    Created on : 26 Apr, 2021, 7:36:19 PM
    Author     : sukhb
--%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="css/color.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/custom-carousel.css">
    <link rel="stylesheet" href="css/template.css">


    <title>Search Results for <%= request.getParameter("query") %></title>
</head>
<body>
    <div class="container-fluid bg-black p-0 min-vh-100 d-flex flex-column justify-content-between">
        <div>
            <jsp:include page="navbar.jsp" />
            <%
                String type = request.getParameter("type");
            %>
            <div class="container-lg">
                <div class="row  mt-4">
                    <h3 class="text-white pb-4">
                        <%= type.substring(0, 1).toUpperCase() + type.substring(1) %> Search Results for "<%= request.getParameter("query") %>"
                    </h3>
                    <%
                        if(type.equals("all")) {
                    %>
                            <ul class="nav nav-pills mb-3 ps-2 ps-sm-4" id="searchTabs" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link bg-black text-white fs-6 px-1 active" id="contentBtn" data-mdb-toggle="pill"
                                       href="#contentTab" role="tab" aria-controls="contentTab"
                                       aria-selected="true"><span>Movies and Shows</span></a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link bg-black text-white fs-6 px-1" id="userBtn" data-mdb-toggle="pill"
                                       href="#userTab" role="tab" aria-controls="userTab"
                                       aria-selected="false"><span>Users</span></a>
                                </li>
                            </ul>
                    
                    <!-- Tabs content -->
                    <div class="tab-content" id="ex1-content">
                    <%
                        }
                        if(!type.equals("users")) {
                    %>
                            <div <% if(type.equals("all")) { %> class="tab-pane fade show active" id="contentTab" role="tabpanel" aria-labelledby="contentBtn" <% } %>>
                                <div class="row g-4 mb-4" id="card-container">
                                    <% 
                                        JSONArray resultArray = (JSONArray) request.getAttribute("resultArray");

                                        boolean isMovie = true;
                                        if(!type.equals("all")) {
                                            if(type.equals("movies")) isMovie = true;
                                            else isMovie = false;
                                        }
                                        for (int i = 0; i < resultArray.size(); i++) {
                                            JSONObject contentItem = (JSONObject) resultArray.get(i);
                                            if(type.equals("all")) {
                                                String media_type = (String)contentItem.get("media_type");
                                                if(media_type.equals("movie"))
                                                    isMovie = true;
                                                else if(media_type.equals("tv")) 
                                                    isMovie = false;
                                                else
                                                    continue;
                                            }
                                    %>
                                            <jsp:include page="card.jsp">
                                                <jsp:param name="contentItem" value="<%= contentItem %>" />
                                                <jsp:param name="style" value="col-xl-2 col-lg-3 col-md-4 col-sm-6 col-12" />
                                                <jsp:param name="isMovie" value="<%= isMovie %>" />
                                            </jsp:include>

                                    <%
                                        }
                                    %>

                                </div>
                                <button type="button" class="btn btn-outline-yellow btn-block fs-5 mb-4" id="loadMore">Load More</button>
                                <div class="w-100 text-center mb-4 d-none" id="spinner">
                                    <div class="spinner-border text-yellow" role="status">
                                        <span class="visually-hidden">Loading...</span>
                                    </div>
                                </div>
                            </div>
                    <%
                        }
                        if(type.equals("users") || type.equals("all")) {
                    %>
                            <div <% if(type.equals("all")) { %> class="tab-pane fade" id="userTab" role="tabpanel" aria-labelledby="userBtn" <% } %>>
                                <div class="row g-4 mb-4">
                                    <% 
                                        JSONArray userArray = (JSONArray) request.getAttribute("userArray");

                                        for (int i = 0; i < userArray.size(); i++) {
                                            JSONObject userItem = (JSONObject) userArray.get(i);
                                    %>
                                            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6 col-12 content">
                                                <a href="/MML/profile?id=<%=userItem.get("user_id")%>" class="text-white">
                                                    <div class="card h-100 bg-dark text-white">
                                                        <div class="row g-0">
                                                            <div class="img-container col-4 col-sm-12">
                                                                <%
                                                                    if (((String)userItem.get("profile_pic")).isEmpty()) {
                                                                %>
                                                                    <div style="height:0px;padding-top:150%;width:100%; background: url('images/def_user.svg') no-repeat center center;">
                                                                    </div>
                                                                <% } else {%>

                                                                    <div style="height:0px;padding-top:150%;width:100%; background: url('data:image/jpg;base64, <%=userItem.get("profile_pic")%>') center center; background-size: cover;">
                                                                    </div>
                                                                <% 
                                                                    }
                                                                %>
                                                            </div>
                                                            <div class="card-body bg-dark col-8 col-sm-12 d-flex flex-column justify-content-evenly">
                                                                <h5 class="card-title"><%=userItem.get("username")%></h5>
                                                                <p class="card-text line-clamp d-sm-none my-1 card-desc"><%= userItem.get("about") %></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                    <%
                                        }
                                    %>

                                </div>
                            </div>
                    <%
                        }
                        if(type.equals("all")) {
                    %>
                    </div>
                    <!-- Tabs content -->
                    <%
                        }
                    %>
                    <div class="col-12">
                        
                    </div>
                </div>
            </div>
            
        </div>
        
        <jsp:include page="footer.jsp" />
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
    
    <% if(!type.equals("users")) { %>
    <script>
        let page = 1
        function handleLoad() {
            loadBtn.classList.add('d-none')
            spinner.classList.remove('d-none')
            let type = '<%=type%>'
            let isMovie = type=="movies" ? true : false
            
            
            fetch(window.location.pathname + (window.location.search!="" ? window.location.search+"&" : "?") + "page=" + ++page, {
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
            .then(response => response.json())
            .then(data => {
                data.forEach(item => {
                    if(type=="all") {
                        let media_type = item.media_type
                        if(media_type=="movie")
                            isMovie = true
                        else if(media_type=="tv") 
                            isMovie = false
                        else
                            return
                    }
                    cardContainer.innerHTML += `
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6 col-12 content">
                            <a href="/MML/${ isMovie ? 'movie' : 'show' }?id=${item.id}" class="text-white">
                                <div class="card h-100 bg-dark text-white">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="https://image.tmdb.org/t/p/w342/${item.poster_path}" class="card-img-top" />
                                        </div>
                                        <div class="card-body bg-dark col-8 col-sm-12 d-flex flex-column justify-content-evenly">
                                            <h5 class="card-title">${ isMovie ? item.title : item.name }</h5>
                                            <p class="card-text line-clamp d-sm-none my-1 card-desc">${item.overview}</p>
                                            <p class="card-text m-0 text-muted">
                                                ${ isMovie ? item.release_date : item.first_air_date }
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    `
                })
                

                if(data.length > 0) loadBtn.classList.remove('d-none')
                spinner.classList.add('d-none')
            })
        }

        const cardContainer = document.getElementById('card-container')
        const spinner = document.getElementById('spinner')
        const loadBtn = document.getElementById('loadMore')
        loadBtn.addEventListener('click', handleLoad)
    </script>
    <% } %>
</body>
</html>
