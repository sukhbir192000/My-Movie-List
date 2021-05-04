
<%@page import="java.util.ArrayList"%>
<%@page import="beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="true" %>
<style>
    .dropstart:hover .dropdown-menu {
        display: block;
        margin-top: 0;
    }
</style>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark elegant-color">
    <!-- Container wrapper -->
    <div class="container-lg">

        <!-- Toggle button -->
        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>

        <!-- Navbar brand -->
        <a class="navbar-brand mx-auto" href="/MML/home"><img src="images/logo3.jpg" alt="MML" class="logo"></a>

        <% if (session.getAttribute("loggedUser") == null) { %>
        <a class="btn btn-outline-white d-inline d-lg-none" href="#">Login</a>
        <% } else {%>
        <ul class="navbar-nav ps-2 d-inline d-lg-none">
            <!-- Avatar -->
            <li class="nav-item dropdown">
                <a
                    class="nav-link dropdown-toggle d-flex align-items-center"
                    href="#"
                    id="user-dropdown"
                    role="button"
                    data-mdb-toggle="dropdown"
                    aria-expanded="false"
                    >

                    <%
                        User user = ((User) (request.getSession()).getAttribute("loggedUser"));
                        String profilePic = user.getProfilePic();
                        if (profilePic.isEmpty()) {
                    %>

                    <i id="default-profile-pic-sm" class="fas fa-user-circle fa-lg" style="font-size: 35px"></i>
                    <div id="change-profile-pic-sm" class="d-none" style="height: 0;border-radius: 100px; width: 2em; padding-top: 2em;">
                    </div>

                    <% } else {%>

                    <i id="default-profile-pic-sm" class="d-none fas fa-user-circle fa-lg" style="font-size: 35px"></i>
                    <div id="change-profile-pic-sm" style="height: 0;border-radius: 100px; width: 2em; padding-top: 2em; background: url('data:image/jpg;base64, <%=profilePic%>') center center; background-size: cover;">
                    </div>
                    <% }%>
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="user-dropdown">
                    <li><a class="dropdown-item" href="/MML/profile?id=<%=((User) (request.getSession()).getAttribute("loggedUser")).getUserId()%>">My profile</a></li>
                    <li><a class="dropdown-item" href="/MML/editProfile">Edit Profile</a></li>
                    <li><a class="dropdown-item" href="/MML/logout">Logout</a></li>
                </ul>
            </li>
        </ul>
        <% }%>



        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Left links -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/MML/home">Home</a>
                </li>
                <!-- Navbar dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="movie-dropdown" role="button"
                       data-mdb-toggle="dropdown" aria-expanded="false">
                        Movies
                    </a>
                    <!-- Dropdown menu -->
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/MML/movies">Most Popular</a></li>
                        <li><a class="dropdown-item" href="/MML/movies?q=tr">Top Rated</a></li>
                        <li><a class="dropdown-item" href="/MML/movies?q=np">In Theaters</a></li>
                        <li><a class="dropdown-item" href="/MML/movies?q=cs">Coming Soon</a></li>
                    </ul>
                </li>
                <!-- Navbar dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="tv-dropdown" role="button"
                       data-mdb-toggle="dropdown" aria-expanded="false">
                        TV Shows
                    </a>
                    <!-- Dropdown menu -->
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/MML/shows">Most Popular</a></li>
                        <li><a class="dropdown-item" href="/MML/shows?q=tr">Top Rated</a></li>
                        <li><a class="dropdown-item" href="/MML/shows?q=at">Airing today</a></li>
                        <li><a class="dropdown-item" href="/MML/shows?q=ot">On TV</a></li>
                    </ul>
                </li>
            </ul>
            <!-- Left links -->

            <!-- Search form -->
            <div class="position-relative" id="searchContainer">
                <form class="d-flex input-group w-auto form-white" id="searchForm" action="/MML/search">
                    <select name="type" id="searchType" class="searchType border border-dark bg-dark text-white rounded-start px-2">
                        <option value="all">All</option>
                        <option value="movies">Movies</option>
                        <option value="shows">Shows</option>
                        <option value="users">Users</option>
                    </select>
                    <input type="search" class="form-control bg-black border-2 border-dark border-start-0 text-white" placeholder="Search..." aria-label="Search" name="query" required />
                    <button class="btn btn-outline-dark text-white" type="submit" data-mdb-ripple-color="dark">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
                <div class="bg-white position-absolute top-100 bg-dark text-white w-100" id="searchResults">
                    <ul class="list-unstyled m-0 w-100"></ul>
                </div>
            </div>
            <% if (session.getAttribute("loggedUser") == null) { %>
            <a class="btn btn-outline-white d-lg-inline d-none ms-3" href="/MML/login">Login</a>
            <% } else {%>
            <ul class="navbar-nav ps-2 d-lg-inline d-none">
                <!-- Avatar -->
                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle d-flex align-items-center"
                        href="#"
                        id="user-dropdown"
                        role="button"
                        data-mdb-toggle="dropdown"
                        aria-expanded="false"
                        >

                        <%
                            User user = ((User) (request.getSession()).getAttribute("loggedUser"));
                            String profilePic = user.getProfilePic();
                            if (profilePic.isEmpty()) {
                        %>

                        <i id="default-profile-pic" class="fas fa-user-circle fa-lg" style="font-size: 35px"></i>
                        <div id="change-profile-pic" class="d-none" style="height: 0;border-radius: 100px; width: 2em; padding-top: 2em;">
                        </div>

                        <% } else {%>

                        <i id="default-profile-pic" class="d-none fas fa-user-circle fa-lg" style="font-size: 35px"></i>
                        <div id="change-profile-pic" style="height: 0;border-radius: 100px; width: 2em; padding-top: 2em; background: url('data:image/jpg;base64, <%=profilePic%>') center center; background-size: cover;">
                        </div>
                        <% }%>

                        <span class="navbar-username ps-1 text-white" id='username-change-navbar'> <%= ((User) (request.getSession()).getAttribute("loggedUser")).getUsername()%> </span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="user-dropdown">
                        <li><a class="dropdown-item" href="/MML/profile?id=<%=((User) (request.getSession()).getAttribute("loggedUser")).getUserId()%>">My profile</a></li>
                        <li><a class="dropdown-item" href="/MML/editProfile">Edit Profile</a></li>
                        <li>
                            <div class="dropdown-item dropstart">
                                <div

                                    class="ps-1 dropdown-toggle"
                                    data-mdb-toggle="dropdown"
                                    aria-expanded="false"
                                    >
                                    Request
                                </div>
                                <ul class="dropdown-menu me-0">
                                    <%
                                        ArrayList<User> pendingList = ((User) (request.getSession()).getAttribute("loggedUser")).getPendingList();
                                        for (int i = 0; i < pendingList.size(); i++) {
                                            User pendingUser = (User) pendingList.get(i);
                                    %>
                                    <li><span class="dropdown-item d-flex flex-row justify-content-between align-items-center" href="#"><a class="text-dark" href="/MML/profile?id=<%=pendingUser.getUserId()%>"><%=pendingUser.getUsername()%></a><div class="d-flex flex-row"><span id="user_<%=pendingUser.getUserId()%>" class="btn btn-outline-dark confirmFriend  ms-3 p-0"><i class="fas fa-check m-0 p-0 px-3 py-1 "></i></span><span id="removeUser_<%=pendingUser.getUserId()%>" class="btn btn-outline-dark rejectFriend  ms-3 p-0"><i class="fas fa-times m-0 p-0 px-3 py-1 "></i></span></div>
                                        </span></li>

                                    <%}%>

                                </ul>
                            </div>
                        </li>
                        <li><a class="dropdown-item" href="/MML/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
            <% }%>
        </div>
        <!-- Collapsible wrapper -->
    </div>
    <!-- Container wrapper -->
