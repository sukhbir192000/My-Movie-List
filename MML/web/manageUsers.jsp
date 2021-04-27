
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
    <title>Manage Users — Admin</title>
</head>

<body>
    <div class="alert alert-success mb-0 mt-3 alert-fixed end-0 me-3 pe-5 fade" style="z-index:999999; width: 350px; " id="successUserTable" role="alert" data-mdb-color="secondary">
        <i class="fas fa-check me-2"></i>
        Changes made successfully!
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
                        <a href="/MML/superAdmin/manageUsers" class="list-group-item content_color ps-4 border border-dark active_color">
                            Manage Users
                        </a>
                        <a href="/MML/superAdmin/manageReviews" class="list-group-item content_color ps-4 border border-dark">
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
                        <small class="p-0 m-0 font-weight-bold">Ishjot</small>
                        <small class="p-0 m-0">ishjot12@gmail.com</small>
                    </div>
                    <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg" class="rounded-circle z-depth-0 "
                        alt="avatar image" height="55" />

                </div>
                <div class="ps-3 pe-3 ">

                    <div class="min-vh-100 d-flex flex-column px-1 px-md-3 ">
                        <div class="p-0">
                            <div class="row p-0 text-dark">
                                <div class="col-12 pb-3 pt-4  ps-md-4">
                                    <h1 class="h1-responsive">Manage Users</h1>
                                    
                                </div>
                            </div>
                            <!-- Tabs navs -->


                        </div>
                        <div class="bg-white">
                            <div class="form-outline form-outline-dark">
                                <input type="text" id="searchMovie" name="search" class="form-control" />
                                <label class="form-label" for="searchMovie">Search</label>
                            </div>
                        </div>
                        <table class="table-responsive mt-3 mb-5 table table-hover bg-white">
                            <thead class="table-dark border">
                                <tr>
                                    <th scope="col" class="text-center">User ID</th>
                                    <th scope="col" class="text-center">Username</th>
                                    <th scope="col" class="text-center">Details</th>
                                </tr>

                            </thead>
                            <tbody id="userTable" class="border">

                            </tbody>
                        </table>

                        

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
        
        const userTable = document.getElementById('userTable')
        let removeUser = document.querySelectorAll('.removeUser')
        let fname = document.getElementsByName("fname")
        let lname = document.getElementsByName('lname')
        let saveChanges = document.querySelectorAll('.saveChanges')
        let about = document.getElementsByName("about")
        let uname = document.getElementsByName("uname")
        let usernameInput = document.querySelectorAll('.change-username')
        let uid = []
        
        let users = []
        async function fetchData(){
            await fetch('/MML/superAdmin/getDetails?return=users')
                .then(response => response.json())
                .then(data => users = data)
            
            const html = users.map(user => {
                uid.push(user[0])
                return `
                <tr>
                    <th scope="row" class="text-center">${user[0]}</th>
                    <td class="text-center">${user[1]}</td>
                    <td class="text-center">
                        <button 
                            class="btn btn-primary py-1 px-2 showDets" 
                            id = "${user[0]}" 
                            data-mdb-toggle="modal"
                            data-mdb-target="#${user[1]}-modal"> 
                        Details</button>
                        <div
                            class="modal fade"
                            id="${user[1]}-modal"
                            tabindex="-1"
                            aria-labelledby="${user[0]}-label"
                            aria-hidden="true"
                          >
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="${user[0]}-label">User Information</h5>
                                  
                                </div>
                                <div class="modal-body">
                                  <form id = "changes-${user[0]}">
                                    <!-- 2 column grid layout with text inputs for the first and last names -->
                                    <div class="row mb-4">
                                      <div class="col">
                                        <div class="form-outline">
                                          <input value="${user[2]}" type="text" id="fname-${user[0]}" name="fname" class="form-control" />
                                          <label for="fname-${user[0]}" class="form-label"> First Name </label>  
                                        </div>
                                      </div>
                                      <div class="col">
                                        <div class="form-outline">
                                          <input value="${user[3]}" type="text" id="lname-${user[0]}" name="lname" class="form-control" />
                                          <label for="lname-${user[0]}" class="form-label"> Last Name </label>  
                                        </div>
                                      </div>
                                    </div>

                                    <!-- Username input -->
                                    <div class="form-outline mb-4">
                                      <input disabled value="${user[1]}" type="text" id="uname-${user[0]}" name="uname" class="form-control" />
                                      <label for="uname-${user[0]}" class="form-label change-username"> Username </label>  
                                    </div>
            
                                    <!-- Email input -->
                                    <div class="form-outline mb-4">
                                      <input disabled value="${user[4]}" type="email" id="email-${user[0]}" name="email" class="form-control" />
                                      <label for="email-${user[0]}" class="form-label"> Email </label>  
                                    </div>

                                    <!-- Password input -->
                                    <div class="form-outline mb-4">
                                      <textarea id="about-${user[0]}" name="about" class="form-control">${user[5]}</textarea>
                                      <label for="about-${user[0]}" class="form-label"> About </label>  
                                    </div>

                                  </form>  
                                </div>
                                <div class="modal-footer">
                                  <button type="button" form="changes-${user[0]}" data-mdb-dismiss="modal" class="btn btn-primary saveChanges">Save changes</button>
                                  <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">
                                    Close
                                  </button>
                                </div>
                              </div>
                            </div>
                        </div>
                    </td>
                    
                </tr>

                `
                
            })
            
            userTable.innerHTML = html.join(' ')
            
             
            // Initialize form-outline for dynamically added inputs
            document.querySelectorAll('.form-outline').forEach((formOutline) => {
                new mdb.Input(formOutline).init();
            });
            
            usernameInput = document.querySelectorAll('.change-username')
            
            uname = document.getElementsByName("uname")
            fname = document.getElementsByName("fname")
            lname = document.getElementsByName("lname")
            about = document.getElementsByName("about")
            
            saveChanges = document.querySelectorAll('.saveChanges')
            saveChanges.forEach((save) => {
                save.addEventListener('click', changeDetails)
            })
            
            removeUser = document.querySelectorAll('.removeUser')
            removeUser.forEach(user => {
                user.addEventListener('click', deleteUser)
            })
            
        }
        
