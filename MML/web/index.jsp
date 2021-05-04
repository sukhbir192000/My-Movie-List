

<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
        <link rel="stylesheet" href="css/template.css">
        <link rel="stylesheet" href="css/custom-carousel.css">

        <title>Document</title>
    </head>

    <body>
        <div class="container-fluid bg-black p-0 min-vh-100 d-flex flex-column justify-content-between">
            <div>
                <jsp:include page="navbar.jsp" />

                <%
                    JSONArray carouselArray = (JSONArray) request.getAttribute("carouselArray");
                    if(carouselArray != null && carouselArray.size()>0){
                %>
                <!-- Carousel wrapper -->
                <div id="homeCarousel" class="carousel slide carousel-fade" data-mdb-ride="carousel">
                    <!-- Inner -->
                    <div class="carousel-inner">
                        <%
                            for (int i = 0; i < carouselArray.size(); i++) {
                                JSONObject contentItem = (JSONObject) carouselArray.get(i);
                        %>
                                <div class="carousel-item <%= i==0 ? "active" : "" %>">
                                    <a href="/MML/movie?id=<%=contentItem.get("id")%>">
                                        <div class="backdrop">
                                            <img src="https://image.tmdb.org/t/p/original/<%=contentItem.get("backdrop_path")%>" class="w-100 mt-n5" />
                                        </div>
                                        <div class="row">
                                            <div class="col-xl-2 col-md-3 offset-1 position-absolute bottom-0 d-none d-md-block me-0 pe-0">
                                                <% if(contentItem.get("poster_path")!=null) { %>
                                                    <img src="https://image.tmdb.org/t/p/w342/<%=contentItem.get("poster_path")%>" class="w-100 ps-3">
                                                <% } else { %>
                                                    <div class="ps-3" style="height:0; padding-top:160%; width:100%; background:#777 url('images/default.png') no-repeat center center;"></div>
                                                <% } %>
                                                
                                            </div>
                                            <div class="mt-n10 pt-5 col-12 px-4 px-md-0 back-grad">
                                                <div class="row">
                                                    <div class="col-xl-7 offset-xl-3 col-md-7 offset-md-4 col-12 text-center-custom px-4 px-md-3">
                                                        <h2 class="h2 text-white fw-bold mx-auto mx-md-0 d-inline-block"><%= contentItem.get("title") %></h2>
                                                        <p class="pt-3 mb-5 text-crop-3 text-muted">
                                                            <%= contentItem.get("overview") %>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                        <%
                            }
                        %>
                    </div>
                    <!-- Inner -->

                    <!-- Indicators -->
                    <div class="row">
                        <div class="carousel-indicators m-0">
                            <%
                                for (int i = 0; i < carouselArray.size(); i++) {
                                    JSONObject contentItem = (JSONObject) carouselArray.get(i);
                                    if(i==0) {
                            %>
                                <button type="button" data-mdb-target="#homeCarousel" data-mdb-slide-to="<%=i%>" class="active"
                                        aria-current="true" aria-label="Slide <%=i+1%>"></button>
                            <%
                                    } else {
                            %>
                                <button type="button" data-mdb-target="#homeCarousel" data-mdb-slide-to="<%=i%>"
                                        aria-label="Slide <%=i+1%>"></button>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                    <!-- Controls -->
                    <button class="carousel-control-prev" type="button" data-mdb-target="#homeCarousel"
                            data-mdb-slide="prev">
                        <span class="carousel-control-prev-icon mt-n10" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-mdb-target="#homeCarousel"
                            data-mdb-slide="next">
                        <span class="carousel-control-next-icon mt-n10" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <!-- Carousel wrapper -->
                <%
                    }
                %>

                <div class="container-lg my-5">
                    <div class="heading-container mt-5 d-block d-sm-flex flex-row justify-content-start align-items-baseline">
                        <div class="d-flex flex-row justify-content-between">
                            <h2 class="text-yellow fw-bold px-2 py-0 d-inline-block d-sm-block">Trending</h2>
                        </div>
                        <!-- Tabs navs -->
                        <ul class="nav nav-pills nav-fill mb-3 ps-2 ps-sm-4" id="social-nav" role="tablist">
                            <li class="nav-item h-auto " role="presentation">
                                <a class="nav-link bg-black text-white fs-6 px-1 active" id="trending-movies-button" data-mdb-toggle="pill"
                                   href="#trending-movies" role="tab" aria-controls="trending-movies"
                                   aria-selected="true"><span>Movies</span></a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link bg-black text-white fs-6 px-1" id="trending-shows-button" data-mdb-toggle="pill"
                                   href="#trending-shows" role="tab" aria-controls="trending-shows"
                                   aria-selected="false"><span>TV Shows</span></a>
                            </li>
                        </ul>
                    </div>
                    
                    <!-- Tabs content -->
                    <div class="tab-content" id="trending">
                        <div class="tab-pane fade show active" id="trending-movies" role="tabpanel" aria-labelledby="trending-movies-button">
                            <div class="custom-carousel position-relative">
                                <button
                                    class="btn btn-dark custom-carousel-control custom-carousel-prev position-absolute start-0 top-50 py-4 px-3">
                                    <i class="fas fa-chevron-left fs-4"></i>
                                </button>
                                <button
                                    class="btn btn-dark custom-carousel-control custom-carousel-next position-absolute end-0 top-50 py-4 px-3">
                                    <i class="fas fa-chevron-right fs-4"></i>
                                </button>
                                <div class="custom-carousel-container d-flex flex-row">
                                    <%
                                        JSONArray trendingMovieArray = (JSONArray) request.getAttribute("trendingMovies");
                                        for (int i = 0; i < trendingMovieArray.size(); i++) {
                                            JSONObject contentItem = (JSONObject) trendingMovieArray.get(i);
                                    %>
                                            <div class="col-xl-2 col-lg-3 col-md-4 col-6 content">
                                                <a href="/MML/movie?id=<%=contentItem.get("id")%>" class="text-white">
                                                    <div class="card h-100 bg-dark text-white">
                                                        <div class="row g-0">
                                                            <div class="img-container hover-zoom bg-image">
                                                                <% if(contentItem.get("poster_path")!=null) { %>
                                                                    <div style="height:0; padding-top:160%; width:100%; background:url('https://image.tmdb.org/t/p/w342/<%=contentItem.get("poster_path")%>') no-repeat center center; background-size: cover;"></div>
                                                                <% } else { %>
                                                                    <div style="height:0; padding-top:160%; width:100%; background:#777 url('images/default.png') no-repeat center center;"></div>
                                                                <% } %>
                                                            </div>
                                                            <div class="card-body bg-dark">
                                                                <h5 class="card-title"><%=contentItem.get("title")%></h5>
                                                                <p class="card-text m-0 text-muted">
                                                                    <%=contentItem.get("release_date")%>
                                                                </p>
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
                        </div>
                        <div class="tab-pane fade" id="trending-shows" role="tabpanel" aria-labelledby="trending-shows-button">
                            <div class="custom-carousel position-relative">
                                <button
                                    class="btn btn-dark custom-carousel-control custom-carousel-prev position-absolute start-0 top-50 py-4 px-3">
                                    <i class="fas fa-chevron-left fs-4"></i>
                                </button>
                                <button
                                    class="btn btn-dark custom-carousel-control custom-carousel-next position-absolute end-0 top-50 py-4 px-3">
                                    <i class="fas fa-chevron-right fs-4"></i>
                                </button>
                                <div class="custom-carousel-container d-flex flex-row">
                                    <%
                                        JSONArray trendingShowArray = (JSONArray) request.getAttribute("trendingShows");
                                        for (int i = 0; i < trendingShowArray.size(); i++) {
                                            JSONObject contentItem = (JSONObject) trendingShowArray.get(i);
                                    %>
                                            <div class="col-xl-2 col-lg-3 col-md-4 col-6 content">
                                                <a href="/MML/show?id=<%=contentItem.get("id")%>" class="text-white">
                                                    <div class="card h-100 bg-dark text-white">
                                                        <div class="row g-0">
                                                                <div class="img-container hover-zoom bg-image">
                                                                    <% if(contentItem.get("poster_path")!=null) { %>
                                                                        <div style="height:0; padding-top:160%; width:100%; background:url('https://image.tmdb.org/t/p/w342/<%=contentItem.get("poster_path")%>') no-repeat center center; background-size: cover;"></div>
                                                                    <% } else { %>
                                                                        <div style="height:0; padding-top:160%; width:100%; background:#777 url('images/default.png') no-repeat center center;"></div>
                                                                    <% } %>
                                                                </div>
                                                            <div class="card-body bg-dark">
                                                                    <h5 class="card-title"><%=contentItem.get("name")%></h5>
                                                                    <p class="card-text m-0 text-muted">
                                                                        <%=contentItem.get("first_air_date")%>
                                                                    </p>
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
                        </div>
                    </div>
                    <!-- Tabs content -->
                    
                    <div class="heading-container mt-5 d-block d-sm-flex flex-row justify-content-start align-items-baseline">
                        <div class="d-flex flex-row justify-content-between">
                            <h2 class="text-yellow fw-bold px-2 py-0 d-inline-block d-sm-block">Popular</h2>
                        </div>
                        <!-- Tabs navs -->
                        <ul class="nav nav-pills nav-fill mb-3 ps-2 ps-sm-4" id="social-nav" role="tablist">
                            <li class="nav-item h-auto " role="presentation">
                                <a class="nav-link bg-black text-white fs-6 px-1 active" id="popular-movies-button" data-mdb-toggle="pill"
                                   href="#popular-movies" role="tab" aria-controls="popular-movies"
                                   aria-selected="true"><span>Movies</span></a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link bg-black text-white fs-6 px-1" id="popular-shows-button" data-mdb-toggle="pill"
                                   href="#popular-shows" role="tab" aria-controls="popular-shows"
                                   aria-selected="false"><span>TV Shows</span></a>
                            </li>
                        </ul>
                    </div>
                    
                    <!-- Tabs content -->
                    <div class="tab-content" id="trending">
                        <div class="tab-pane fade show active" id="popular-movies" role="tabpanel" aria-labelledby="popular-movies-button">
                            <div class="custom-carousel position-relative">
                                <button
                                    class="btn btn-dark custom-carousel-control custom-carousel-prev position-absolute start-0 top-50 py-4 px-3">
                                    <i class="fas fa-chevron-left fs-4"></i>
                                </button>
                                <button
                                    class="btn btn-dark custom-carousel-control custom-carousel-next position-absolute end-0 top-50 py-4 px-3">
                                    <i class="fas fa-chevron-right fs-4"></i>
                                </button>
                                <div class="custom-carousel-container d-flex flex-row">
                                    <%
                                        JSONArray popularMovieArray = (JSONArray) request.getAttribute("popularMovies");
                                        for (int i = 0; i < popularMovieArray.size(); i++) {
                                            JSONObject contentItem = (JSONObject) popularMovieArray.get(i);
                                    %>
                                            <div class="col-xl-2 col-lg-3 col-md-4 col-6 content">
                                                <a href="/MML/movie?id=<%=contentItem.get("id")%>" class="text-white">
                                                    <div class="card h-100 bg-dark text-white">
                                                        <div class="row g-0">
                                                            <div class="img-container hover-zoom bg-image">
                                                                <% if(contentItem.get("poster_path")!=null) { %>
                                                                    <div style="height:0; padding-top:160%; width:100%; background:url('https://image.tmdb.org/t/p/w342/<%=contentItem.get("poster_path")%>') no-repeat center center; background-size: cover;"></div>
                                                                <% } else { %>
                                                                    <div style="height:0; padding-top:160%; width:100%; background:#777 url('images/default.png') no-repeat center center;"></div>
                                                                <% } %>
                                                            </div>
                                                            <div class="card-body bg-dark">
                                                                <h5 class="card-title"><%=contentItem.get("title")%></h5>
                                                                <p class="card-text m-0 text-muted">
                                                                    <%=contentItem.get("release_date")%>
                                                                </p>
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
                        </div>
                        <div class="tab-pane fade" id="popular-shows" role="tabpanel" aria-labelledby="popular-shows-button">
                            <div class="custom-carousel position-relative">
                                <button
                                    class="btn btn-dark custom-carousel-control custom-carousel-prev position-absolute start-0 top-50 py-4 px-3">
                                    <i class="fas fa-chevron-left fs-4"></i>
                                </button>
                                <button
                                    class="btn btn-dark custom-carousel-control custom-carousel-next position-absolute end-0 top-50 py-4 px-3">
                                    <i class="fas fa-chevron-right fs-4"></i>
                                </button>
                                <div class="custom-carousel-container d-flex flex-row">
                                    <%
                                        JSONArray popularShowArray = (JSONArray) request.getAttribute("popularShows");
                                        for (int i = 0; i < popularShowArray.size(); i++) {
                                            JSONObject contentItem = (JSONObject) popularShowArray.get(i);
                                    %>
                                            <div class="col-xl-2 col-lg-3 col-md-4 col-6 content">
                                                <a href="/MML/show?id=<%=contentItem.get("id")%>" class="text-white">
                                                    <div class="card h-100 bg-dark text-white">
                                                        <div class="row g-0">
                                                            <div class="img-container hover-zoom bg-image">
                                                                <% if(contentItem.get("poster_path")!=null) { %>
                                                                    <div style="height:0; padding-top:160%; width:100%; background:url('https://image.tmdb.org/t/p/w342/<%=contentItem.get("poster_path")%>') no-repeat center center; background-size: cover;"></div>
                                                                <% } else { %>
                                                                    <div style="height:0; padding-top:160%; width:100%; background:#777 url('images/default.png') no-repeat center center;"></div>
                                                                <% } %>
                                                            </div>
                                                            <div class="card-body bg-dark">
                                                                    <h5 class="card-title"><%=contentItem.get("name")%></h5>
                                                                    <p class="card-text m-0 text-muted">
                                                                        <%=contentItem.get("first_air_date")%>
                                                                    </p>
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
                        </div>
                    </div>
                    <!-- Tabs content -->

                    <h2 class="mt-5 text-yellow fw-bold ps-2">Upcoming</h2>

                    <div class="custom-carousel position-relative">
                        <button
                            class="btn btn-dark custom-carousel-control custom-carousel-prev position-absolute start-0 top-50 py-4 px-3">
                            <i class="fas fa-chevron-left fs-4"></i>
                        </button>
                        <button
                            class="btn btn-dark custom-carousel-control custom-carousel-next position-absolute end-0 top-50 py-4 px-3">
                            <i class="fas fa-chevron-right fs-4"></i>
                        </button>
                        <div class="custom-carousel-container d-flex flex-row">
                            <%
                                JSONArray upcomingArray = (JSONArray) request.getAttribute("upcomingMovies");
                                for (int i = 0; i < upcomingArray.size(); i++) {
                                    JSONObject contentItem = (JSONObject) upcomingArray.get(i);
                            %>
                                    <div class="col-xl-2 col-lg-3 col-md-4 col-6 content">
                                        <a href="/MML/movie?id=<%=contentItem.get("id")%>" class="text-white">
                                            <div class="card h-100 bg-dark text-white">
                                                <div class="row g-0">
                                                    <div class="img-container hover-zoom bg-image">
                                                        <% if(contentItem.get("poster_path")!=null) { %>
                                                            <div style="height:0; padding-top:160%; width:100%; background:url('https://image.tmdb.org/t/p/w342/<%=contentItem.get("poster_path")%>') no-repeat center center; background-size: cover;"></div>
                                                        <% } else { %>
                                                            <div style="height:0; padding-top:160%; width:100%; background:#777 url('images/default.png') no-repeat center center;"></div>
                                                        <% } %>
                                                    </div>
                                                    <div class="card-body bg-dark">
                                                        <h5 class="card-title"><%=contentItem.get("title")%></h5>
                                                        <p class="card-text m-0 text-muted">
                                                            <%=contentItem.get("release_date")%>
                                                        </p>
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
                </div>
            </div>


            <jsp:include page="footer.jsp" />

        </div>



        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
        <script type="text/javascript" src="scripts/custom-carousel.js"></script>


    </body>

</html>
