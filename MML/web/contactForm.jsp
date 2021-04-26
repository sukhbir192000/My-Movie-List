<%-- 
    Document   : contactForm
    Created on : Apr 26, 2021, 10:35:01 AM
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
    <div class="container-fluid min-vh-100" style="background-image: url('images/bg_login.jpg'); background-size: cover; background-repeat: no-repeat;
        background-position: center center; ">
        <div class="mask" style="background-color: rgba(0, 0, 0, 0.7)">
            <div class="row h-100 p-0 ">
                <div class="d-flex flex-row align-items-center justify-content-center col-12 col-sm-8 col-md-6 col-xl-4 offset-sm-2 offset-md-3 offset-xl-4 text-center min-vh-100">
                    <div class="h-100 h-sm-initial py-4" style="background-color: rgba(0, 0, 0, 0.8);">
                        <img src="images/logo3.jpg" class="w-25 mt-3" alt="">
                        <div class="text-white fs-4 mt-3">
                            Contact us
                        </div>

                        <div class="mx-5 mt-3 px-3">
                            <form method="POST" action="/MML/emailRecieved">
                               
                                <!-- Email input -->
                                <div class="form-outline form-white mb-4">
                                    <input type="email" id="email-input" name="email" class="form-control" required />
                                    <label class="form-label" for="email-input"> Email</label>
                                </div>

                                <!-- Subject input -->
                                <div class="mb-4">
                                    <div class="form-outline form-white">
                                        
                                        <input type="text" id="subject-input" name="subject" class="form-control" required />
                                        <label class="form-label" for="subject-input"> Subject</label>
                                    </div>
                                    <div id="password-length-error" class="overflow-hidden h-0 text-danger text-start transition"><small>The password should be 8 or more characters long!</small></div>
                                </div>
                                
                                <!--Message input-->
                                <div class="mb-4">
                                    <div class="form-outline form-white">
                                        <textarea id="message-input" name="message"
                                                  class="form-control"  required></textarea>
                                         <label class="form-label" for="message-input">Message</label>         
                                    </div>
                                    <div id="password-mismatch-error" class="overflow-hidden h-0 text-danger text-start transition"><small>The passwords do not match!</small></div>
                                </div>
                                
                                <!-- Submit button -->
                                <button type="submit" id="submit-form"
                                    class=" btn btn-outline-yellow border border-yellow text-white btn-block btn-hover-custom mb-4">Send Email
                                </button>

                            </form>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>

    <script>
    </script>

</body>

</html>
