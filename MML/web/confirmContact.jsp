<%-- 
    Document   : confirmContact
    Created on : Apr 26, 2021, 11:54:38 AM
    Author     : Ishjot Singh
--%>

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
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/login_user.css">

        <title>Contact us — My Movie List</title>
    </head>

    <body>
        <div class="alert alert-dark mb-0 alert-absolute start-50 mt-3 translate-middle-x fade" style="z-index:2;" id="fields-empty-error" role="alert" data-mdb-color="secondary">
            <i class="fas fa-times me-2"></i>
            Invalid Username and Password combination
        </div>
        <div class="container-fluid min-vh-100" style="background-image: url('images/bg_login.jpg'); background-size: cover; background-repeat: no-repeat;
             background-position: center center; ">
            <div class="mask" style="background-color: rgba(0, 0, 0, 0.7)">
                <div class="row h-100 p-0 ">
                    <div class="d-flex flex-row align-items-center justify-content-center col-12 col-sm-8 col-md-6 col-xl-4 offset-sm-2 offset-md-3 offset-xl-4 text-center min-vh-100">
                        <div class="h-100 h-sm-initial py-4" style="background-color: rgba(0, 0, 0, 0.8);">
                            <img src="images/logo3.jpg" class="w-25 mt-3" alt="">
                            <div class="text-white fs-6 mt-3 p-2">
                                Thank you for reaching out to us.<br>We have received your email.<br> We will respond as soon as possible.
                            </div>

                            <div class="mx-5 mt-3 px-3">
                                <form method="GET" action="/MML/" id="to-home">
                                    <!-- Submit button -->
                                    <button type="submit" id="submit-form-email"
                                            class=" btn btn-outline-yellow border border-yellow text-white btn-block btn-hover-custom mb-4"> Proceed to Homepage </button>

                                </form>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>

        <script>

            

    </body>

</html>