</nav>
<% if (session.getAttribute("loggedUser") != null) { %>
    <script>
        let addFriendButtonsNavbar = document.querySelectorAll(".confirmFriend");
        console.log("adding event listerner to add", addFriendButtonsNavbar);
        if (addFriendButtonsNavbar.length > 0) {
            addFriendButtonsNavbar.forEach((elm) => {
                elm.addEventListener('click', addFriendNavBar);
            })
        }
        function addFriendNavBar(e) {
            let currentTarget = e.currentTarget;
            console.log("hi", currentTarget.id);
            let friendNavId = currentTarget.id;
            friendNavId = friendNavId.split('_');
            friendNavId = friendNavId[1];
    //        console.log("id", friendNavId);
            fetch("/MML/AddFriendController", {
                method: "POST",
                body: JSON.stringify({
                    userId: <%=((User)(request.getSession()).getAttribute("loggedUser")).getUserId()%>,
                    visitorId: parseInt(friendNavId),

                })
            }).then(response => response.json())
                    .then(data => {
                        console.log(data);
                        currentTarget.parentNode.parentNode.remove();
                    })
        }
        let rejectFriendButtonsNavbar = document.querySelectorAll(".rejectFriend");
        console.log("adding event listerner to remove", rejectFriendButtonsNavbar);
        if (rejectFriendButtonsNavbar.length > 0) {
            rejectFriendButtonsNavbar.forEach((elm) => {
                elm.addEventListener('click', removeFriendNavBar);
            })
        }
        function removeFriendNavBar(e) {
            let currentTarget = e.currentTarget;
            console.log("hi", currentTarget.id);
            let friendNavId = currentTarget.id;
            friendNavId = friendNavId.split('_');
            friendNavId = friendNavId[1];
    //        console.log("id", friendNavId);
            fetch("/MML/rejectFriendController", {
                method: "POST",
                body: JSON.stringify({
                    userId: <%=((User)(request.getSession()).getAttribute("loggedUser")).getUserId()%>,
                    visitorId: parseInt(friendNavId),

                })
            }).then(response => response.json())
                    .then(data => {
                        console.log(data);
                        currentTarget.parentNode.parentNode.remove();
                    })
        }
        
    </script>
<% }%>
<script>
    function handleSearch() {
        let type = searchType.value
        let query = searchQuery.value
        let isMovie = type=="movies" ? true : false

        if(query == "") {
            resultListContainer.classList.remove('show')
            return
        }
        fetch(`/MML/search?type=${type}&query=${query}`, {
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
        .then(response => response.json())
        .then(data => {
            resultListContainer.scrollTop = 0;
            resultList.innerHTML = ""
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
                let hasImage = item.poster_path==null ? false : true
                resultList.innerHTML += `
                    <li>
                        <a href="/MML/${ isMovie ? 'movie' : 'show' }?id=${item.id}" class="text-white">
                            <div class="card bg-dark text-white" style="border-radius: 0;">
                                <div class="row g-0">
                                    <div class="col-md-2">
                                        <div class="bg-image lazy" style="height:0; padding-top:160%; width:100%; background-image:url('${ hasImage ? 'https://image.tmdb.org/t/p/w92/'+item.poster_path : 'images/default.png'}'); background-position:center center"></div>
                                    </div>
                                    <div class="col-md-10">
                                        <div class="card-body py-2">
                                            <h5 class="card-title m-0">${ isMovie ? item.title : item.name }</h5>
                                            <p class="card-text">
                                                <small class="text-muted">${ isMovie ? item.release_date : item.first_air_date }</small>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                `
            })
            resultListContainer.classList.add('show')
            let lazyloadImages;    

            if ("IntersectionObserver" in window) {
                lazyloadImages = document.querySelectorAll(".lazy");
                var imageObserver = new IntersectionObserver(function(entries, observer) {
                entries.forEach(function(entry) {
                    if (entry.isIntersecting) {
                    var image = entry.target;
                    image.src = image.dataset.src;
                    image.classList.remove("lazy");
                    imageObserver.unobserve(image);
                    }
                });
                });

                lazyloadImages.forEach(function(image) {
                imageObserver.observe(image);
                });
            } else {  
                var lazyloadThrottleTimeout;
                lazyloadImages = document.querySelectorAll(".lazy");
                
                function lazyload () {
                if(lazyloadThrottleTimeout) {
                    clearTimeout(lazyloadThrottleTimeout);
                }    

                lazyloadThrottleTimeout = setTimeout(function() {
                    var scrollTop = window.pageYOffset;
                    lazyloadImages.forEach(function(img) {
                        if(img.offsetTop < (window.innerHeight + scrollTop)) {
                        img.src = img.dataset.src;
                        img.classList.remove('lazy');
                        }
                    });
                    if(lazyloadImages.length == 0) { 
                    document.removeEventListener("scroll", lazyload);
                    window.removeEventListener("resize", lazyload);
                    window.removeEventListener("orientationChange", lazyload);
                    }
                }, 20);
                }

                document.addEventListener("scroll", lazyload);
                window.addEventListener("resize", lazyload);
                window.addEventListener("orientationChange", lazyload);
            }
        })
    }
    
    const searchContainer = document.getElementById('searchContainer')
    const searchForm = document.getElementById('searchForm')
    const searchType = document.getElementById('searchType')
    const searchQuery = document.querySelector('#searchForm input')
    const resultListContainer = document.querySelector('#searchResults')
    const resultList = document.querySelector('#searchResults ul')
    
    searchQuery.addEventListener('keyup', handleSearch)
    searchQuery.addEventListener('change', handleSearch)
    searchQuery.addEventListener('click', ()=> {
        setTimeout(()=>{
            if(searchQuery.value=="") {
                resultListContainer.classList.remove('show')
            }
        }, 10)
    })
    resultListContainer.addEventListener('transitionend', () => {
        if(resultListContainer.classList.contains('show')) return
        resultList.innerHTML = ""
    })

</script>
