
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/login_user.css">

        <title>Login Page</title>
    </head>
    <body>

        <% if (request.getAttribute("invalid") != null) { %>
            <div class="alert alert-dark mb-0 alert-absolute start-50 mt-3 translate-middle-x fade" style="z-index:2;" id="invalid-creds-alert" role="alert" data-mdb-color="secondary">
                <i class="fas fa-times me-2"></i>
                Invalid Username and Password combination
            </div>
        <% } %>

        <div class="container-fluid min-vh-100" style="background-image: url('images/bg_login.jpg'); background-size: cover; background-repeat: no-repeat;
             background-position: center center; ">
            <div class="mask" style="background-color: rgba(0, 0, 0, 0.7)">
                <div class="row h-100 p-0 ">
                    <div class="d-flex flex-row align-items-center justify-content-center col-12 col-sm-8 col-md-6 col-xl-4 offset-sm-2 offset-md-3 offset-xl-4 text-center min-vh-100">
                        <div class="h-100 h-sm-initial py-4" style="background-color: rgba(0, 0, 0, 0.8);">
                            <img src="images/logo3.jpg" class="w-25 mt-3" alt="">
                            <div class="text-white fs-4 mt-3">
                                Sign-in to My Movie List
                            </div>

                            <div class="mx-5 mt-3 px-3">
                                <!-- <div class="btn btn-light mb-3 d-flex flex-row align-items-center justify-content-center" >
                                  <img src="images/google.png" class="me-3" style="width: 10%;" alt="">
                                  <div class="fw-bold">Sign in with Google</div>
                                </div> -->
                                <form method="POST" action="/MML/login">
                                    <!-- Username input -->
                                    <div class="input-group form-outline form-white mb-4">
                                        <span class="input-group-text bg-yellow border border-yellow"> <i class="fas fa-user text-dark"></i> </span>
                                        <input type="text" id="uname-input" class="form-control" name="uname" placeholder="Username.." required />
                                    </div>


                                    <!-- Password input -->
                                    <div class="input-group form-outline form-white mb-4">
                                        <span class="input-group-text bg-yellow border border-yellow"> <i class="fas fa-key text-dark"></i></span>
                                        <input type="password" id="pass-input" class="form-control" name="pass" placeholder="Password..." required />
                                    </div>

                                    <!-- 2 column grid layout for inline styling -->
                                    <div class="row mb-4">
                                        <div class="col d-flex justify-content-center">
                                            <!-- Checkbox -->
                                            <div class="form-check">
                                                <input class="form-check-input bg-dark" style="border-color: #FFF;" type="checkbox" value="true" id="remember" name="remember" checked />
                                                <label class="form-check-label" for="remember"> Remember me </label>
                                            </div>
                                        </div>

                                        <div class="col">
                                            <!-- Simple link -->
                                            <a class="text-white" href="/MML/forgot%20password">Forgot password?</a>
                                        </div>
                                    </div>

                                    <!-- Submit button -->

                                    <button type="submit" class="btn btn-outline-yellow text-white btn-block mb-4 btn-hover-custom">Log in</button>

                                    <!-- Register buttons -->
                                    <div class="text-center">
                                        <p>Not a member? <a class="text-white" href="/MML/register">Register</a></p>
                                        <p>or sign in with:</p>
                                        <button type="button" class="btn btn-lg btn-block mx-1 d-flex flex-row align-items-center justify-content-center text-white
                                                rounded-3" style="background-color: rgb(255, 255, 255, 0.2);">
                                            <img src="images/google.png" class="me-2" style="width: 1.5em;" alt=""> 
                                            <div class="fs-6">Google</div>
                                        </button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>


        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
        <% if (request.getAttribute("invalid") != null) { %>
            <script>
                const alert = document.getElementById("invalid-creds-alert");
                alert.classList.add('show');
                setTimeout(() => {
                    alert.classList.remove('show');
                }, 2000)
            </script>
        <% }%>
    </body>
</html>
