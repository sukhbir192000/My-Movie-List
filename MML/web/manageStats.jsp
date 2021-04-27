<%-- 
    Document   : manageUsers
    Created on : Apr 24, 2021, 10:24:37 PM
    Author     : Ishjot Singh
--%>

<%@page import="org.json.simple.JSONObject"%>
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
        <title>Manage Stats — Admin</title>
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
                            <a href="/MML/superAdmin/manageReviews" class="list-group-item content_color ps-4 border border-dark">
                                Manage Reviews
                            </a>
                            <a href="/MML/superAdmin/stats" class="list-group-item content_color ps-4 border border-dark active_color">
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
                                        <h1 class="h1-responsive">Stats</h1>
                                    </div>
                                    <div class="col-12 col-md-6 px-5">
                                        <div class="px-4 py-3 content_color ">
                                            <h3 class="h2 mb-4 text-white pt-3">Users Registered Daily</h3>
                                            <canvas id="usersDaily"></canvas>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 px-5 ">
                                        <div class=" px-4 py-3 content_color">

                                            <h3 class="h2 mb-4 text-white pt-3">Users Registered Cumulative</h3>
                                            <canvas id="usersTotal"></canvas>
                                        </div>
                                    </div>
                                    <%JSONObject stats = (JSONObject) request.getAttribute("stats");%>



                                </div>
                                <div class="row mt-5 pt-5">
                                    <div class="col-12 col-md-6 col-lg-4 px-3">
                                        <div class="content_color py-3 px-1 text-white fw-bold d-flex flex-row justify-content-around align-items-center">
                                            <h4 class="h5 m-0 text-white">
                                                Total Users: <%=stats.get("totalUsers")%>
                                            </h4>
                                            <i class="fas fa-users text-white fa-2x"></i>

                                        </div>

                                    </div>
                                    <div class="col-12 col-md-6 col-lg-4 px-3">
                                        <div class="content_color py-3 px-1 text-white fw-bold d-flex flex-row justify-content-around align-items-center">
                                            <h4 class="h5 m-0 text-white">
                                                Total Reviews: <%=stats.get("totalReviews")%>

                                            </h4>
                                            <i class="fas fa-search text-white fa-2x"></i>

                                        </div>

                                    </div>

                                    <div class="col-12 col-md-6 col-lg-4 px-3">
                                        <div class="content_color py-3 px-1 text-white fw-bold d-flex flex-row justify-content-around align-items-center">
                                            <h4 class="h5 m-0 text-white">
                                                Users Registered Today: <%=stats.get("usersToday")%>

                                            </h4>
                                            <i class="fas fa-user text-white fa-2x"></i>

                                        </div>

                                    </div>
                                </div>



                            </div>



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


        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.0/chart.min.js"
                integrity="sha512-RGbSeD/jDcZBWNsI1VCvdjcDULuSfWTtIva2ek5FtteXeSjLfXac4kqkDRHVGf1TwsXCAqPTF7/EYITD0/CTqw=="
        crossorigin="anonymous"></script>

        <script>
                    console.log("stats",<%=request.getAttribute("stats")%>);
                    let showSidebar = function (event) {
                        console.log("clicked!");
                        document.getElementById("sidebar").classList.toggle("d-block");
                        document.getElementById("sidebar").classList.toggle("d-none");
                        document.getElementById("sidebarToggler").classList.toggle("offset-8");
                        document.querySelector("#sidebarToggler i").classList.toggle("fa-rotate-270");
                        document.querySelector("#sidebarToggler i").classList.toggle("fa-rotate-90");
                    }


        </script>
        <script>
            var usersDaily = document.getElementById("usersDaily").getContext('2d');
            var usersTotal = document.getElementById("usersTotal").getContext('2d');
            let stats =<%=(JSONObject) request.getAttribute("stats")%>
            var myChart = new Chart(usersDaily, {
                type: 'line',
                data: {
                    labels: stats.usersDaily.map((elm) => {
                        return elm.date
                    }),
                    datasets: [{
                            label: 'Users', // Name the series
                            data: stats.usersDaily.map((elm) => {
                                return elm.userCount
                            }), // Specify the data values array
                            fill: false,
                            borderColor: 'white', // Add custom color border (Line)
                            backgroundColor: 'white', // Add custom color background (Points and Fill)
                            borderWidth: 2, // Specify bar border width

                        }]
                },
                options: {
                    responsive: true, // Instruct chart js to respond nicely.
                    maintainAspectRatio: true, // Add to prevent default behaviour of full-width/height 
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        xAxes: {
                            grid: {display: false,
                                borderColor: 'white',
                                color: 'white'
                            }
                        },
                        yAxes: {
                            grid: {display: false,
                                borderColor: 'white'},
                            color: 'white'
                        }
                    }
                }
            });
            var myChart = new Chart(usersTotal, {
                type: 'line',
                data: {
                    labels: stats.usersCumulative.map((elm) => {
                        return elm.date
                    }),
                    datasets: [{
                            label: 'Users', // Name the series
                            data: stats.usersCumulative.map((elm) => {
                                return elm.userCount
                            }), // Specify the data values array
                            fill: false,
                            borderColor: 'white', // Add custom color border (Line)
                            backgroundColor: 'white', // Add custom color background (Points and Fill)

                            borderWidth: 2, // Specify bar border width

                        }]
                },
                options: {
                    responsive: true, // Instruct chart js to respond nicely.
                    maintainAspectRatio: true, // Add to prevent default behaviour of full-width/height 
                    plugins: {
                        legend: {
                            display: false,
                            
                        }
                    },
                    scales: {
                        xAxes: {
                            grid: {
                                display: false,
                                borderColor: 'white',
                                color: 'white'
                            }
                          

                        },
                        yAxes: {
                            grid: {display: false,
                                borderColor: 'white'},
                            color: 'white'
                        }
                    }

                }
            });
        </script>
    </body>

</html>