//        function deleteUser(e){
//            index = [].indexOf.call(removeUser, e.target)
//            
//            $.ajax({
//                method: 'POST',
//                url: `/MML/superAdmin/deleteUser?uid=${uid[index]}`,
//                data: {},
//                success: function(data){
//                    const alert = document.getElementById("successUserTable");
//                    alert.classList.add('show');
//                    alert.classList.remove('d-none')
//                    setTimeout(() => {
//                        alert.classList.remove('show');
//                        alert.classList.add('d-none')
//                    }, 2000)
//                    e.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.remove()
//                }
//            })
//            
//        }
        
        function changeDetails(e){
            let index = [].indexOf.call(saveChanges, e.target)
            $.ajax({
                method: 'POST',
                url: `/MML/superAdmin/detailsUpdated?isSA=true&fname=${fname[index].value}&lname=${lname[index].value}&about=${about[index].value}&uid=${uid[index]}&uname=${uname[index].value}`,
                data: {},
                success: function(data){
                    const alert = document.getElementById("successUserTable");
                    alert.classList.add('show');
                    alert.classList.remove('d-none')
                    setTimeout(() => {
                        alert.classList.remove('show');
                        alert.classList.add('d-none')
                    }, 2000)
                }
            })
        }
        
        function filterData(toMatch, users){
            return users.filter(user => {
                const regex = new RegExp(toMatch, 'gi')
                return user[1].match(regex)
            })
        }
        
        function displayMatches(e){
            const matchArray = filterData(this.value, users)
            const html = matchArray.map(user => {
                return `
                    <tr>
                        <th scope="row" class="text-center">${user[0]}</th>
                        <td class="text-center">${user[1]}</td>
                        <td class="text-center">
                            <button 
                                class="btn btn-primary py-1 px-2 showDets" 
                                id = "${user[0]}" 
                                data-mdb-toggle="modal"
                                data-mdb-target="#${user[1]}-modal"> 
                            Details</button>
                            <div
                                class="modal fade"
                                id="${user[1]}-modal"
                                tabindex="-1"
                                aria-labelledby="${user[0]}-label"
                                aria-hidden="true"
                              >
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="${user[0]}-label">User Information</h5>

                                    </div>
                                    <div class="modal-body">
                                      <form id = "changes-${user[0]}">
                                        <!-- 2 column grid layout with text inputs for the first and last names -->
                                        <div class="row mb-4">
                                          <div class="col">
                                            <div class="form-outline">
                                              <input value="${user[2]}" type="text" id="fname-${user[0]}" name="fname" class="form-control" />
                                              <label for="fname-${user[0]}" class="form-label"> First Name </label>  
                                            </div>
                                          </div>
                                          <div class="col">
                                            <div class="form-outline">
                                              <input value="${user[3]}" type="text" id="lname-${user[0]}" name="lname" class="form-control" />
                                              <label for="lname-${user[0]}" class="form-label"> Last Name </label>  
                                            </div>
                                          </div>
                                        </div>

                                        <!-- Username input -->
                                        <div class="form-outline mb-4">
                                          <input disabled value="${user[1]}" type="text" id="uname-${user[0]}" name="uname" class="form-control" />
                                          <label for="uname-${user[0]}" class="form-label change-username"> Username </label>  
                                        </div>

                                        <!-- Email input -->
                                        <div class="form-outline mb-4">
                                          <input disabled value="${user[4]}" type="email" id="email-${user[0]}" name="email" class="form-control" />
                                          <label for="email-${user[0]}" class="form-label"> Email </label>  
                                        </div>

                                        <!-- Password input -->
                                        <div class="form-outline mb-4">
                                          <textarea id="about-${user[0]}" name="about" class="form-control">${user[5]}</textarea>
                                          <label for="about-${user[0]}" class="form-label"> About </label>  
                                        </div>

                                      </form>  
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" form="changes-${user[0]}" class="btn btn-primary saveChanges">Save changes</button>
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
                                id = "${user[0]}-user" 
                                data-mdb-toggle="modal"
                                data-mdb-target="#${user[1]}-modal-remove"> 
                            - Remove</button>

                            <div class="modal fade" id="${user[1]}-modal-remove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <h5 class="modal-header">
                                            Confirm delete
                                        </h5>
                                        <div class="modal-body">
                                            Are you sure you want to remove the user: <i><strong>${user[1]}</strong></i>
                                        </div>
                                        <div class="modal-footer">
                                            <a class="btn btn-danger btn-ok removeUser" data-mdb-dismiss="modal">Delete</a>
                                            <button type="button" class="btn btn-default" data-mdb-dismiss="modal">Cancel</button>

                                        </div>
                                    </div>
                                </div>
                            </div>        
                        </td>
                    </tr>

            `
            })
            
            userTable.innerHTML = html
            document.querySelectorAll('.form-outline').forEach((formOutline) => {
                new mdb.Input(formOutline).init();
            });
        }
        
        const search = document.getElementById("searchMovie")
        
        search.addEventListener('change', displayMatches)
        search.addEventListener('keyup', displayMatches)
        window.addEventListener('load', fetchData)

    </script>
</body>

</html>
