<%-- 
    Document   : my_profile
    Created on : Apr 21, 2021, 2:28:22 PM
    Author     : Ishjot Singh
--%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.Date"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
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
                         <% if(!currentUser.getBannerPic().isEmpty()){%> style="background:url('data:image/jpg;base64, <%=currentUser.getBannerPic()%>') center center;background-size: cover;" <%}%>>
                        <div class="row blur-bg p-0 h-100 h-md-auto">



                            <div
                                class="col offset-0 offset-md-4 offset-xl-3 d-flex flex-column justify-content-end align-items-center align-items-md-start  justify-content-md-center justify-content-lg-end">
                                <%
                                    User user = (User) (request.getAttribute("currentUser"));
                                    String profilePic = user.getProfilePic();
                                    if (profilePic.isEmpty()) {
                                %>
                                <div style="height:0;padding-top:40%;width:40%;background-image:url('images/def_user.svg');background-size: cover;"
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
                            <%}
                                userId = Integer.parseInt(request.getParameter("id"));
                                if (loggedUser.getUserId() != userId) {
                                    JSONObject friendStatus = (JSONObject) request.getAttribute("friendStatus");
                                    Integer outGoing = (Integer) friendStatus.get("friendRequestOutgoingStatus");
                                    Integer inComing = (Integer) friendStatus.get("friendRequestIncoming");
                                    System.out.println("status friend" + outGoing);
                                    if (outGoing != null && outGoing == 1) {
                            %>
                            <button class="btn  btn-yellow d-block d-md-none" >In Friends!</button>

                            <%} else if (outGoing != null && outGoing == 0) {%>
                            <button class="btn  btn-yellow d-block d-md-none" >Friend Request Sent</button>
                            <%} else if (inComing == 1) {%>
                            <button class="btn  btn-yellow d-block d-md-none confirmFriendButton" >Confirm Friend Request</button>

                            <%} else {%>
                            <button class="btn  btn-yellow d-block d-md-none addFriendButton" >Add Friend</button>

                            <%}%>
                            <%}%>
                        </div>
                    </div>

                    <div class="col-xl-2 col-md-3 col-12 d-none d-md-block  offset-md-1 mt-md-n10 me-0 pe-0 ps-0">
                        <div class="position-relative d-flex flex-column align-items-center">
                            <!--hi-->
                            <%

                                if (profilePic.isEmpty()) {
                            %>

                            <img src="images/def_user.svg" class="col-6 col-md-12 ">
                            <% } else {%>

                            <div style="height:0px;padding-top:150%;width:100%; background: url('data:image/jpg;base64, <%=profilePic%>') center center; background-size: cover;;"    >
                            </div>


                            <% }
                                userId = Integer.parseInt(request.getParameter("id"));
                                if (loggedUser.getUserId() != userId) {
                                    JSONObject friendStatus = (JSONObject) request.getAttribute("friendStatus");
                                    Integer outGoing = (Integer) friendStatus.get("friendRequestOutgoingStatus");
                                    Integer inComing = (Integer) friendStatus.get("friendRequestIncoming");
                                    System.out.println("status friend" + outGoing);
                                    if (outGoing != null && outGoing == 1) {
                            %>
                            <button class="position-absolute  bottom-0 mb-3 btn  btn-yellow btn-rounded px-5" >In Friends!</button>

                            <%} else if (outGoing != null && outGoing == 0) {%>
                            <button class="position-absolute  bottom-0 mb-3 btn  btn-yellow btn-rounded px-5" >Friend Request Sent</button>
                            <%} else if (inComing == 1) {%>
                            <button class="position-absolute  bottom-0 mb-3 btn  btn-yellow btn-rounded px-5 confirmFriendButton" >Confirm Friend Request</button>

                            <%} else {%>
                            <button class="position-absolute  bottom-0 mb-3 btn  btn-yellow btn-rounded px-5 addFriendButton" >Add Friend</button>

                            <%}%>
                            <%}%>
                        </div>
                        <div class="bg-dark text-white px-3 pb-3 mb-4 custom-font">
                            <p class="h5 pt-4">About</p>
                            <p><%=currentUser.getAbout()%></p>



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
                                       style="white-space: nowrap;"><span>Friend List (<%=((ArrayList<User>) request.getAttribute("friendList")).size()%>)</span></a>
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

                                        <!--<h4 class="text-white"></h4>-->
                                    </div>


                                </div>

                            </div>
                            <div class="tab-pane fade show mt-0 px-3  " id="watchlist-content" role="tabpanel">
                                <!-- Pills navs -->
                                <ul class="nav nav-pills mb-4 d-block d-sm-flex flex-row justify-content-center px-0 ps-2 "
                                    id="ex1" role="tablist">
                                    <li class="nav-item mx-0" role="presentation">
                                        <a class="nav-link straight-corner fw-bold active m-0 text-center" id="ex1-tab-1"
                                           data-mdb-toggle="pill" href="#ex1-pills-1" role="tab"
                                           aria-controls="ex1-pills-1" aria-selected="true">All</a>
                                    </li>
                                    <%
                                        JSONArray watchList = (JSONArray) (request.getAttribute("watchList"));
                                        for (int i = 0; i < watchList.size(); i++) {
                                            JSONObject watchListItem = (JSONObject) watchList.get(i);
                                    %>

                                    <li class="nav-item mx-0" role="presentation">
                                        <a class="nav-link straight-corner fw-bold m-0 text-center" id="ex1-tab-<%=i + 2%>"
                                           data-mdb-toggle="pill" href="#ex1-pills-<%=i + 2%>" role="tab"
                                           aria-controls="ex1-pills-<%=i + 2%>" aria-selected="true"><%=watchListItem.get("watchListType")%></a>
                                    </li>
                                    <%}%>

                                </ul>
                                <!-- Pills navs -->

                                <!-- Pills content -->

                                <div class="tab-content" id="ex1-content">
                                    <div class="tab-pane fade show active" id="ex1-pills-1" role="tabpanel" aria-labelledby="ex1-tab-1">
                                        <!--all-->
                                        <table class="table table-hover table-dark">
                                            <thead>
                                                <tr class="bg-yellow text-dark">
                                                    <th scope="col" class="text-center"></th>
                                                    <th scope="col" class="text-center">Name</th>
                                                    <th scope="col" class="text-center">Desc</th>
                                                    <th scope="col" class="text-center">Rating</th>
                                                </tr>
                                            </thead>
                                            <tbody class="fs-5">
                                                <%
                                                    watchList = (JSONArray) (request.getAttribute("watchList"));
                                                    for (int i = 0; i < watchList.size(); i++) {
                                                        JSONObject watchListItem = (JSONObject) watchList.get(i);
                                                        System.out.println("obj:" + watchListItem.get("details"));
                                                        JSONArray finalList = (JSONArray) (watchListItem.get("details"));

                                                        System.out.println("item" + finalList);
                                                        for (int j = 0; j < finalList.size(); j++) {
                                                            JSONObject listItem = (JSONObject) finalList.get(j);%>

                                                <tr>
                                                    <th scope="row" class="align-middle text-center">
                                                        <% if(listItem.get("poster_path")!=null) { %>
                                                            <img class="table-img" src="https://image.tmdb.org/t/p/w154/<%=listItem.get("poster_path")%>">
                                                        <% } else { %>
                                                            <div style="height:0; padding-top:160%; width:100%; background:#777 url('images/default.png') no-repeat center center; background-size: contain;"></div>
                                                        <% } %>
                                                    </th>
                                                    <td class="align-middle text-yellow text-center"><a class="text-yellow" href="/MML/movie?id=<%=listItem.get("id")%>"><%=listItem.get("title")%></a></td>
                                                    <td class="align-middle text-center"><%=listItem.get("tagline")%></td>
                                                    <td class="align-middle text-center"><%=listItem.get("vote_average")%>/10</td>
                                                </tr>

                                                <% }
                                                    }%>
                                            </tbody>
                                        </table>



                                        <!--all end-->
                                    </div>
                                    <%
                                        watchList = (JSONArray) (request.getAttribute("watchList"));
                                        for (int i = 0; i < watchList.size(); i++) {
                                            JSONObject watchListItem = (JSONObject) watchList.get(i);
                                            System.out.println("obj:" + watchListItem.get("details"));
                                            JSONArray finalList = (JSONArray) (watchListItem.get("details"));

                                    %>
                                    <div class="tab-pane fade" id="ex1-pills-<%=i + 2%>" role="tabpanel"
                                         aria-labelledby="ex1-tab-<%=i + 2%>">
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
                                                <tbody class="fs-5">
                                                    <%
                                                        System.out.println("item" + finalList);
                                                        for (int j = 0; j < finalList.size(); j++) {
                                                            JSONObject listItem = (JSONObject) finalList.get(j);%>

                                                    <tr>
                                                        <th scope="row" class="align-middle">
                                                            <% if(listItem.get("poster_path")!=null) { %>
                                                                <img class="table-img" src="https://image.tmdb.org/t/p/w154/<%=listItem.get("poster_path")%>">
                                                            <% } else { %>
                                                                <div style="height:0; padding-top:160%; width:100%; background:#777 url('images/default.png') no-repeat center center; background-size: contain;"></div>
                                                            <% } %>
                                                        </th>
                                                        <td class="align-middle text-yellow text-center"><a class="text-yellow" href="/MML/movie?id=<%=listItem.get("id")%>"><%=listItem.get("title")%></a></td>
                                                        <td class="align-middle text-center "><%=listItem.get("tagline")%></td>
                                                        <td class="align-middle text-center"><%=listItem.get("vote_average")%>/10</td>
                                                    </tr>

                                                    <% } %>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>

                                    <%
                                        }%>
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
                                            <%
                                                if (currentUser.getUserId() == loggedUser.getUserId()){
                                            %>
                                            <th scope="col" class="text-center">Options</th>
                                            <%
                                                }
                                            %>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% ArrayList<User> friendList = ((ArrayList<User>) request.getAttribute("friendList"));
                                            for (int i = 0; i < friendList.size(); i++) {

                                                User myFriend = (User) friendList.get(i);
                                        %>

                                        <tr >

                                            <td  class="align-middle p-0 py-2 ps-3 " >

                                                <%
                                                    String friendPic = myFriend.getProfilePic();

                                                    if (friendPic.isEmpty() || friendPic.equals("")) {


                                                %>
                                                <div style="padding-top:160%;width:100%;background:url('images/def_user.svg') center center ;background-size: cover;"
                                                     class="   ">

                                                </div>

                                                <% } else {
                                                %>
                                                <div style="padding-top:160%;width:100%; background: url('data:image/jpg;base64, <%=friendPic%>') center center; background-size: cover;"
                                                     class=" ">

                                                </div>

                                                <% }%>

                                            </td>
                                            <td class="align-middle text-center "><a class="text-yellow" href="/MML/profile?id=<%=myFriend.getUserId()%>"><%=myFriend.getUsername()%></a></td>
                                            <td class="align-middle text-center"><%=myFriend.getAbout()%></td>
                                            <%
                                                if (currentUser.getUserId() == loggedUser.getUserId()){
                                            %>
                                            <td class="align-middle text-center"><button
                                                    class="btn btn-small btn-yellow removeFriendButton" id="remove_<%=myFriend.getUserId()%>">Remove Friend</button></td>
                                            <%
                                                }
                                            %>
                                        </tr>

                                        <%}%>
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
        <script>

            let confirmButtons = document.querySelectorAll(".confirmFriendButton");
            console.log("adding event listener", confirmButtons);

            if (confirmButtons.length > 0) {
                confirmButtons.forEach((elm) => {
                    elm.addEventListener('click', addFriend);
                    console.log("adding event listener loop")
                })
            }

            let addFriendButtons = document.querySelectorAll(".addFriendButton");
            console.log("adding event listerner to add", addFriendButtons);
            if (addFriendButtons.length > 0) {
                addFriendButtons.forEach((elm) => {
                    elm.addEventListener('click', sendFriendRequest);
                    console.log("adding event listener loop")
                })
            }
            function sendFriendRequest(e) {
                fetch("/MML/SendFriendRequestController", {
                    method: "POST",
                    body: JSON.stringify({
                        userId: <%=loggedUser.getUserId()%>,
                        visitorId: <%=currentUser.getUserId()%>,

                    })
                }).then(response => response.json())
                        .then(data => {
                            console.log(data);
                            e.target.innerText = "Friend Request Sent";
                        })

            }
            function addFriend(e) {
                fetch("/MML/AddFriendController", {
                    method: "POST",
                    body: JSON.stringify({
                        userId: <%=loggedUser.getUserId()%>,
                        visitorId: <%=currentUser.getUserId()%>,

                    })
                }).then(response => response.json())
                        .then(data => {
                            console.log(data);
                            e.target.innerText = "In Friends!";
                        })

            }

        </script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
        <!--<script type="text/javascript" src="./custom-carousel.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/snap.svg/0.3.0/snap.svg-min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.0/chart.min.js"
                integrity="sha512-RGbSeD/jDcZBWNsI1VCvdjcDULuSfWTtIva2ek5FtteXeSjLfXac4kqkDRHVGf1TwsXCAqPTF7/EYITD0/CTqw=="
        crossorigin="anonymous"></script>
        <script>
            console.log("friendStatus",<%=request.getAttribute("friendStatus")%>)
            let movieStats =<%=request.getAttribute("movieStatus")%>;
            let showStats =<%=request.getAttribute("showStatus")%>;
            console.log("chart:", Chart.Legend)
            Chart.Legend.afterEvent = function () {
                this.width = this.width + 50;
            };
            var colors = ['#f9c80e', '#f42c04', '#035e7b', '#e5e3e5', '#2e933c', '#6c757d'];
            var donutOptions = {

                plugins: {legend: {display: false, position: 'right', padding: 20, labels: {pointStyle: 'circle', usePointStyle: true, padding: 20, offset: 20}}}
            };
            let movieArrayData = [], movieArrayKeys = [];
            for (let keys in movieStats) {
                movieArrayKeys.push(keys);
                movieArrayData.push(movieStats[keys])
            }
            let showArrayData = [], showArrayKeys = [];
            for (let keys in showStats) {
                showArrayKeys.push(keys);
                showArrayData.push(showStats[keys])
            }
            var chDonutData1 = {
                labels: movieArrayKeys,
                datasets: [
                    {
                        backgroundColor: colors.slice(0, 5),
                        borderWidth: 0,
                        data: movieArrayData
                    }
                ]
            };
            var chDonutData2 = {
                labels: showArrayKeys,
                datasets: [
                    {
                        backgroundColor: colors.slice(0, 3),
                        borderWidth: 0,
                        data: showArrayData
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
                    data: chDonutData2,
                    options: donutOptions
                });
            }
            var ctx = document.getElementById("myChart").getContext('2d');
            let myDate1;
            let myDate2;
            let watchTimeDetails =<%=(JSONArray) request.getAttribute("watchTimeDetails")%>
            console.log('hello', watchTimeDetails)
            let j = 0;
            let watchTimeFiltered = [];
            for (let i = 1; i <= (new Date(Date.now())).getDate(); i++) {
                
                let month = new Date(watchTimeDetails[j].date).getMonth() + 1;
                if (new Date(watchTimeDetails[j].date).getDate() > i) {
                    watchTimeFiltered.push({date: i + '-' + month, watch_time: 0});
                    continue;
                } else {
                    watchTimeFiltered.push({date: i + '-' + month, watch_time: watchTimeDetails[j].watch_time});
                    j++;
                    if(j >= watchTimeDetails.length){
                        for(let k = i+1; k <= (new Date()).getDate(); k++){
                            watchTimeFiltered.push({date: k + '-' + month, watch_time: 0});
                        }
                        break
                    }
                }
            }
            console.log(watchTimeFiltered, watchTimeDetails)
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: watchTimeFiltered.map((elm) => elm.date),
                    datasets: [{
                            label: 'Watch Time(min)', // Name the series
                            data: watchTimeFiltered.map((elm) => elm.watch_time), // Specify the data values array
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
        <script>
            let removeFriendsButton = document.querySelectorAll(".removeFriendButton");
            console.log("adding event listener", removeFriendsButton);

            if (removeFriendsButton.length > 0) {
                removeFriendsButton.forEach((elm) => {
                    elm.addEventListener('click', removeFriend);
                    console.log("adding event listener loop")
                })
            }


            function removeFriend(e) {
                let currentTarget = e.currentTarget;
                let friendRemoveId = currentTarget.id;
                friendRemoveId = friendRemoveId.split('_');
                friendRemoveId = friendRemoveId[1];
                console.log("target value for remove", friendRemoveId);

                fetch("/MML/RemoveFriendController", {
                    method: "POST",
                    body: JSON.stringify({
                        userId: <%=loggedUser.getUserId()%>,
                        visitorId: parseInt(friendRemoveId),

                    })
                }).then(response => response.json())
                        .then(data => {
                            console.log(data);
                            currentTarget.parentNode.parentNode.remove();
                        })

            }

        </script>

    </body>


</html>
