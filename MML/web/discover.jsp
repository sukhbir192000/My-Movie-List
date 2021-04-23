
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
    <link rel="stylesheet" href="css/custom-carousel.css">
    <style>
        .content {
            display: none;
        }
    </style>

    <link rel="stylesheet" href="css/template.css">
    <link rel="stylesheet" href="css/rating.css">
    <title>Document</title>
</head>

<body>
    <div class="container-fluid bg-black p-0 min-vh-100 d-flex flex-column justify-content-between">
        <div>
            <jsp:include page="navbar.jsp" />

            <div class="container-lg">
                <div class="row  mt-4">
                    <div class="col-12 col-sm-4 col-md-3">
                        <h3 class="text-white">
                            Popular movies
                        </h3>

                        <div class="pe-sm-4">
                            <!-- ACCORDIAN -->
                            <div class="accordion border rounded mt-3" id="accordionExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne">
                                        <button
                                            class="accordion-button bg-yellow collapsed border-bottom text-black fs-6 fw-bold"
                                            type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseOne"
                                            aria-expanded="false" aria-controls="collapseOne">
                                            Sort
                                        </button>
                                    </h2>
                                    <div id="collapseOne" class="accordion-collapse collapse"
                                        aria-labelledby="headingOne" data-mdb-parent="#accordionExample">
                                        <div class="accordion-body">

                                            <span class="text-white">Sort Results By</span>

                                            <select
                                                class="form-select mt-3 form-outline-black btn btn-light text-black "
                                                aria-label="Default select example">
                                                <option selected disabled value="select">Select order</option>
                                                <option value="popularity descending">Popularity Descending</option>
                                                <option value="popularity ascending">Popularity Ascending</option>
                                                <option value="rating descending">Rating Descending</option>
                                                <option value="rating ascending">Rating Ascending </option>
                                                <option value="release date descending">Release Date Descending
                                                </option>
                                                <option value="release date ascending">Release Date Ascending </option>
                                                <option value="title (a-z)">Title (A-Z) </option>
                                                <option value="title (z-a)">Title (Z-A)</option>
                                            </select>



                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- ACCORDIAN -->
                            <div class="accordion border rounded my-3" id="accordionExample1">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne">
                                        <button
                                            class="accordion-button bg-yellow collapsed border-bottom text-black fs-6 fw-bold"
                                            type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseOne1"
                                            aria-expanded="false" aria-controls="collapseOne1">
                                            Filter
                                        </button>
                                    </h2>
                                    <div id="collapseOne1" class="accordion-collapse collapse"
                                        aria-labelledby="headingOne" data-mdb-parent="#accordionExample1">
                                        <div class="accordion-body">
                                            <form action="" class="text-white">
                                                <!-- Default radio -->
                                                <div class="fs-5 fw-bold"> View </div>

                                                <div class="form-check mt-2 ms-2">
                                                    <input class="form-check-input" type="radio" name="view"
                                                        id="everything" checked />
                                                    <label class="form-check-label" for="view"> Everything
                                                    </label>
                                                </div>

                                                <!-- Default checked radio -->
                                                <div class="form-check mt-2 ms-2">
                                                    <input class="form-check-input" type="radio" name="view"
                                                        id="seen" />
                                                    <label class="form-check-label" for="view"> I have seen </label>
                                                </div>

                                                <div class="form-check  mt-2 ms-2">
                                                    <input class="form-check-input " type="radio" name="view"
                                                        id="unseen" />
                                                    <label class="form-check-label" for="view"> I haven't seen </label>
                                                </div>

                                                <hr class="text-white">

                                                <div class="fs-5 fw-bold">Release Dates </div>
                                                <div class="">
                                                    <label for="from-date"
                                                        class="col-form-label text-white">From</label>
                                                    <div class="col-10">
                                                        <input class="form-control" type="date" value="" id="from-date">
                                                    </div>
                                                </div>

                                                <div class="">
                                                    <label for="to-date" class="col-form-label text-white">To</label>
                                                    <div class="col-10">
                                                        <input class="form-control" type="date" value="" id="to-date">
                                                    </div>
                                                </div>

                                                <hr class="text-white">

                                                <div class=" fw-bold mb-2 fs-5">Genres</div>

                                                <input type="checkbox" class="btn-check" id="btn-check"
                                                    autocomplete="off" />
                                                <label class="btn btn-outline-yellow btn-rounded px-2 m-1"
                                                    for="btn-check">Sci-Fi</label>

                                                <input type="checkbox" class="btn-check" id="btn-check1"
                                                    autocomplete="off" />
                                                <label class="btn btn-outline-yellow btn-rounded px-2 m-1"
                                                    for="btn-check1">Romance</label>

                                                <input type="checkbox" class="btn-check" id="btn-check2"
                                                    autocomplete="off" />
                                                <label class="btn btn-outline-yellow btn-rounded px-2 m-1"
                                                    for="btn-check2">Comedy</label>

                                                <input type="checkbox" class="btn-check" id="btn-check3"
                                                    autocomplete="off" />
                                                <label class="btn btn-outline-yellow btn-rounded px-2 m-1"
                                                    for="btn-check3">Thriller</label>

                                                <hr class="text-white">

                                                <!-- SEARCH -->
                                                <button type="submit"
                                                    class="btn btn-outline-yellow btn-block">Search</button>

                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-8 col-md-9 mt-5">
                        <div class="row g-4 mb-4">
                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5 col-12 content">
                                <div class="card h-100 bg-dark text-white position-relative">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            <img src="images/gvk.jpg" class="card-img-top" alt="gvk" />
                                        </div>

                                        <div class="card-body bg-dark col-8 col-sm-12 ">
                                            <h5 class="card-title">Godzilla vs. Kong</h5>
                                            <p class="card-text line-clamp d-sm-none my-1">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima vero quo
                                                possimus hic fuga molestiae voluptatem corporis inventore doloremque in.
                                            </p>
                                            <p class="card-text m-0">
                                                11.2.2021
                                            </p>
                                            <div class="d-sm-flex d-none">
                                                <div class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 end-0 m-1 to-watchlist-opacity"
                                                    style="z-index: 4;">
                                                    <!-- <i class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover "></i> -->

                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i id="rating"
                                                            class="fas fa-star fs-3 fs-sm-6 p-2 fw-bold give-rating-hover"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"
                                                            style="z-index: 3;">

                                                        </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="rating-btn">
                                                            <li><a class="dropdown-item p-0 bg-dark" href="#">
                                                                    <input name="input-1" class="rating rating-loading"
                                                                        data-min="0" data-max="5" data-step="0.5"
                                                                        style="height: 0;">
                                                                </a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div
                                                    class="rounded-circle bg-dark cursor-pointer position-sm-absolute top-0 start-0 m-1 to-watchlist-opacity">
                                                    <div class="dropdown mx-auto d-none d-sm-flex">
                                                        <i class="fas fa-plus fs-3 fs-sm-6 p-2 fw-bold watchlist-icon"
                                                            data-mdb-toggle="dropdown" aria-expanded="false"> </i>
                                                        <ul class="dropdown-menu dropdown-menu-dark fs-5 w-100 text-center bg-dark"
                                                            aria-labelledby="watchlist-btn">
                                                            <li><a class="dropdown-item watching" href="#"
                                                                    id="">Watching</a></li>
                                                            <li><a class="dropdown-item completed" href="#"
                                                                    id="">Completed</a></li>
                                                            <li><a class="dropdown-item onhold" href="#" id="">On
                                                                    hold</a></li>
                                                            <li><a class="dropdown-item dropped" href="#"
                                                                    id="">Dropped</a></li>
                                                            <li><a class="dropdown-item planned" href="#" id="">Plan to
                                                                    watch</a></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- END -->





                        </div>
                        <button type="button" class="btn btn-outline-yellow btn-block fs-5 mb-4 d-none"
                            id="loadMore">Load More</button>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
    </div>
    </div>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
    <script src="./scripts/rating.js"></script>

    <script>
        $(document).ready(function () {
            if ($('.content').length < 20) {
                $('#loadMore').addClass('d-none');
            }
            else {
                $('#loadMore').removeClass('d-none')
            }
            $(".content").slice(0, 20).show();
            $("#loadMore").on("click", function (e) {
                e.preventDefault();
                $(".content:hidden").slice(0, 20).slideDown();
                if ($(".content:hidden").length == 0) {
                    $("#loadMore").hide();
                }
            });
        })

        const change = document.querySelectorAll('.watchlist-icon')
        const watching = document.querySelectorAll('.watching')
        const completed = document.querySelectorAll('.completed')
        const onhold = document.querySelectorAll('.onhold')
        const dropped = document.querySelectorAll('.dropped')
        const planned = document.querySelectorAll('.planned')

        var icons = ['fa-eye', 'fa-check', 'fa-pause', 'fa-plus', 'fa-trash', 'fa-tasks']

        function toWatching(e) {
            var iconChange = e.target.parentNode.parentNode.parentNode.children[0]
            if (iconChange.classList.contains('fa-eye')) {
                iconChange.classList.remove('fa-eye')
                iconChange.classList.add('fa-plus')
            }

            else {
                for (let i = 0; i < icons.length; i++) {
                    iconChange.classList.remove(icons[i])
                }
                iconChange.classList.add('fa-eye')
            }
        }
        watching.forEach(watch => {
            watch.addEventListener('click', toWatching)
        })

        // ------------------------------------------------------------

        function toCompleted(e) {
            var iconChange = e.target.parentNode.parentNode.parentNode.children[0]
            if (iconChange.classList.contains('fa-check')) {
                iconChange.classList.remove('fa-check')
                iconChange.classList.add('fa-plus')
            }

            else {
                for (let i = 0; i < icons.length; i++) {
                    iconChange.classList.remove(icons[i])
                }
                iconChange.classList.add('fa-check')
            }
        }
        completed.forEach(complete => {
            complete.addEventListener('click', toCompleted)
        })

        // ------------------------------------------------------------

        function toHold(e) {
            var iconChange = e.target.parentNode.parentNode.parentNode.children[0]
            if (iconChange.classList.contains('fa-pause')) {
                iconChange.classList.remove('fa-pause')
                iconChange.classList.add('fa-plus')
            }

            else {
                for (let i = 0; i < icons.length; i++) {
                    iconChange.classList.remove(icons[i])
                }
                iconChange.classList.add('fa-pause')
            }
        }
        onhold.forEach(hold => {
            hold.addEventListener('click', toHold)
        })

        // ------------------------------------------------------------

        function toDropped(e) {
            var iconChange = e.target.parentNode.parentNode.parentNode.children[0]
            if (iconChange.classList.contains('fa-trash')) {
                iconChange.classList.remove('fa-trash')
                iconChange.classList.add('fa-plus')
            }

            else {
                for (let i = 0; i < icons.length; i++) {
                    iconChange.classList.remove(icons[i])
                }
                iconChange.classList.add('fa-trash')
            }
        }
        dropped.forEach(drop => {
            drop.addEventListener('click', toDropped)
        })

        // ------------------------------------------------------------

        function toPlanned(e) {
            var iconChange = e.target.parentNode.parentNode.parentNode.children[0]
            if (iconChange.classList.contains('fa-tasks')) {
                iconChange.classList.remove('fa-tasks')
                iconChange.classList.add('fa-plus')
            }

            else {
                for (let i = 0; i < icons.length; i++) {
                    iconChange.classList.remove(icons[i])
                }
                iconChange.classList.add('fa-tasks')
            }
        }
        planned.forEach(plan => {
            plan.addEventListener('click', toPlanned)
        })




    </script>


</body>

</html>