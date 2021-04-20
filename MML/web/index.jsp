

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
        <link rel="stylesheet" href="css/rating.css">
        <link rel="stylesheet" href="css/custom-carousel.css">

        <title>Document</title>
    </head>

    <body>
        <div class="container-fluid bg-black p-0 min-vh-100 d-flex flex-column justify-content-between">
            <div>
                <jsp:include page="navbar.jsp" />

                <!-- Carousel wrapper -->
                <div id="carouselBasicExample" class="carousel slide carousel-fade" data-mdb-ride="carousel">
                    <!-- Inner -->
                    <div class="carousel-inner">
                        <!-- Single item -->
                        <div class="carousel-item active">
                            <div class="backdrop">
                                <img src="images/jl-back.jpg" class="w-100 mt-n5" alt="..." />
                            </div>
                            <div class="row">
                                <div class="col-xl-2 col-md-3 offset-1 position-absolute bottom-0 d-none d-md-block me-0 pe-0">
                                    <img src="images/jl.jpg" class="w-100 ps-3">
                                </div>
                                <div class="mt-n10 pt-5 col-12 px-4 px-md-0 back-grad">
                                    <div class="row">
                                        <div class="col-xl-7 offset-xl-3 col-md-7 offset-md-4 col-12 text-center-custom px-4 px-md-3">
                                            <h2 class="h2 text-white fw-bold mx-auto mx-md-0 d-inline-block">Zack Snyder's Justice League</h2>
                                            <p class="pt-3 mb-5 text-crop-3 text-muted">Determined to ensure Superman's
                                                ultimate sacrifice was not in
                                                vain, Bruce Wayne aligns forces with Diana Prince with plans to recruit a team of metahumans to
                                                protect the
                                                world from an approaching threat of catastrophic proportions.
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Expedita facilis reprehenderit
                                                excepturi
                                                deleniti consequatur magni assumenda, nihil quos dolore unde.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Single item -->
                        <div class="carousel-item">
                            <div class="backdrop">
                                <img src="images/in-back.jpg" class="w-100 mt-n5" alt="..." />
                            </div>
                            <div class="row">
                                <div class="col-xl-2 col-md-3 offset-1 position-absolute bottom-0 d-none d-md-block me-0 pe-0">
                                    <img src="images/in.jpg" class="w-100 ps-3">
                                </div>
                                <div class="mt-n10 pt-5 col-12 px-4 px-md-0 back-grad">
                                    <div class="row">
                                        <div class="col-xl-7 offset-xl-3 col-md-7 offset-md-4 col-12 text-center-custom px-4 px-md-3">
                                            <h2 class="h2 text-white fw-bold mx-auto mx-md-0 d-inline-block">Inception</h2>
                                            <p class="pt-3 mb-5 text-crop-3 text-muted">Cobb, a skilled thief who commits corporate espionage
                                                by
                                                infiltrating
                                                the subconscious of his targets is offered a chance to regain his old life as payment for a task
                                                considered to be
                                                impossible: "inception", the implantation of another person's idea into a target's subconscious.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Single item -->
                        <div class="carousel-item">
                            <div class="backdrop">
                                <img src="images/gvk-back.jpg" class="w-100 mt-n5" alt="..." />
                            </div>
                            <div class="row">
                                <div class="col-xl-2 col-md-3 offset-1 position-absolute bottom-0 d-none d-md-block me-0 pe-0">
                                    <img src="images/gvk.jpg" class="w-100 ps-3">
                                </div>
                                <div class="mt-n10 pt-5 col-12 px-4 px-md-0 back-grad">
                                    <div class="row">
                                        <div class="col-xl-7 offset-xl-3 col-md-7 offset-md-4 col-12 text-center-custom px-4 px-md-3">
                                            <h2 class="h2 text-white fw-bold mx-auto mx-md-0 d-inline-block">Godzilla vs. Kong</h2>
                                            <p class="pt-3 mb-5 text-crop-3 text-muted">In a time when monsters walk the Earth, humanity’s
                                                fight
                                                for its
                                                future sets Godzilla and Kong on a collision course that will see the two most powerful forces
                                                of
                                                nature on
                                                the planet collide in a spectacular battle for the ages.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Inner -->

                    <!-- Indicators -->
                    <div class="row">
                        <div class="carousel-indicators m-0">
                            <button type="button" data-mdb-target="#carouselBasicExample" data-mdb-slide-to="0" class="active"
                                    aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-mdb-target="#carouselBasicExample" data-mdb-slide-to="1"
                                    aria-label="Slide 2"></button>
                            <button type="button" data-mdb-target="#carouselBasicExample" data-mdb-slide-to="2"
                                    aria-label="Slide 3"></button>
                        </div>
                    </div>
                    <!-- Controls -->
                    <button class="carousel-control-prev" type="button" data-mdb-target="#carouselBasicExample"
                            data-mdb-slide="prev">
                        <span class="carousel-control-prev-icon mt-n10" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-mdb-target="#carouselBasicExample"
                            data-mdb-slide="next">
                        <span class="carousel-control-next-icon mt-n10" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <!-- Carousel wrapper -->

                <div class="container-lg my-5">
                    <h2 class="mt-5 text-yellow fw-bold ps-2">Trending</h2>

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
                                JSONArray trendingArray = (JSONArray) request.getAttribute("trending");
                                for (int i = 0; i < trendingArray.size(); i++) {
                                    JSONObject trendingItem = (JSONObject) trendingArray.get(i);
                            %>
                                    <div class="col-xl-2 col-lg-3 col-md-4 col-6 content">
                                        <div class="card h-100 bg-dark text-white position-relative">
                                            <div class="row g-0">
                                                <a href="/MML/content" class="text-white" target="_blank">
                                                    <div class="img-container col-4 col-sm-12 hover-zoom bg-image">
                                                        <img src="https://image.tmdb.org/t/p/w185/<%=trendingItem.get("poster_path")%>" class="card-img-top" />
                                                    </div>
                                                </a>
                                                <div class="card-body bg-dark col-8 col-sm-12 ">
                                                    <a href="/MML/content" class="text-white" target="_blank">
                                                        <h5 class="card-title"><%=trendingItem.get("title")%></h5>
                                                        <p class="card-text line-clamp d-sm-none my-1">
                                                            <%=trendingItem.get("overview")%>
                                                        </p>
                                                        <p class="card-text m-0 text-muted">
                                                            <%=trendingItem.get("release_date")%>
                                                        </p>
                                                    </a>
                                                    <div class="d-sm-flex d-none">
                                                        <div  class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity" style="z-index: 4;">
        
                                                            <div class="dropdown mx-auto d-none d-sm-flex" >
                                                                <i id="rating" class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                                    data-mdb-toggle="dropdown"
                                                                    aria-expanded="false" style="z-index: 3;">
                                                                
                                                                </i>
                                                                <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark border border-yellow"
                                                                    aria-labelledby="rating-btn" >
                                                                    <li>
                                                                        <a class="dropdown-item p-0 bg-dark" href="#">
                                                                            <input name="input-1"
                                                                                class="rating rating-loading" data-min="0"
                                                                                data-max="5" data-step="0.5" style="height: 0;">
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
        
                                                        <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                            <div class="dropdown mx-auto d-none d-sm-flex">
                                                                <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon" data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                                <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark border border-yellow"
                                                                    aria-labelledby="watchlist-btn">
                                                                    <li><span class="dropdown-item watching" href="#" id="">Watching</span></li>
                                                                    <li><span class="dropdown-item completed" href="#" id="">Completed</span></li>
                                                                    <li><span class="dropdown-item onhold" href="#" id="">On hold</span></li>
                                                                    <li><span class="dropdown-item dropped" href="#" id="">Dropped</span></li>
                                                                    <li><span class="dropdown-item planned" href="#" id="">Plan to watch</span></li>
                                                                </ul>
                                                            </div>
        
                                                        </div>
                                                    </div>
        
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            <%
                                }
                            %>

                        </div>
                    </div>

                    
                    <h2 class="mt-5 text-yellow fw-bold ps-2">Popular</h2>

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
                            <a href="/MML/content" class="text-white" target="_blank">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-6">
                                    <div class="card bg-dark text-white">
                                        <img src="images/gvk.jpg" class="card-img-top" alt="..." />
                                        <div class="card-img-overlay h-100 d-flex flex-column justify-content-around align-items-center" style="pointer-events: none;">
                                            <div>
                                                <h4 class="card-title text-center">1</h4>
                                                <i class="fas fa-star text-yellow mx-1"></i> 6.9
                                            </div>
                                            <a href="#!" class="btn btn-primary" style="pointer-events: all;">+ WATCHLIST</a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <h2 class="mt-5 text-yellow fw-bold ps-2">Latest</h2>

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
                            <a href="/MML/content" class="text-white" target="_blank">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-6">
                                    <div class="card bg-dark text-white">
                                        <img src="images/gvk.jpg" class="card-img-top" alt="..." />
                                        <div class="card-img-overlay h-100 d-flex flex-column justify-content-around align-items-center" style="pointer-events: none;">
                                            <div>
                                                <h4 class="card-title text-center">1</h4>
                                                <i class="fas fa-star text-yellow mx-1"></i> 6.9
                                            </div>
                                            <a href="#!" class="btn btn-primary" style="pointer-events: all;">+ WATCHLIST</a>
                                        </div>
                                    </div>
                                </div>
                            </a>
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
        <script src="scripts/rating.js"></script>
        <script>
            const change = document.querySelectorAll('.watchlist-icon')
            const watching = document.querySelectorAll('.watching')
            const completed = document.querySelectorAll('.completed')
            const onhold = document.querySelectorAll('.onhold')
            const dropped = document.querySelectorAll('.dropped')
            const planned = document.querySelectorAll('.planned')

            var icons = ['fa-eye', 'fa-check', 'fa-pause', 'fa-plus', 'fa-trash', 'fa-tasks']

            function toWatching(e){
                var iconChange = e.target.parentNode.parentNode.parentNode.children[0] 
                if(iconChange.classList.contains('fa-eye')){
                    iconChange.classList.remove('fa-eye')
                    iconChange.classList.add('fa-plus')
                }

                else{
                    for(let i = 0; i<icons.length; i++){
                        iconChange.classList.remove(icons[i])
                    }
                    iconChange.classList.add('fa-eye')
                }
            }
            watching.forEach(watch =>{
                watch.addEventListener('click', toWatching)
            })

            // ------------------------------------------------------------

            function toCompleted(e){
                var iconChange = e.target.parentNode.parentNode.parentNode.children[0] 
                if(iconChange.classList.contains('fa-check')){
                    iconChange.classList.remove('fa-check')
                    iconChange.classList.add('fa-plus')
                }

                else{
                    for(let i = 0; i<icons.length; i++){
                        iconChange.classList.remove(icons[i])
                    }
                    iconChange.classList.add('fa-check')
                }
            }
            completed.forEach(complete =>{
                complete.addEventListener('click', toCompleted)
            })

            // ------------------------------------------------------------

            function toHold(e){
                var iconChange = e.target.parentNode.parentNode.parentNode.children[0] 
                if(iconChange.classList.contains('fa-pause')){
                    iconChange.classList.remove('fa-pause')
                    iconChange.classList.add('fa-plus')
                }

                else{
                    for(let i = 0; i<icons.length; i++){
                        iconChange.classList.remove(icons[i])
                    }
                    iconChange.classList.add('fa-pause')
                }
            }
            onhold.forEach(hold =>{
                hold.addEventListener('click', toHold)
            })

            // ------------------------------------------------------------

            function toDropped(e){
                var iconChange = e.target.parentNode.parentNode.parentNode.children[0]
                if(iconChange.classList.contains('fa-trash')){
                    iconChange.classList.remove('fa-trash')
                    iconChange.classList.add('fa-plus')
                }

                else{
                    for(let i = 0; i<icons.length; i++){
                        iconChange.classList.remove(icons[i])
                    }
                    iconChange.classList.add('fa-trash')
                }
            }
            dropped.forEach(drop =>{
                drop.addEventListener('click', toDropped)
            })

            // ------------------------------------------------------------

            function toPlanned(e){
                var iconChange = e.target.parentNode.parentNode.parentNode.children[0]
                if(iconChange.classList.contains('fa-tasks')){
                    iconChange.classList.remove('fa-tasks')
                    iconChange.classList.add('fa-plus')
                }

                else{
                    for(let i = 0; i<icons.length; i++){
                        iconChange.classList.remove(icons[i])
                    }
                    iconChange.classList.add('fa-tasks')
                }
            }
            planned.forEach(plan =>{
                plan.addEventListener('click', toPlanned)
            })
        </script>

    </body>

</html>
