
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
    <link rel="stylesheet" href="css/custom-carousel.css">
    

    <link rel="stylesheet" href="css/template.css">
    <link rel="stylesheet" href="css/rating.css">
    <title><%= request.getAttribute("title") %></title>
</head>

<body>
    <div class="container-fluid bg-black p-0 min-vh-100 d-flex flex-column justify-content-between">
        <div>
            <jsp:include page="navbar.jsp" />
            <% 
                boolean showBar = (Boolean)request.getAttribute("showBar");
                boolean isMovie = (Boolean)request.getAttribute("isMovie");
            %>
            <div class="container-lg">
                <div class="row  mt-4">
                    <h3 class="text-white">
                        <%= request.getAttribute("title") %>
                    </h3>
                    
                    <div class="col-12 col-md-4 col-lg-3 <%= showBar ? "" : "d-none" %>">

                        <div class="pe-md-4">
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

                                            <select class="form-select mt-3 text-black" aria-label="sort" id="sort-select">
                                                <option selected disabled value="select">Select order</option>
                                                <option value="popularity.desc">Popularity Descending</option>
                                                <option value="popularity.asc">Popularity Ascending</option>
                                                <option value="vote_average.desc">Rating Descending</option>
                                                <option value="vote_average.asc">Rating Ascending</option>
                                                <option value="release_date.desc">Release Date Descending</option>
                                                <option value="release_date.asc">Release Date Ascending</option>
                                                <option value="original_title.asc">Title (A-Z) </option>
                                                <option value="original_title.desc">Title (Z-A)</option>
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

                    <div class="col-12 <%= showBar ? "col-md-8 col-lg-9" : "" %>">
                        <div class="row g-4 mb-4">
                            <% 
                                JSONArray resultArray = (JSONArray) request.getAttribute("resultArray");
                                for (int i = 0; i < 20; i++) {
                            %>
                                    <jsp:include page="card.jsp">
                                        <jsp:param name="contentItem" value="<%=(JSONObject) resultArray.get(i)%>" />
                                        <jsp:param name="style" value="<%= showBar ? "col-lg-3 col-sm-4 col-12" : "col-xl-2 col-lg-3 col-md-4 col-sm-6 col-12" %>" />
                                        <jsp:param name="contentName" value="<%= isMovie ? "title" : "name" %>" />
                                        <jsp:param name="contentDate" value="<%= isMovie ? "release_date" : "first_air_date" %>" />
                                    </jsp:include>
                                    
                            <%
                                }
                            %>
                            
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
        function sortHandler() {
            fetch('/MML/movies?sort='+sortSelector.value)
            .then(response => response.json())
            .then(data => {
                
            })
        }

        const sortSelector = document.getElementbyId('sort-slector');
        sortSelector.addEventListener('change', sortHandler);
    </script>


</body>

</html>