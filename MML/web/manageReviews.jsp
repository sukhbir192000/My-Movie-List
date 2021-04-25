<%-- 
    Document   : manageUsers
    Created on : Apr 24, 2021, 10:24:37 PM
    Author     : Ishjot Singh
--%>

<%-- 
    Document   : superAdmin
    Created on : Apr 24, 2021, 6:08:00 PM
    Author     : Ishjot Singh
--%>

<%@page import="servlets.MovieController"%>
<%@page import="daos.CarouselDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.css" rel="stylesheet" />

    <!-- <link rel="stylesheet" href="color.css">
    <link rel="stylesheet" href="style.css"> -->
    <link rel="stylesheet" href="../css/superadminStyle.css">
    <title>Manage Reviews — Admin</title>
</head>

<body>
    <div class="alert alert-success mb-0 mt-5 alert-fixed end-0 mt-3 me-3 pe-5 fade" style="z-index:1000; width: 400px; top: 2em;" id="successCarousel" role="alert" data-mdb-color="secondary">
        <i class="fas fa-check me-2"></i>
        Carousel updated successfully!
    </div>
    <div class="container-fluid">
        <div class="row p-0">
            <div id="sidebar"
                class="d-none d-md-block col-8 col-md-3 p-0 vh-100 sidebar_color border-right border-dark overflow-auto fixed-top">
                <div class="d-flex flex-column sidebar_color p-0  ">
                    <div class="p-0 w-100 m-0">
                        <div class="w-100 text-left text-white mt-3 ps-4 d-flex flex-row align-items-center">
                            <!-- image over here -->
                            MML
                        </div>
                        <a href="/MML/superAdmin/manageCarousel"
                            class="list-group-item content_color mt-3 ps-4 border border-dark">
                            Manage Carousel
                        </a>
                        <a href="/MML/superAdmin/manageUsers" class="list-group-item content_color ps-4 border border-dark">
                            Manage Users
                        </a>
                        <a href="/MML/superAdmin/manageReviews" class="list-group-item content_color ps-4 border border-dark active_color">
                            Manage Reviews
                        </a>
                        <a href="/MML/superAdmin/stats" class="list-group-item content_color ps-4 border border-dark">
                            Stats
                        </a>

                    </div>



                </div>
            </div>
            <span id="sidebarToggler" onClick="showSidebar()"
                class="d-flex justify-content-center align-items-center d-md-none sidebar_color ps-2 display-inline fixed-bottom rounded-right mb-3 navbar-expand py-2">
                <!-- [ngClass]="{'offset-8':visibleSidebar}">  [ngClass]="{'navbar-rotate':visibleSidebar}"-->
                <i class="fab fa-vuejs fa-rotate-270"></i>
            </span>
            <div class="col-12 col-md-9 offset-md-3 px-0  min-vh-100 bg-grey ">

                <div
                    class="w-100 bg-white text-left mt-0 shadow pe-4 d-flex flex-row py-2 justify-content-end sticky-top">
                    <div class="d-flex flex-column me-3 justify-content-center align-items-end">
                        <small class="p-0 m-0 font-weight-bold">Puneet</small>
                        <small class="p-0 m-0">puneetkalsi99@gmail.com</small>
                    </div>
                    <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg" class="rounded-circle z-depth-0 "
                        alt="avatar image" height="55" />

                </div>
                <div class="ps-3 pe-3 ">

                    <div class="min-vh-100 d-flex flex-column px-1 px-md-3 ">
                        <div class="p-0">
                            <div class="row p-0 text-dark">
                                <div class="col-12 pb-3 pt-4 ps-1 ps-md-4">
                                    <h1 class="h1-responsive">Manage Reviews</h1>
                                </div>
                            </div>
                            <!-- Tabs navs -->


                        </div>

                        <!-- Tabs navs -->
                        <ul class="nav nav-tabs mb-3" id="ex1" role="tablist">
                            <li class="nav-item" role="presentation">
                            <a
                                class="nav-link active"
                                id="ex1-tab-1"
                                data-mdb-toggle="tab"
                                href="#ex1-tabs-1"
                                role="tab"
                                aria-controls="ex1-tabs-1"
                                aria-selected="true"
                                >Currently in Carousel</a
                            >
                            </li>
                            <li class="nav-item" role="presentation">
                            <a
                                class="nav-link"
                                id="ex1-tab-2"
                                data-mdb-toggle="tab"
                                href="#ex1-tabs-2"
                                role="tab"
                                aria-controls="ex1-tabs-2"
                                aria-selected="false"
                                >Add to Carousel</a
                            >
                            </li>
                           
                        </ul>
                        <!-- Tabs navs -->
                        
                        <!-- Tabs content -->
                        <div class="tab-content" id="ex1-content">
                            <div
                            class="tab-pane fade show active"
                            id="ex1-tabs-1"
                            role="tabpanel"
                            aria-labelledby="ex1-tab-1"
                            >
                                <div class="row text-dark border round px-3 bg-white ">

                                    <div class="col-12 col-md-6 mb-4 ps-0 pt-3 ">
                                        <h3 class="h3-responsive m-0">Edit Carousel</h3>
                                    </div>
                                    
                                    <table class="table-responsive mt-3 mb-5 table table-hover">
                                        <thead class="table-dark border">
                                            <tr>
                                                <th scope="col" class="text-center">Movie ID</th>
                                                <th scope="col" class="text-center">Movie Name</th>
                                                <th scope="col" class="text-center">Release</th>
                                                <th scope="col" class="text-center">Remove</th>
                                            </tr>
                                        
                                        </thead>
                                        <tbody id="inCarousel" class="border">

                                        </tbody>
                                    </table>

                                </div>
                            </div>


                            <div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel" aria-labelledby="ex1-tab-2">
                                <div class="row text-dark border round px-3 bg-white ">
                                    <div class="col-12  mb-4 ps-0 pt-3 ">
                                        <h3 class="h3-responsive mb-4">Search Movie</h3>
                                        <div class="">
                                            <div class="form-outline">
                                                <input type="text" id="searchMovie" name="search" class="form-control" />
                                                <label class="form-label" for="searchMovie">Search</label>
                                            </div>
                                        </div>
                                    </div>

                                   
                                    
                                    <table class="table-responsive mt-3 mb-5 table table-hover">
                                        <thead class="table-dark border">
                                            <tr>
                                                <th scope="col" class="text-center">Movie ID</th>
                                                <th scope="col" class="text-center">Movie Name</th>
                                                <th scope="col" class="text-center">Release</th>
                                                <th scope="col" class="text-center">Add</th>
                                            </tr>
                                        
                                        </thead>
                                        <tbody id="tableMovies" class="border ">

                                        </tbody>
                                    </table>
        
                                </div>
                                
                            </div>
                        </div>
                        <!-- Tabs content -->

                    </div>
                </div>
            </div>
        </div>

    </div>


    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/snap.svg/0.3.0/snap.svg-min.js"></script>

    <script>
        let showSidebar = function (event) {
            console.log("clicked!");
            document.getElementById("sidebar").classList.toggle("d-block");
            document.getElementById("sidebar").classList.toggle("d-none");
            document.getElementById("sidebarToggler").classList.toggle("offset-8");
            document.querySelector("#sidebarToggler i").classList.toggle("fa-rotate-270");
            document.querySelector("#sidebarToggler i").classList.toggle("fa-rotate-90");
        }


    </script>
</body>

</html>
