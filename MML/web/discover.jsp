
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="true" %>
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
    

    <title><%= request.getAttribute("title") %></title>
</head>

<body>
    <div class="container-fluid bg-black p-0 min-vh-100 d-flex flex-column justify-content-between">
        <div>
            <jsp:include page="navbar.jsp" />
            <% 
                boolean showBar = (Boolean)request.getAttribute("showBar");
                boolean isMovie = (Boolean)request.getAttribute("isMovie");
                String sort_by = request.getParameter("sort_by");
                String fromDate = request.getParameter(isMovie ? "primary_release_date.gte" : "first_air_date.gte");
                String toDate = request.getParameter(isMovie ? "primary_release_date.lte" : "first_air_date.lte");
                if(fromDate==null || fromDate.equals("null")) fromDate = "";
                if(toDate==null || toDate.equals("null")) {
                    Calendar c = Calendar.getInstance();
                    c.setTime(new Date());
                    c.add(Calendar.YEAR, 1);
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    toDate = formatter.format(c.getTime());
                }
            %>
            <div class="container-lg">
                <div class="row  mt-4">
                    <h3 class="text-white">
                        <%= request.getAttribute("title") %>
                    </h3>
                    
                    <% if(showBar) { %>
                        <div class="col-12 col-md-4 col-lg-3">

                            <div class="pe-md-4">
                                <form action="/MML/<%= isMovie ? "movies" : "shows" %>" id="queryForm">
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
                                                    <select class="form-select mt-3 text-black" name="sort_by" aria-label="sort" id="sort-select">
                                                        <option selected disabled value="">Select order</option>
                                                        <option value="popularity.desc">Popularity Descending</option>
                                                        <option value="popularity.asc">Popularity Ascending</option>
                                                        <option value="vote_average.desc">Rating Descending</option>
                                                        <option value="vote_average.asc">Rating Ascending</option>
                                                        <option value="primary_release_date.desc">Release Date Descending</option>
                                                        <option value="primary_release_date.asc">Release Date Ascending</option>
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
                                                <div class="accordion-body text-white">

                                                    <div class="fs-5 fw-bold text-yellow">Release Dates </div>
                                                    <div class="">
                                                        <label for="from-date"
                                                            class="col-form-label text-white">From</label>
                                                        <div class="col-10">
                                                            <input class="form-control" type="date" id="from-date" name="<%=isMovie ? "primary_release_date.gte" : "first_air_date.gte"%>" value="<%= fromDate %>">
                                                        </div>
                                                    </div>

                                                    <div class="">
                                                        <label for="to-date" class="col-form-label text-white">To</label>
                                                        <div class="col-10">
                                                            <input class="form-control" type="date" id="to-date" name="<%=isMovie ? "primary_release_date.lte" : "first_air_date.lte"%>" value="<%= toDate %>">
                                                        </div>
                                                    </div>

                                                    <hr class="text-white">

                                                    <div class=" fw-bold mb-2 fs-5 text-yellow">Genres</div>
                                                    <% 
                                                        JSONArray genreList = (JSONArray) request.getAttribute("genreList");
                                                        String selectedGenres[] = request.getParameterValues("with_genres");
                                                        ArrayList<String> selected = new ArrayList<>();
                                                        if(selectedGenres != null) selected = new ArrayList<>(Arrays.asList(selectedGenres));
                                                        for (int i = 0; i < genreList.size(); i++) {
                                                            JSONObject genreItem = (JSONObject) genreList.get(i);
                                                            boolean isSelected = selected.contains(genreItem.get("id").toString());
                                                    %>
                                                            <input type="checkbox" class="btn-check" id="<%= genreItem.get("id") %>"
                                                                   autocomplete="off" value="<%= genreItem.get("id") %>" name="with_genres" <%= isSelected ? "checked" : "" %>/>
                                                            <label class="btn btn-outline-yellow btn-rounded px-2 m-1"
                                                                for="<%= genreItem.get("id") %>"><%= genreItem.get("name") %></label>
                                                    <% 
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- SEARCH -->
                                    <button type="submit" id="submitQueries" class="d-none btn-lg btn-yellow btn-block fixed-bottom fw-bold">Search</button>
                                </form>
                            </div>
                        </div>
                    <% } %>
                    
                    <div class="col-12 <%= showBar ? "col-md-8 col-lg-9" : "" %>">
                        <div class="row g-4 mb-4" id="card-container">
                            <% 
                                JSONArray resultArray = (JSONArray) request.getAttribute("resultArray");
                                for (int i = 0; i < resultArray.size(); i++) {
                            %>
                                    <jsp:include page="card.jsp">
                                        <jsp:param name="contentItem" value="<%=(JSONObject) resultArray.get(i)%>" />
                                        <jsp:param name="style" value="<%= showBar ? "col-lg-3 col-sm-4 col-12" : "col-xl-2 col-lg-3 col-md-4 col-sm-6 col-12" %>" />
                                        <jsp:param name="isMovie" value="<%= isMovie %>" />
                                    </jsp:include>
                                    
                            <%
                                }
                            %>
                            
                        </div>
                        <button type="button" class="btn btn-outline-yellow btn-block fs-5 mb-4" id="loadMore">Load More</button>
                        <div class="w-100 text-center mb-4 d-none" id="spinner">
                            <div class="spinner-border text-yellow" role="status">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
    </div>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
    
    <% if(showBar) { %>
        <script>

            function showSubmit() {
                const submitBtn = document.getElementById('submitQueries')
                submitBtn.classList.remove('d-none')
            }
            
            const inputs = document.querySelectorAll('#queryForm input')
            const sortSelect = document.getElementById('sort-select')
            inputs.forEach(inputItem => inputItem.addEventListener('change', showSubmit))
            sortSelect.addEventListener('change', showSubmit)
            let sort_by = '<%= sort_by %>'
            if(sort_by != "null") sortSelect.value = sort_by
        </script>
    <% } %>
    
    <script>
        let page = 1
        function handleLoad() {
            loadBtn.classList.add('d-none')
            spinner.classList.remove('d-none')
            
            fetch(window.location.pathname + (window.location.search!="" ? window.location.search+"&" : "?") + "page=" + ++page, {
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
            .then(response => response.json())
            .then(data => {
                data.forEach(item => {
                    cardContainer.innerHTML += `
                        <div class="<%= showBar ? "col-lg-3 col-sm-4 col-12" : "col-xl-2 col-lg-3 col-md-4 col-sm-6 col-12" %> content">
                            <a href="/MML/`+'<%= isMovie ? "movie" : "show" %>'+`?id=${item.id}" class="text-white">
                                <div class="card h-100 bg-dark text-white">
                                    <div class="row g-0">
                                        <div class="img-container col-4 col-sm-12">
                                            ${item.poster_path ? 
                                                    `<div style="height:0; padding-top:160%; width:100%; background:url('https://image.tmdb.org/t/p/w342/${item.poster_path}') no-repeat center center; background-size: cover;"></div>`
                                                :
                                                    `<div style="height:0; padding-top:160%; width:100%; background:#777 url('images/default.png') no-repeat center center;"></div>`
                                            }
                                        </div>
                                        <div class="card-body bg-dark col-8 col-sm-12 d-flex flex-column justify-content-evenly">
                                            <h5 class="card-title">`+ item.<%= isMovie ? "title" : "name" %> +`</h5>
                                            <p class="card-text line-clamp d-sm-none my-1 card-desc">${item.overview}</p>
                                            <p class="card-text m-0 text-muted">` +
                                                item.<%= isMovie ? "release_date" : "first_air_date" %> +
                                            `</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    `
                })
                

                if(data.length > 0) loadBtn.classList.remove('d-none')
                spinner.classList.add('d-none')
            })
        }

        const cardContainer = document.getElementById('card-container')
        const spinner = document.getElementById('spinner')
        const loadBtn = document.getElementById('loadMore')
        loadBtn.addEventListener('click', handleLoad)
    </script>

</body>

</html>