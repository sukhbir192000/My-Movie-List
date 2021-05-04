
<%@page import="daos.LikeDao"%>
<%@page import="beans.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
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
        <!-- <link rel="stylesheet" href="mdb.dark.min.css"> -->

        <link rel="stylesheet" href="css/color.css">
        <link rel="stylesheet" href="css/common.css">
        <link rel="stylesheet" href="css/details.css">
        <link rel="stylesheet" href="css/custom-carousel.css">
        <link rel="stylesheet" href="css/rating.css">

        <title>Movie Page</title>
    </head>

    <body>
        <div class="container-fluid bg-black p-0 min-vh-100 d-flex flex-column justify-content-between">
            <div>
                <jsp:include page="navbar.jsp" />
                <%
                    JSONObject details = (JSONObject) request.getAttribute("details");
                %>
                <div class="backdrop-details" style="background: url('https://image.tmdb.org/t/p/w1280/<%=details.get("backdrop_path")%>') center center no-repeat;">
                    <div class="w-100">
                        <div class="container-lg ">
                            <div class="row py-2 py-sm-5 px-2 px-sm-0">
                                <div class="col-12 col-sm-5 col-md-3 ">
                                    <div class="position-relative">
                                        <% if(details.get("poster_path")!=null) { %>
                                            <img src="https://image.tmdb.org/t/p/w500/<%=details.get("poster_path")%>" alt="poster" class="w-100 shadow-2-strong">
                                        <% } else { %>
                                            <div style="height:0; padding-top:160%; width:100%; background:#777 url('images/default.png') no-repeat center center;"></div>
                                        <% } %>
                                        <div class="w-25 position-absolute end-0 bottom-0 d-block d-md-none m-1">
                                            <svg id="animated-small" viewbox="0 0 100 100">
                                            <circle cx="50" cy="50" r="45" fill="rgba(0,0,0,0.8)" />
                                            <path id="progress-small" stroke-linecap="round" stroke-width="5" stroke="#F9C80E" fill="none" d="M50 10
                                                  a 40 40 0 0 1 0 80
                                                  a 40 40 0 0 1 0 -80">
                                            </path>
                                            <text id="count-small" x="50" y="50" text-anchor="middle" dy="7" font-size="20"
                                                  fill="#FFF"><%=(Double) details.get("vote_average") * 10%></text>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="col-12 col-sm-7 col-md-9 text-white d-flex flex-column justify-content-center align-items-start pt-3 pt-sm-0">
                                    <div class="row w-100">
                                        <div class="col-12 col-md-10">
                                            <h3 class="display-5 fw-normal"><%=details.get("title")%></h3>
                                            <p class="text-muted mb-0"><%=details.get("tagline")%></p>
                                        </div>
                                        <div class="d-none d-md-block col-md-2 pe-xl-5">
                                            <svg id="animated-big" viewbox="0 0 100 100">
                                            <circle cx="50" cy="50" r="45" fill="rgba(0,0,0,0.8)" />
                                            <path id="progress-big" stroke-linecap="round" stroke-width="5" stroke="#F9C80E" fill="none" d="M50 10
                                                  a 40 40 0 0 1 0 80
                                                  a 40 40 0 0 1 0 -80">
                                            </path>
                                            <text id="count-big" x="50" y="50" text-anchor="middle" dy="7" font-size="20"
                                                  fill="#FFF"><%=(Double) details.get("vote_average") * 10%>%</text>
                                            </svg>
                                        </div>
                                    </div>
                                    <p class=""><span class="d-block d-md-inline mb-3 mb-md-0"><%=details.get("release_date")%></span>
                                        <span class="d-block d-md-inline">&#x25CF;<%
                                            JSONArray genreArray = (JSONArray) details.get("genres");
                                            for (int i = 0; i < genreArray.size(); i++) {
                                                JSONObject genreItem = (JSONObject) genreArray.get(i);
                                                if (genreItem != null) {

                                            %>
                                            <%=genreItem.get("name")%>
                                            <%if (i != (genreArray.size() - 1)) {%>
                                            ,
                                            <%}%>
                                            <%
                                                    }
                                                }
                                            %>
                                        </span>
                                        <span class="d-block d-md-inline">&#x25CF; <%=details.get("runtime")%> minutes</span>
                                    </p>

                                    <p>
                                        <%=details.get("overview")%>

                                    </p>

                                    <!-- <button class="btn btn-yellow fs-5 mx-auto">+ Add to WatchList</button> -->
                                    <!--to do-->
                                    <%
                                        if (request.getAttribute("status") != null) {
                                    %>
                                    <div class="dropdown mx-auto" id="watchListButton">
                                        <button class="btn btn-yellow fs-5 dropdown-toggle" type="button" id="watchlist-btn"
                                                data-mdb-toggle="dropdown" aria-expanded="false" style="min-width:20vw !important;"><%=request.getAttribute("status")%></button>
                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark" aria-labelledby="watchlist-btn" >
                                            <li><span class="dropdown-item" href="#">Watching</span></li>
                                            <li><span class="dropdown-item" href="#">Completed</span></li>
                                            <li><span class="dropdown-item" href="#">On hold</span></li>
                                            <li><span class="dropdown-item" href="#">Dropped</span></li>
                                            <li><span class="dropdown-item" href="#">Plan to watch</span></li>
                                        </ul>
                                    </div>
                                    <%
                                    } else {
                                    %>
                                    <div class="mx-auto">
                                        <a class="btn btn-yellow fs-5" href="/MML/login?redirect=/MML/movie?id=<%= request.getParameter("id")%>" style="min-width:20vw !important;">Add to watchlist</a>
                                    </div>
                                    <%
                                        }
                                    %>


                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="container-lg px-3 my-5">
                    <%
                        JSONArray castArray = (JSONArray) request.getAttribute("cast");
                        if(castArray.size()>0) {
                    %>
                    <h2 class="mt-5 text-yellow fw-bold ps-2">Cast</h2>

                    <div id="cast-carousel" class="custom-carousel position-relative">
                        <button
                            class="btn btn-dark custom-carousel-control custom-carousel-prev position-absolute start-0 top-50 py-4 px-3">
                            <i class="fas fa-chevron-left fs-4"></i>
                        </button>
                        <button
                            class="btn btn-dark custom-carousel-control custom-carousel-next position-absolute end-0 top-50 py-4 px-3">
                            <i class="fas fa-chevron-right fs-4"></i>
                        </button>
                        <div class="custom-carousel-container d-flex flex-row">
                            <%for (int i = 0; i < castArray.size(); i++) {
                                    JSONObject castItem = (JSONObject) ((JSONArray) request.getAttribute("cast")).get(i);
                            %>
                            <div class="col-xl-2 col-md-3 col-sm-4 col-6">
                                <div class="card h-100 bg-dark text-white">
                                    <div class="img-container">
                                        <%if (castItem.get("profile_path") == null) {%>
                                        <img src="https://www.themoviedb.org/assets/2/v4/glyphicons/basic/glyphicons-basic-4-user-grey-d8fe957375e70239d6abdd549fd7568c89281b2179b5f4470e2e12895792dfa5.svg" class="card-img-top my-auto"
                                             alt="<%=castItem.get("original_name")%>" />
                                        <%} else {%>
                                        <img src="https://image.tmdb.org/t/p/w342/<%=castItem.get("profile_path")%>" class="card-img-top"
                                             alt="<%=castItem.get("original_name")%>" />
                                        <%}%>
                                    </div>
                                    <div class="card-body bg-dark">
                                        <h5 class="card-title"><%=castItem.get("original_name")%></h5>
                                        <p class="card-text">
                                            <%=castItem.get("character")%>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <%}%>


                        </div>
                    </div>
                    <%
                        }
                    %>

                    <%
                        JSONArray similarMovieArray = (JSONArray) request.getAttribute("similar");
                        if(similarMovieArray.size()>0) {
                    %>
                    <h2 class="mt-5 text-yellow fw-bold ps-2">More like this</h2>

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
                                for (int i = 0; i < similarMovieArray.size(); i++) {
                                    JSONObject contentItem = (JSONObject) similarMovieArray.get(i);
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
                    <%
                        }
                    %>
                </div>

                <div id="social-section" class="container-lg px-3 my-5">
                    <div class="heading-container mt-5 d-block d-sm-flex flex-row justify-content-start align-items-baseline">
                        <div class="d-flex flex-row justify-content-between">
                            <h2 class="text-yellow fw-bold px-2 py-0 d-inline-block d-sm-block">Social</h2>

                            <% if (session.getAttribute("loggedUser") != null) { %>
                            <button class="btn btn-yellow d-inline-block d-sm-none" type="button" data-mdb-toggle="collapse"
                                    data-mdb-target="#postReview" aria-expanded="false" aria-controls="postReview"><i
                                    class="fas fa-pencil-alt fs-6"></i></button>
                                <% } else {%>
                            <a href="/MML/login?redirect=/MML/movie?id=<%= request.getParameter("id")%>" class="btn btn-yellow d-inline-block d-sm-none">
                                <i class="fas fa-pencil-alt fs-6"></i>
                            </a>
                            <% } %>
                        </div>
                        <!-- Tabs navs -->
                        <ul class="nav nav-pills nav-justified mb-3 ps-2 ps-sm-4" id="social-nav" role="tablist">
                            <li class="nav-item h-auto " role="presentation">
                                <a class="nav-link bg-black text-white fs-6 px-1 active" id="review-button" data-mdb-toggle="pill"
                                   href="#review-content" role="tab" aria-controls="review-content"
                                   aria-selected="true"><span>Reviews</span></a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link bg-black text-white fs-6 px-1" id="comments-button" data-mdb-toggle="pill"
                                   href="#comments-content" role="tab" aria-controls="comments-content"
                                   aria-selected="false"><span>Comments</span></a>
                            </li>
                        </ul>
                        <!-- Tabs navs -->
                        <% if (session.getAttribute("loggedUser") != null) { %>
                        <button class="btn btn-yellow ms-auto d-none d-sm-inline-block fs-6" type="button" data-mdb-toggle="collapse"
                                data-mdb-target="#postReview" aria-expanded="false" aria-controls="postReview">
                            <i class="fas fa-pencil-alt"></i><span class="d-none d-md-inline px-1">Write a review</span>
                        </button>
                        <% } else {%>
                        <a href="/MML/login?redirect=/MML/movie?id=<%= request.getParameter("id")%>" class="btn btn-yellow ms-auto d-none d-sm-inline-block fs-6">
                            <i class="fas fa-pencil-alt"></i><span class="d-none d-md-inline px-1">Write a review</span>
                        </a>
                        <% }%>
                    </div>

                    <!-- Tabs content -->
                    <div class="tab-content" id="social-content">
                        <div class="tab-pane fade show active" id="review-content" role="tabpanel" aria-labelledby="review-button">

                            <ul id="review-list" class="px-2 ps-md-4">

                                <!-- <div class="collapse" id="postReview">
                                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Reprehenderit sunt quis reiciendis nobis similique accusantium tempora quisquam ea nesciunt numquam.
                                </div> -->
                                <div class="collapse" id="postReview">
                                    <div class="mb-4">
                                        <div class="card bg-dark text-white">
                                            <div class="card-header">
                                                <h4 class="my-2">Post a review</h4>
                                            </div>
                                            <div class="card-body">
                                                <form action="/MML/ReviewController" method="POST">
                                                    <input name="isShow" type="hidden" value="false">
                                                    <input name="contentId" type="hidden" value="<%=request.getParameter("id")%>">
                                                    <div class="mb-3">
                                                        <h5>Your Rating</h5>
                                                        <input id="input-1" name="input-1" class="rating rating-loading" data-min="0" data-max="5"
                                                               data-step="0.5">
                                                    </div>
                                                    <div class="form-outline form-white mb-3">
                                                        <input type="text" id="postTitle" name="title" class="form-control form-control-lg" required/>
                                                        <label class="form-label" for="formControlLg">Title</label>
                                                    </div>

                                                    <div class="form-outline form-white mb-3">
                                                        <textarea class="form-control" id="postDescription" name="description" rows="4" required></textarea>
                                                        <label class="form-label" for="textAreaExample">Description</label>
                                                    </div>
                                                    <button id="postBtn" type="submit" class="btn btn-yellow me-2">Submit</button>
                                                    <button id="cancelPostBtn" type="button" class="btn cancel-btn" type="button"
                                                            data-mdb-toggle="collapse" data-mdb-target="#postReview" aria-expanded="false"
                                                            aria-controls="postReview">Cancel</button>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    JSONArray allReviews = (JSONArray) request.getAttribute("allReviews");
                                    JSONArray myReviews = (JSONArray) request.getAttribute("myReviews");
                                    if (allReviews.size() == 0 && (myReviews == null || myReviews.size() == 0)) {%>
                                <h4 class="text-white text-center">No reviews yet!</h4>
                                <%} else {
                                    if (myReviews != null) {
                                        for (int i = 0; i < myReviews.size(); i++) {
                                            JSONObject myReview = (JSONObject) myReviews.get(i);

                                %>
                                <li class="mb-4">
                                    <div class="card bg-dark text-white" id="<%=myReview.get("id")%>">
                                        <div class="card-header d-flex flex-row justify-content-between align-items-center">
                                            <div class="row gx-2 flex-grow-1 w-auto">
                                                <div class="col-2 col-sm-1 pe-xl-4 d-flex flex-column justify-content-center">
                                                    <a href="/MML/profile?id=<%=myReview.get("user_id")%>">
                                                    <%
                                                        String profilePic = (String) (myReview.get("profilePic"));
                                                        if (profilePic.isEmpty()) {%>
                                                    <div style="background:#1a1a1a url('images/def_user.svg') center center;background-size:cover;padding-top:100%;width:100%;"
                                                         alt="" class="w-100 rounded-circle"></div>
                                                    <%} else {%>
                                                    
                                                    <div style="background:url('data:image/jpg;base64, <%=myReview.get("profilePic")%>') center center;background-size:cover;padding-top:100%;width:100%;"
                                                         alt="" class="w-100 rounded-circle"></div>
                                                    <%}%>
                                                    </a>

                                                </div>
                                                <div class="col-10 col-sm-11 d-flex flex-column justify-content-center w-auto">
                                                    <div class="d-block d-sm-flex flex-row justify-content-start align-items-end">
                                                        <a href="/MML/profile?id=<%=myReview.get("user_id")%>">
                                                            <h4 class="my-0 d-inline-block text-white"><%=myReview.get("username")%></h4>
                                                        </a><br>
                                                        <span class="text-muted mx-sm-2"><%=myReview.get("date")%></span>
                                                    </div>
                                                    <div>
                                                        <%
                                                            float j = Float.parseFloat((String) myReview.get("rating"));
                                                            while (j >= 1) {

                                                        %>       

                                                        <i class="fas fa-star text-yellow"></i>
                                                        <%                                                                j--;
                                                            }
                                                            if (j == 0.5) {
                                                        %>
                                                        <i class="fas fa-star-half-alt text-yellow"></i>
                                                        <%
                                                        } else if (Float.parseFloat((String) myReview.get("rating")) != 5) {%>
                                                        <i class="far fa-star text-yellow"></i>

                                                        <%}
                                                            j = Float.parseFloat((String) myReview.get("rating"));
                                                            int emptyStars = 4 - ((int) j);
                                                            while (emptyStars > 0) {
                                                        %>
                                                        <i class="far fa-star text-yellow"></i>
                                                        <%
                                                                emptyStars--;
                                                            }
                                                        %>


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="fs-5 d-flex flex-column flex-sm-row">
                                                <div class="likes cursor-pointer d-flex flex-row justify-content-end text-success">
                                                    <span class="px-1"><%=myReview.get("upvote")%></span><span><i class="far <%if (myReview.get("liked") != null && Integer.parseInt((String) myReview.get("liked")) == 1) {%> fas <%} %> fa-thumbs-up"></i></span>
                                                </div>
                                                <span class="d-none d-sm-inline px-1 text-muted">|</span>
                                                <div
                                                    class="dislikes cursor-pointer d-flex flex-row-reverse justify-content-start flex-sm-row text-danger">
                                                    <span><i class="far <%if (myReview.get("liked") != null && Integer.parseInt((String) myReview.get("liked")) == 0) {%>fas<%}%> fa-thumbs-down"></i></span><span class="px-1"><%=myReview.get("downvote")%></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title">
                                                <%=myReview.get("heading")%>
                                            </h5>
                                            <p class="card-text">
                                                <%=myReview.get("content")%>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <%
                                        }
                                    }

                                    for (int i = 0; i < allReviews.size(); i++) {
                                        JSONObject myReview = (JSONObject) allReviews.get(i);

                                %>
                                <li class="mb-4">
                                    <div class="card bg-dark text-white" id="<%=myReview.get("id")%>">
                                        <div class="card-header d-flex flex-row justify-content-between align-items-center">
                                            <div class="row gx-2 flex-grow-1 w-auto">
                                                <div class="col-2 col-sm-1 pe-xl-4 d-flex flex-column justify-content-center">
                                                    <a href="/MML/profile?id=<%=myReview.get("user_id")%>">
                                                    <%
                                                        String profilePic = (String) (myReview.get("profilePic"));
                                                        if (profilePic.isEmpty()) {%>
                                                    <div style="background:#1a1a1a url('images/def_user.svg') center center;background-size:cover;padding-top:100%;width:100%;"
                                                         alt="" class="w-100 rounded-circle"></div>
                                                    <%} else {%>
                                                    
                                                    <div style="background:url('data:image/jpg;base64, <%=myReview.get("profilePic")%>') center center;background-size:cover;padding-top:100%;width:100%;"
                                                         alt="" class="w-100 rounded-circle"></div>
                                                    <%}%>
                                                    </a>
                                                </div>
                                                <div class="col-10 col-sm-11 d-flex flex-column justify-content-center w-auto">
                                                    <div class="d-block d-sm-flex flex-row justify-content-start align-items-end">
                                                        <a href="/MML/profile?id=<%=myReview.get("user_id")%>">
                                                            <h4 class="my-0 d-inline-block text-white"><%=myReview.get("username")%></h4>
                                                        </a><br>
                                                        <span class="text-muted mx-sm-2"><%=myReview.get("date")%></span>
                                                    </div>
                                                    <div>
                                                        <%
                                                            float j = Float.parseFloat((String) myReview.get("rating"));
                                                            while (j >= 1) {

                                                        %>       

                                                        <i class="fas fa-star text-yellow"></i>
                                                        <%                                                                j--;
                                                            }
                                                            if (j == 0.5) {
                                                        %>
                                                        <i class="fas fa-star-half-alt text-yellow"></i>
                                                        <%
                                                        } else if (Float.parseFloat((String) myReview.get("rating")) != 5) {%>
                                                        <i class="far fa-star text-yellow"></i>

                                                        <%}
                                                            j = Float.parseFloat((String) myReview.get("rating"));
                                                            int emptyStars = 4 - ((int) j);
                                                            while (emptyStars > 0) {
                                                        %>
                                                        <i class="far fa-star text-yellow"></i>
                                                        <%
                                                                emptyStars--;
                                                            }

                                                        %>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="fs-5 d-flex flex-column flex-sm-row">
                                                <div class="likes cursor-pointer d-flex flex-row justify-content-end text-success">
                                                    <span class="px-1"><%=myReview.get("upvote")%></span><span><i class="far <%if (myReview.get("liked") != null && Integer.parseInt((String) myReview.get("liked")) == 1) {%>fas<%} %> fa-thumbs-up"></i></span>
                                                </div>
                                                <span class="d-none d-sm-inline px-1 text-muted">|</span>
                                                <div
                                                    class="dislikes cursor-pointer d-flex flex-row-reverse justify-content-start flex-sm-row text-danger">
                                                    <span><i class="far <%if (myReview.get("liked") != null && Integer.parseInt((String) myReview.get("liked")) == 0) {%>fas<%}%> fa-thumbs-down"></i></span><span class="px-1"><%=myReview.get("downvote")%></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title">
                                                <%=myReview.get("heading")%>
                                            </h5>
                                            <p class="card-text">
                                                <%=myReview.get("content")%>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <%
                                        }
                                    }
                                %>

                            </ul>
                        </div>
                        <div class="tab-pane fade" id="comments-content" role="tabpanel" aria-labelledby="comments-button">
                            <div id="disqus_thread"></div>
                        </div>
                    </div>
                    <!-- Tabs content -->
                </div>
            </div>


            <jsp:include page="footer.jsp" />
        </div>

        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/snap.svg/0.3.0/snap.svg-min.js"></script>
        <%
            if (request.getAttribute("status") != null) {
        %>
        <script>
            let optionsList = document.querySelectorAll("#watchListButton ul li");
            optionsList.forEach((optionItem) => {
                optionItem.addEventListener('click', watchListHandler);
            })
            function watchListHandler(event) {
                console.log("clicked", event.target.innerText);
                postData('/MML/watchlist', {
                    listStatus: event.target.innerText,
                    movieId:<%=request.getParameter("id")%>,
                    runtime:<%=details.get("runtime")%>,
                    isShow: false
                })
                        .then(data => {
                            console.log(data); // JSON data parsed by `data.json()` call
                            if (data.success) {
                                let watchListButton = document.querySelector("#watchListButton button");
                                watchListButton.innerText = event.target.innerText;
                            }
                        });

            }
        </script>
        <%
            }
        %>
        <script>
            async function postData(url = '', data = {}) {
                // Default options are marked with *
                const response = await fetch(url, {
                    method: 'POST', // *GET, POST, PUT, DELETE, etc.
                    mode: 'cors', // no-cors, *cors, same-origin
                    cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
                    credentials: 'same-origin', // include, *same-origin, omit
                    headers: {
                        'Content-Type': 'application/json'
                                // 'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    redirect: 'follow', // manual, *follow, error
                    referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
                    body: JSON.stringify(data) // body data type must match "Content-Type" header
                });
                return response.json(); // parses JSON response into native JavaScript objects
            }


        </script>
        <script>
            var countBig = $(('#count-big'));
            var length = parseInt(countBig.text()) * 251.2 / 100;
            $({Counter: 0}).animate({Counter: countBig.text()}, {
                duration: 2000,
                easing: 'linear',
                step: function () {
                    countBig.text(Math.ceil(this.Counter) + "%");
                }
            });

            var sBig = Snap('#animated-big');
            var progressBig = sBig.select('#progress-big');

            progressBig.attr({strokeDasharray: '0, 251.2'});
            Snap.animate(0, length, function (value) {
                progressBig.attr({'stroke-dasharray': value + ',251.2'});
            }, 2000);

            var countSmall = $(('#count-small'));
            length = parseInt(countSmall.text()) * 251.2 / 100;
            $({Counter: 0}).animate({Counter: countSmall.text()}, {
                duration: 2000,
                easing: 'linear',
                step: function () {
                    countSmall.text(Math.ceil(this.Counter) + "%");
                }
            });

            var sSmall = Snap('#animated-small');
            var progressSmall = sSmall.select('#progress-small');

            progressSmall.attr({strokeDasharray: '0, 251.2'});
            Snap.animate(0, length, function (value) {
                progressSmall.attr({'stroke-dasharray': value + ',251.2'});
            }, 2000);
        </script>

        <script src="scripts/custom-carousel.js"></script>
        <script src="scripts/rating.js"></script>

        <% if (session.getAttribute("loggedUser") != null) { %>
        <script>

            async function addLike(likeDiv, dislikeDiv) {

                let reviewId = likeDiv.parentNode.parentNode.parentNode.id;
                await postData('/MML/LikeDislikeController', {
                    reviewId: reviewId,
                    toDo: '0'
                })
                        .then(data => {
                            console.log(data); // JSON data parsed by `data.json()` call
                            if (data.success) {
                                likeDiv.children[0].textContent = parseInt(likeDiv.children[0].textContent) + 1;
                                const icon = likeDiv.children[1].children[0];
                                icon.classList.remove('far');
                                icon.classList.add('fas');
                            }
                        });

            }

            async function removeLike(likeDiv, dislikeDiv) {

                let reviewId = likeDiv.parentNode.parentNode.parentNode.id;
                await postData('/MML/LikeDislikeController', {
                    reviewId: reviewId,
                    toDo: '1'
                })
                        .then(data => {
                            console.log(data); // JSON data parsed by `data.json()` call
                            if (data.success) {
                                likeDiv.children[0].textContent = parseInt(likeDiv.children[0].textContent) - 1;
                                const icon = likeDiv.children[1].children[0];
                                icon.classList.remove('fas');
                                icon.classList.add('far');
                            }
                        });
            }

            async function addDislike(likeDiv, dislikeDiv) {

                let reviewId = likeDiv.parentNode.parentNode.parentNode.id;
                await postData('/MML/LikeDislikeController', {
                    reviewId: reviewId,
                    toDo: '2'
                })
                        .then(data => {
                            console.log(data); // JSON data parsed by `data.json()` call
                            if (data.success) {
                                dislikeDiv.children[1].textContent = parseInt(dislikeDiv.children[1].textContent) + 1;
                                const icon = dislikeDiv.children[0].children[0];
                                icon.classList.remove('far');
                                icon.classList.add('fas');
                            }
                        });
            }

            async function removeDislike(likeDiv, dislikeDiv) {

                let reviewId = likeDiv.parentNode.parentNode.parentNode.id;
                await postData('/MML/LikeDislikeController', {
                    reviewId: reviewId,
                    toDo: '3'
                })
                        .then(data => {
                            console.log(data); // JSON data parsed by `data.json()` call
                            if (data.success) {
                                dislikeDiv.children[1].textContent = parseInt(dislikeDiv.children[1].textContent) - 1;
                                const icon = dislikeDiv.children[0].children[0];
                                icon.classList.remove('fas');
                                icon.classList.add('far');
                            }
                        });
            }

            async function likeHandler(e) {
                const likeDiv = e.currentTarget;
                const dislikeDiv = likeDiv.parentElement.children[2];

                const icon = likeDiv.children[1].children[0];
                if (icon.classList.contains('fas')) {
                    await removeLike(likeDiv, dislikeDiv);
                } else {
                    const dislikeIcon = dislikeDiv.children[0].children[0];
                    if (dislikeIcon.classList.contains('fas')) {
                        await removeDislike(likeDiv, dislikeDiv);
                    }
                    addLike(likeDiv, dislikeDiv);


                }
            }

            async function dislikeHandler(e) {
                const dislikeDiv = e.currentTarget;
                const likeDiv = dislikeDiv.parentNode.children[0];

                const icon = dislikeDiv.children[0].children[0];
                if (icon.classList.contains('fas')) {
                    await removeDislike(likeDiv, dislikeDiv);
                } else {
                    const likeIcon = likeDiv.children[1].children[0];
                    if (likeIcon.classList.contains('fas')) {
                        await removeLike(likeDiv, dislikeDiv);
                    }
                    addDislike(likeDiv, dislikeDiv);


                }
            }

            const likeBtns = document.querySelectorAll(".likes");
            const dislikeBtns = document.querySelectorAll(".dislikes");

            likeBtns.forEach(btn => btn.addEventListener('click', likeHandler, true));
            dislikeBtns.forEach(btn => btn.addEventListener('click', dislikeHandler));

        </script>
        <% }%>

        <script src="scripts/disqus.js"></script>
        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by
            Disqus.</a></noscript>

        <script>
            const postBtn = document.getElementById('postBtn');
            const cancelPostBtn = document.getElementById('cancelPostBtn');
            const postForm = postBtn.parentElement;
            let inputs = postForm.querySelectorAll('input');
            inputs = [...inputs, postForm.querySelector('textarea')]



            cancelPostBtn.addEventListener('click', (e) => {
                inputs.forEach(elem => {
                    elem.value = "";
                    elem.classList.remove('active');
                });
                const clearBtn = document.querySelector('.rating-container .clear-rating');
                clearBtn.click();
            })
        </script>

    </body>

</html>