<%-- 
    Document   : manageUsers
    Created on : Apr 24, 2021, 10:24:37 PM
    Author     : Ishjot Singh
--%>

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
    <div class="alert alert-success mb-0 mt-5 alert-fixed end-0 mt-3 me-3 pe-5 fade" style="z-index:1000; width: 400px; top: 2em;" id="successReview" role="alert" data-mdb-color="secondary">
        <i class="fas fa-check me-2"></i>
        Reviews updated successfully!
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
                                >Movie Reviews</a
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
                                >TV Show reviews</a
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

                                    <div class="col-12 mb-0 ps-0 pt-3 ">
                                        <h3 class="h3-responsive mb-4">Movie Reviews</h3>
                                    </div>
                                    
                                    <table class="table-responsive mt-3 mb-5 table table-hover">
                                        <thead class="table-dark border">
                                            <tr>
                                                <th scope="col" class="text-center">User ID</th>
                                                <th scope="col" class="text-center">Movie ID</th>
                                                <th scope="col" class="text-center">Heading</th>
                                                <th scope="col" class="text-center">Details</th>
                                                <th scope="col" class="text-center">Remove</th>
                                            </tr>
                                        
                                        </thead>
                                        <tbody id="movieReviews" class="border">

                                        </tbody>
                                    </table>

                                </div>
                            </div>


                            <div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel" aria-labelledby="ex1-tab-2">
                                <div class="row text-dark border round px-3 bg-white ">
                                    <div class="col-12 mb-0 ps-0 pt-3 ">
                                        <h3 class="h3-responsive mb-4">TV Show Reviews</h3>
                                    </div>

                                   
                                    
                                    <table class="table-responsive mt-3 mb-5 table table-hover">
                                        <thead class="table-dark border">
                                            <tr>
                                                <th scope="col" class="text-center">User ID</th>
                                                <th scope="col" class="text-center">Show ID</th>
                                                <th scope="col" class="text-center">Heading</th>
                                                <th scope="col" class="text-center">Details</th>
                                                <th scope="col" class="text-center">Remove</th>
                                            </tr>
                                        
                                        </thead>
                                        <tbody id="showReviews" class="border ">

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
        
        const movieTable = document.getElementById('movieReviews')
        const showTable = document.getElementById('showReviews')
        let allShowReviews = []
        let allMovieReviews = []
        let delBtns = document.querySelectorAll('.removeReview')
         async function getMovieReviews(e){
             await fetch('/MML/getReviews?type=movie')
                    .then(response => response.json())
                    .then(data => allMovieReviews = data)
            
            await fetch('/MML/getReviews?type=shows')
                    .then(response => response.json())
                    .then(data => allShowReviews = data)
            
            const htmlMovies = allMovieReviews.map(review => {
                return `
                    <tr>
                        <th scope="row" class="text-center">${review.user_id}</th>
                        <td class="text-center">${review.content_id}</td>
                        <td class="text-center">${review.review_heading}</td>
                        <td class="text-center">
                            <button 
                                class="btn btn-primary py-1 px-2 showDets" 
                                id = "${review.id}" 
                                data-mdb-toggle="modal"
                                data-mdb-target="#modal-${review.id}"> 
                            Details</button>
                            <div
                                class="modal fade"
                                id="modal-${review.id}"
                                tabindex="-1"
                                aria-labelledby="label-${review.id}"
                                aria-hidden="true"
                              >
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="${review.id}-label">Posted by: ${review.username}</h5>

                                    </div>
                                    <div class="modal-body">
                                      <form id = "changes-${review.id}">
                                        <!-- 2 column grid layout with text inputs for the first and last names -->
                                        
                                          
                                            <div class="form-outline mb-4">
                                              <input disabled value="${review.review_heading}" type="text" id="heading-${review.id}" name="reviewHeading" class="form-control" />
                                              <label for="heading-${review.id}" class="form-label"> Review Heading </label>  
                                            </div>
                                            
                                            <div class="form-outline mb-4">
                                              <textarea disabled rows="2" type="text" id="content-${review.id}" name="reviewContent" class="form-control">${review.review_content}</textarea>
                                              <label for="content-${review.id}" class="form-label"> Review Content </label>  
                                            </div>
                                            
                                            <div class="d-flex flex-row justify-content-between px-4 fs-6 mb-4">
                                                <div class="">
                                                    <strong>Upvotes: ${review.review_up}</strong>
                                                </div>
                                                <div class="">
                                                    <strong>Rating: ${review.review_rating}</strong>
                                                </div>
                                            </div>
            
                                            <div class="d-flex flex-row justify-content-between px-4 fs-6 mb-2">
                                                <div class="">
                                                    <strong>Downvotes: ${review.review_down}</strong>
                                                </div>
                                                <div>
                                                    <strong>Posted on:<i> ${review.review_date} </i></strong>
                                                </div>
                                            </div>
                                            
            
                                        
                                        
                                      </form>  
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">
                                        Close
                                      </button>
                                    </div>
                                  </div>
                                </div>
                            </div>
                        </td>
                        <td class="text-center">
                            <button 
                                class="btn btn-danger py-1 px-2" 
                                id = "user-${review.id}" 
                                data-mdb-toggle="modal"
                                data-mdb-target="#modal-${review.id}-remove"> 
                            - Remove</button>

                            <div class="modal fade" id="modal-${review.id}-remove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <h5 class="modal-header">
                                            Confirm delete
                                        </h5>
                                        <div class="modal-body fs-6 fw-bold">
                                            <strong> Are you sure you want to delete this review? </strong>
                                        </div>
                                        <div class="modal-footer">
                                            <a class="btn btn-danger btn-ok removeReview" data-mdb-dismiss="modal">Delete</a>
                                            <button type="button" class="btn btn-default" data-mdb-dismiss="modal">Cancel</button>

                                        </div>
                                    </div>
                                </div>
                            </div>        
                        </td>
                    </tr>

                `
            })
            
            const htmlShows = allShowReviews.map(review => {
                return `
                    <tr>
                        <th scope="row" class="text-center">${review.user_id}</th>
                        <td class="text-center">${review.content_id}</td>
                        <td class="text-center">${review.review_heading}</td>
                        <td class="text-center">
                            <button 
                                class="btn btn-primary py-1 px-2 showDets" 
                                id = "show-${review.id}" 
                                data-mdb-toggle="modal"
                                data-mdb-target="#modal-${review.id}-show"> 
                            Details</button>
                            <div
                                class="modal fade"
                                id="modal-${review.id}-show"
                                tabindex="-1"
                                aria-labelledby="label-${review.id}"
                                aria-hidden="true"
                              >
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="show-${review.id}-label">Posted by: ${review.username}</h5>

                                    </div>
                                    <div class="modal-body">
                                      <form id = "changes-${review.id}-show">
                                        <!-- 2 column grid layout with text inputs for the first and last names -->
                                        
                                          
                                            <div class="form-outline mb-4">
                                              <input disabled value="${review.review_heading}" type="text" id="heading-${review.id}-show" name="reviewHeading" class="form-control" />
                                              <label for="heading-${review.id}-show" class="form-label"> Review Heading </label>  
                                            </div>
                                            
                                            <div class="form-outline mb-4">
                                              <textarea disabled rows="2" type="text" id="content-${review.id}-show" name="reviewContent" class="form-control">${review.review_content}</textarea>
                                              <label for="content-${review.id}-show" class="form-label"> Review Content </label>  
                                            </div>
                                            
                                            <div class="d-flex flex-row justify-content-between px-4 fs-6 mb-4">
                                                <div class="">
                                                    <strong>Upvotes: ${review.review_up}</strong>
                                                </div>
                                                <div class="">
                                                    <strong>Rating: ${review.review_rating}</strong>
                                                </div>
                                            </div>
            
                                            <div class="d-flex flex-row justify-content-between px-4 fs-6 mb-2">
                                                <div class="">
                                                    <strong>Downvotes: ${review.review_down}</strong>
                                                </div>
                                                <div>
                                                    <strong>Posted on:<i> ${review.review_date} </i></strong>
                                                </div>
                                            </div>
                                            
                                      </form>  
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" form="changes-${review.id}-show" class="btn btn-primary saveChanges">Save changes</button>
                                      <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">
                                        Close
                                      </button>
                                    </div>
                                  </div>
                                </div>
                            </div>
                        </td>
                        <td class="text-center">
                            <button 
                                class="btn btn-danger py-1 px-2" 
                                id = "user-${review.id}" 
                                data-mdb-toggle="modal"
                                data-mdb-target="#modal-${review.id}-remove"> 
                            - Remove</button>

                            <div class="modal fade" id="modal-${review.id}-remove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <h5 class="modal-header">
                                            Confirm delete
                                        </h5>
                                        <div class="modal-body">
                                            <i><strong> Are you sure you want to delete this review? </strong></i>
                                        </div>
                                        <div class="modal-footer">
                                            <a class="btn btn-danger btn-ok removeReview" data-mdb-dismiss="modal">Delete</a>
                                            <button type="button" class="btn btn-default" data-mdb-dismiss="modal">Cancel</button>

                                        </div>
                                    </div>
                                </div>
                            </div>        
                        </td>
                    </tr>

                `
            })
            
            showTable.innerHTML = htmlShows.join(" ")
            movieTable.innerHTML = htmlMovies.join(" ")
            
            // Initialize form-outline for dynamically added inputs
            document.querySelectorAll('.form-outline').forEach((formOutline) => {
                new mdb.Input(formOutline).init();
            });
            
            delBtns = document.querySelectorAll('.removeReview')
            delBtns.forEach(button => {
                button.addEventListener('click', deleteReview)
            })
        }
        
        function deleteReview(e){
            index = [].indexOf.call(delBtns, e.target)
            let check = e.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.children[0].children[0]
            if(check.innerText == 'Movie Reviews'){
                $.ajax({
                    method: 'POST',
                    url: `/MML/deleteReview?review_id=${allMovieReviews[index].id}`,
                    data: {},
                    success: function(data){
                        const alert = document.getElementById("successReview");
                        alert.classList.add('show');
                        alert.classList.remove('d-none')
                        setTimeout(() => {
                            alert.classList.remove('show');
                            alert.classList.add('d-none')
                        }, 2000)
                        e.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.remove()
                    }
                })
            }
            
            else{
                $.ajax({
                    method: 'POST',
                    url: `/MML/deleteReview?review_id=${allShowReviews[index].id}`,
                    data: {},
                    success: function(data){
                        const alert = document.getElementById("successReview");
                        alert.classList.add('show');
                        alert.classList.remove('d-none')
                        setTimeout(() => {
                            alert.classList.remove('show');
                            alert.classList.add('d-none')
                        }, 2000)
                        e.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.remove()
                    }
                })
            }
            
        }
        
        window.addEventListener('load', getMovieReviews)

    </script>
</body>

</html>
