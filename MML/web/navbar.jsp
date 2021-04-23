
<%@page import="beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark elegant-color">
    <!-- Container wrapper -->
    <div class="container-lg">
        <!-- Navbar brand -->
        <a class="navbar-brand" href="/MML/home"><img src="images/logo3.jpg" alt="MML" class="logo"></a>

        <a class="btn btn-outline-white d-inline d-lg-none me-3 ms-auto" href="#">Login</a>
        <!-- Toggle button -->
        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>

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
                        <li><a class="dropdown-item" href="/MML/movies?q=tr">Top Rated</a></li>
                        <li><a class="dropdown-item" href="/MML/movies">Most Popular</a></li>
                        <li><a class="dropdown-item" href="/MML/movies">In Theaters</a></li>
                        <li><a class="dropdown-item" href="/MML/movies">Coming Soon</a></li>
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
                        <li><a class="dropdown-item" href="/MML/shows">Top Rated</a></li>
                        <li><a class="dropdown-item" href="/MML/shows">Most Popular</a></li>
                        <li><a class="dropdown-item" href="/MML/shows">Airing today</a></li>
                        <li><a class="dropdown-item" href="/MML/shows">On TV</a></li>
                    </ul>
                </li>
            </ul>
            <!-- Left links -->

            <!-- Search form -->
            <form class="d-flex input-group w-auto form-white">
                <select name="type" id="searchType" class="searchType border border-dark bg-dark text-white rounded-start px-2">
                    <option value="all">All</option>
                    <option value="movies">Movies</option>
                    <option value="tv">TV</option>
                </select>
                <input type="search" class="form-control bg-black border-2 border-dark border-start-0" placeholder="Search..." aria-label="Search" />
                <button class="btn btn-outline-dark text-white" type="button" data-mdb-ripple-color="dark">
                    <i class="fas fa-search"></i>
                </button>
            </form>
            <% if (session.getAttribute("loggedUser") == null) { %>
            <a class="btn btn-outline-white d-lg-inline d-none ms-3" href="/MML/login">Login</a>
            <% } else {%>
            <ul class="navbar-nav ps-2">
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
                            User user = ((User)(request.getSession()).getAttribute("loggedUser"));
                            String profilePic = user.getProfilePic();
                            if(profilePic.isEmpty()){
                        %>
                        
                        <i id="default-profile-pic" class="fas fa-user-circle fa-lg" style="font-size: 35px"></i>
                        <div id="change-profile-pic" class="d-none" style="height: 0;border-radius: 100px; width: 2em; padding-top: 2em;">
                        </div>
                        
                        <% } else { %>
                        
                        <i id="default-profile-pic" class="d-none fas fa-user-circle fa-lg" style="font-size: 35px"></i>
                        <div id="change-profile-pic" style="height: 0;border-radius: 100px; width: 2em; padding-top: 2em;">
                        </div>
                        <% } %>
                        
                        <span class="navbar-username ps-1 text-white" id='username-change-navbar'> <%= ((User)(request.getSession()).getAttribute("loggedUser")).getUsername() %> </span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="user-dropdown">
                        <li><a class="dropdown-item" href="/MML/profile?id=<%=((User)(request.getSession()).getAttribute("loggedUser")).getUserId()%>">My profile</a></li>
                        <li><a class="dropdown-item" href="/MML/editProfile">Edit Profile</a></li>
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
<!-- Navbar -->