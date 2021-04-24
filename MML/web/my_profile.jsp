<%-- 
    Document   : my_profile
    Created on : Apr 21, 2021, 2:28:22 PM
    Author     : Ishjot Singh
--%>

<%@page import="beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <link rel="stylesheet" href="css/color.css">
        <link rel="stylesheet" href="css/common.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Tammudu+2:wght@400;500;600;700;800&display=swap"
              rel="stylesheet">

        <title>My Profile — My Movie List</title>
        <style>
            .custom-font {
                font-family: 'Baloo Tammudu 2', cursive;
            }

            .blur-bg {
                background-color: rgba(0, 0, 0, 0.74);
            }

            .nav-pills .nav-link.active>span {
                padding: 0 10px 7px;
                border-bottom: 5px #F9C80E solid;
            }

            .nav-pills .nav-link.active {

                background-color: #F9C80E;
                color: black;
            }

            .straight-corner {
                border-radius: 0 !important;

            }

            .table-img {
                max-width: 100px !important;
            }

            @media screen and (max-width:576px) {
                .table-img {
                    max-width: 50px !important;
                }
            }
        </style>
    </head>

    <body>
        <div class="container-fluid bg-black p-0 min-vh-100 d-flex flex-column justify-content-between">
            <div>
                <jsp:include page="navbar.jsp" />
                <%
                    HttpSession ses = request.getSession();
                    User loggedUser = (User) ses.getAttribute("loggedUser");
                    User currentUser = (User) request.getAttribute("currentUser");

                %>
                <div class="row position-relative p-0 m-0">
                    <div class="min-vh-25 bg-danger d-flex flex-column justify-content-end"
                         style="background:url('images/in-back.jpg');background-size: cover;">
                        <div class="row blur-bg p-0 h-100 h-md-auto">



                            <div
                                class="col offset-0 offset-md-4 offset-xl-3 d-flex flex-column justify-content-end align-items-center align-items-md-start  justify-content-md-center justify-content-lg-end">
                                <!--hi-->
                                <%                                    User user =(User) (request.getAttribute("currentUser"));
                                    String profilePic = user.getProfilePic();
                                    if (profilePic.isEmpty()) {
                                %>
                                <div style="height:0;padding-top:40%;width:40%;background-image:url('images/in.jpg');background-size: cover;"
                                     class=" d-block d-md-none mt-3 rounded-circle">

                                </div>

                                <% } else {%>
                                <div style="height:0;padding-top:40%;width:40%; background: url('data:image/jpg;base64, <%=profilePic%>') center center; background-size: cover;background-size: cover;"
                                     class=" d-block d-md-none mt-3 rounded-circle">

                                </div>

                                <% }%>
                                <!--hi-->



                                <h1 class="h1 pb-2 pt-3 text-white ps-md-5 "><%=currentUser.getUsername()%></h1>


                            </div>
                            <%
                                int userId = Integer.parseInt(request.getParameter("id"));
                                if (loggedUser.getUserId() == userId) {%>
                            <div class="position-absolute top-0 pt-3 pe-md-5 pe-3 d-flex flex-column justify-content-end align-items-end">
                                <div><a href="/MML/editProfile" class="btn btn-light ps-2 pe-3 px-md-3" style="white-space: nowrap;"><i class="fas fa-user-edit me-2"></i>Edit <span class="d-none d-md-inline">Profile</span>  </a></div>

                            </div>
                            <%}%>
                            <button class="btn  btn-yellow d-block d-md-none">Add
                                Friend</button>
                        </div>
                    </div>

                    <div class="col-xl-2 col-md-3 col-12 d-none d-md-block  offset-md-1 mt-md-n10 me-0 pe-0 ps-0">
                        <div class="position-relative d-flex flex-column align-items-center">
                            <!--hi-->
                            <%

                                if (profilePic.isEmpty()) {
                            %>

                            <img src="images/in.jpg" class="col-6 col-md-12 ">
                            <% } else {%>

                            <div style="height:0px;padding-top:150%;width:100%; background: url('data:image/jpg;base64, <%=profilePic%>') center center; background-size: cover;;"
                              >
                            </div>


                            <% }%>
                            <!--hi-->

                            <button class="position-absolute  bottom-0 mb-3 btn  btn-yellow btn-rounded px-5">Add
                                Friend</button>
                        </div>
                        <div class="bg-dark text-white px-3 pb-3 mb-4 custom-font">
                            <p class="h5 pt-4">About</p>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique perferendis</p>
                            <div class="d-flex flex-column align-items-end pe-3">
                                <p>FRIENDS: 10</p>
                                <p>REVIEWS: 10</p>
                            </div>


                        </div>

                    </div>
                    <div id="social-section" class="col-12 col-xl-8 col-md-8  px-lg-5 px-2">
                        <div
                            class="heading-container mt-5 d-block d-sm-flex flex-row justify-content-start align-items-baseline">

                            <!-- Tabs navs -->
                            <ul class="nav nav-pills nav-justified ps-2" id="social-nav" role="tablist">
                                <li class="nav-item h-auto " role="presentation">
                                    <a class="nav-link bg-black text-white fs-6 px-1 active" id="review-button"
                                       data-mdb-toggle="pill" href="#review-content" role="tab"
                                       aria-controls="review-content" aria-selected="true"><span>Stats</span></a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link bg-black text-white fs-6 px-1" id="watchlist-button"
                                       data-mdb-toggle="pill" href="#watchlist-content" role="tab"
                                       aria-controls="watchlist-content" aria-selected="false"><span>WatchList</span></a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link bg-black text-white fs-6 px-1" id="friendlist-button"
                                       data-mdb-toggle="pill" href="#friendlist-content" role="tab"
                                       aria-controls="friendlist-content" aria-selected="false"
                                       style="white-space: nowrap;"><span>Friend List</span></a>
                                </li>
                            </ul>
                            <!-- Tabs navs -->

                        </div>

                        <div class="tab-content mt-0 pt-0 " id="social-content">
                            <div class="tab-pane fade show active" id="review-content" role="tabpanel"
                                 aria-labelledby="review-button">


                                <div class="mt-5 px-0  pb-5 pt-0">

                                    <div class="d-flex flex-row justify-content-start mt-0 ">

                                        <div class=" col-md-5 col-6 col-xl-3  px-sm-5 px-3 ">
                                            <h3 class="h3 text-white  mb-4">Movies</h3>
                                            <canvas id="chDonut1"></canvas>

                                        </div>
                                        <div
                                            class="border border-top-0 border-start-0 border-bottom-0 mt-5 mx-md-5 d-none d-md-block">
                                        </div>
                                        <div class="col-md-5 col-6 col-xl-3  px-sm-5 px-3">
                                            <h3 class="h3 text-white mb-4">Shows</h3>
                                            <canvas id="chDonut2"></canvas>

                                        </div>


                                        <!-- <div class="col-3 d-flex flex-column justify-content-center align-items-center px-0 ps-5">
                                                <ul class=" fs-5 " aria-labelledby="watchlist-btn" style="list-style-type:none">
                                                    
                                                </ul>
                                                <ul class="fs-5 w-100 text-center text-white  ps-0" style="list-style-type:none"
                                                    aria-labelledby="watchlist-btn">
                                                    <li><a class="dropdown-item bg-yellow" href="#">Watching</a></li>
                                                    <li><a class="dropdown-item bg-green" href="#">Completed</a></li>
                                                    <li><a class="dropdown-item bg-red" href="#">On hold</a></li>
                                                    <li><a class="dropdown-item bg-white" href="#">Dropped</a></li>
                                                    <li><a class="dropdown-item bg-white" href="#">Plan to watch</a></li>
                                                </ul>
                                            </div> -->



                                    </div>
                                    <div class="flex flex-row px-2 px-md-5 mt-5">
                                        <h3 class="h2 text-white pt-3">Watch Time</h3>
                                        <canvas id="myChart"></canvas>


                                    </div>


                                </div>

                            </div>
                            <div class="tab-pane fade show mt-0 px-3  " id="watchlist-content" role="tabpanel">
                                <!-- Pills navs -->
                                <ul class="nav nav-pills mb-4 d-block d-sm-flex flex-row justify-content-center px-0 ps-2 "
                                    id="ex1" role="tablist">
                                    <li class="nav-item mx-0" role="presentation">
                                        <a class="nav-link straight-corner fw-bold  active m-0 text-center" id="ex1-tab-1"
                                           data-mdb-toggle="pill" href="#ex1-pills-1" role="tab"
                                           aria-controls="ex1-pills-1" aria-selected="true">All</a>
                                    </li>
                                    <li class="nav-item mx-0" role="presentation">
                                        <a class="nav-link straight-corner m-0 fw-bold text-center" id="ex1-tab-2"
                                           data-mdb-toggle="pill" href="#ex1-pills-2" role="tab"
                                           aria-controls="ex1-pills-2" aria-selected="false">Completed</a>
                                    </li>
                                    <li class="nav-item mx-0" role="presentation">
                                        <a class="nav-link straight-corner m-0 fw-bold text-center" id="ex1-tab-3"
                                           data-mdb-toggle="pill" href="#ex1-pills-3" role="tab"
                                           aria-controls="ex1-pills-3" aria-selected="false">Watching Now</a>
                                    </li>
                                </ul>
                                <!-- Pills navs -->

                                <!-- Pills content -->
                                <div class="tab-content" id="ex1-content">
                                    <div class="tab-pane fade show active" id="ex1-pills-1" role="tabpanel"
                                         aria-labelledby="ex1-tab-1">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-dark">
                                                <thead>
                                                    <tr class="bg-yellow text-dark">
                                                        <th scope="col" class="text-center"></th>
                                                        <th scope="col" class="text-center">Name</th>
                                                        <th scope="col" class="text-center">Desc</th>
                                                        <th scope="col" class="text-center">Rating</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row" class="align-middle"><img class="table-img"
                                                                                                  src="images/in.jpg"></th>
                                                        <td class="align-middle">Content</td>
                                                        <td class="align-middle ">extremely long content i want to test
                                                            outextremely long content i
                                                            want to test outextremely long content i want to test
                                                            outextremely
                                                            long content i want to test outextremely long content i want to
                                                            test
                                                            outextremely long content i want to test outextremely long
                                                            content i
                                                            want to test out</td>
                                                        <td class="align-middle">5.0</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row" class="align-middle"><img class="table-img"
                                                                                                  src="images/in.jpg"></th>

                                                        <td class="align-middle">Justice League</td>
                                                        <td class="align-middle">this is the description</td>
                                                        <td class="align-middle">4.9</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row"><img class="table-img" src="images/in.jpg"></th>

                                                        <td class="align-middle">Iron Man</th>
                                                        <td class="align-middle">I am iron man.</td>
                                                        <td class="align-middle">3.7</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                    <div class="tab-pane fade" id="ex1-pills-2" role="tabpanel" aria-labelledby="ex1-tab-2">
                                        Tab 2 content
                                    </div>
                                    <div class="tab-pane fade" id="ex1-pills-3" role="tabpanel" aria-labelledby="ex1-tab-3">
                                        Tab 3 content
                                    </div>
                                </div>
                                <!-- Pills content -->
                            </div>
                            <div class="tab-pane fade show mt-0 " id="friendlist-content" role="tabpanel">
                                <table class="table table-hover table-dark">
                                    <thead>
                                        <tr class="bg-yellow text-dark">
                                            <th scope="col" class="text-center"></th>
                                            <th scope="col" class="text-center">Name</th>
                                            <th scope="col" class="text-center">About</th>
                                            <th scope="col" class="text-center">Options</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row" class="align-middle"><img class="table-img" src="images/in.jpg">
                                            </th>
                                            <td class="align-middle text-center">Content</td>
                                            <td class="align-middle text-center">Yo me chill</td>
                                            <td class="align-middle text-center"><button
                                                    class="btn btn-small btn-yellow ">Remove Friend</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="align-middle"><img class="table-img" src="images/in.jpg">
                                            </th>

                                            <td class="align-middle text-center">Justice League</td>
                                            <td class="align-middle text-center">Yo me chill too</td>

                                            <td class="align-middle text-center"><button
                                                    class="btn btn-small btn-yellow">Remove Friend</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><img class="table-img" src="images/in.jpg"></th>

                                            <td class="align-middle text-center">Iron Man</th>
                                            <td class="align-middle text-center">Yo me chill three</td>

                                            <td class="align-middle text-center"><button
                                                    class="btn btn-small btn-yellow">Remove Friend</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Tabs content -->
                    </div>

                </div>
            </div>

            <jsp:include page="footer.jsp" />

        </div>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
        <script type="text/javascript" src="./custom-carousel.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/snap.svg/0.3.0/snap.svg-min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.0/chart.min.js"
                integrity="sha512-RGbSeD/jDcZBWNsI1VCvdjcDULuSfWTtIva2ek5FtteXeSjLfXac4kqkDRHVGf1TwsXCAqPTF7/EYITD0/CTqw=="
        crossorigin="anonymous"></script>
        <script>
            let movieStats=<%=request.getAttribute("movieStatus")%>;
            let showStats=<%=request.getAttribute("showStatus")%>;
        
            console.log("chart:", Chart.Legend)
            Chart.Legend.afterEvent = function () {
                this.width = this.width + 50;
            };
            var colors = ['#007bff', '#28a745', '#333333', '#c3e6cb', '#dc3545', '#6c757d'];
            var donutOptions = {

                plugins: {legend: {display: false, position: 'right', padding: 20, labels: {pointStyle: 'circle', usePointStyle: true, padding: 20, offset: 20}}}
            };
            var chDonutData1 = {
                labels: ['Bootstrap', 'Popper', 'Other'],
                datasets: [
                    {
                        backgroundColor: colors.slice(0, 3),
                        borderWidth: 0,
                        data: [74, 11, 40]
                    }
                ]
            };
            var chDonut1 = document.getElementById("chDonut1");
            console.log(chDonut1);
            if (chDonut1) {
                new Chart(chDonut1, {
                    type: 'doughnut',
                    data: chDonutData1,
                    options: donutOptions
                });
            }
            var chDonut2 = document.getElementById("chDonut2");
            // console.log(chDonut1);
            if (chDonut2) {
                new Chart(chDonut2, {
                    type: 'doughnut',
                    data: chDonutData1,
                    options: donutOptions
                });
            }
            var ctx = document.getElementById("myChart").getContext('2d');


            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                    datasets: [{
                            label: 'Watch Time(s)', // Name the series
                            data: [500, 50, 2424, 14040, 14141, 4111, 4544, 47, 5555, 6811], // Specify the data values array
                            fill: false,
                            borderColor: 'yellow', // Add custom color border (Line)
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
                    }
                }
            });

        </script>
    </body>

</html>
