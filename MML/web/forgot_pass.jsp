<%-- 
    Document   : forgot_pass
    Created on : Apr 19, 2021, 10:07:34 PM
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

        <title>Forgot Password?</title>
    </head>

    <body>

        <div class="alert alert-dark mb-0 alert-absolute start-50 mt-3 translate-middle-x fade" style="z-index:2;" id="enter-one-field" role="alert" data-mdb-color="secondary">
            <i class="fas fa-times me-2"></i>
            Please enter only one field!
        </div>
        

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
                            <div class="text-white fs-4 mt-3">
                                Please enter your
                            </div>

                            <div class="mx-5 mt-3 px-3">
                                <form method="POST" action="/MML/email%20sent" id="send-temp-password">
                                    <!-- 2 column grid layout with text inputs for the first and last names -->


                                    <div class="col">
                                        <div class="">
                                            <div class="input-group form-outline form-white">
                                                <span class="input-group-text bg-yellow border border-yellow"> <i
                                                        class="fas fa-user text-dark"></i> </span>
                                                <input type="text" id="username-input" name="username" class="form-control"
                                                       placeholder="Username..." />

                                            </div>
                                            <!--                                        <div id="username-length-error" class="overflow-hidden h-0 text-danger text-start transition"><small>The username should be between 2 - 32 characters!</small></div>
                                                                                    <div id="username-taken-error" class="overflow-hidden h-0 text-danger text-start transition"><small>The username is already taken!</small></div>-->
                                            <div id="incorrect-username-error" class="overflow-hidden h-0 text-danger text-start transition"><small>The username does not exist!</small></div>
                                        </div>
                                    </div>

                                    <div class="my-2 text-white fs-5 fw-bold">Or</div>

                                    <!-- Email input -->
                                    <div class="col mb-4">
                                        <div>
                                            <div class="input-group form-outline form-white">
                                                <span class="input-group-text bg-yellow border border-yellow"> <i
                                                        class="fas fa-envelope text-dark"></i> </span>
                                                <input type="email" id="email-input" name="email" class="form-control"
                                                       placeholder="Email.." />
                                            </div>
                                        <div id="incorrect-email-error" class="overflow-hidden h-0 text-danger text-start transition"><small>The email does not exist!</small></div>
                                    </div>
                                    </div>
                                    
                                    <!-- Checkbox -->

                                    <!-- Submit button -->
                                    <button type="submit" id="submit-form-email"
                                            class="disabled btn btn-outline-yellow border border-yellow text-white btn-block btn-hover-custom mb-4"> Send Email </button>

                                </form>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>

        <script>

            let uniqueName = false
            let unqiueEmail = false

            const submitBtn = document.getElementById("submit-form-email")
            const username = document.getElementById("username-input")
            const email = document.getElementById("email-input")
            const incorrectUsernameAlert = document.getElementById("incorrect-username-error")
            const incorrectEmailAlert = document.getElementById("incorrect-email-error")

            function validateInputFields(e) {
                e.preventDefault()
                const enterOneOnly = document.getElementById("enter-one-field")
                const alert = document.getElementById("fields-empty-error")
                const form = document.getElementById("send-temp-password")
                
                if(username.value.length > 0 && email.value.length > 0){
                    enterOneOnly.classList.add("show")
                    setTimeout(() => {
                        enterOneOnly.classList.remove('show');
                    }, 2000)
                    return
                }
                
                if (username.value == "" && email.value == "") {
                    alert.classList.add('show');
                    setTimeout(() => {
                        alert.classList.remove('show');
                    }, 2000)
                } 
                
                else {
                    form.submit()
                }
            }

            function enableSubmit() {
                
                if(uniqueName && uniqueEmail){
                    submitBtn.classList.add("disabled")
                }
                
                else {
                    submitBtn.classList.remove("disabled")
                } 
                
            }

            async function checkUserUnique(e) {

                let response = await fetch('/MML/checkUsername?uname=' + username.value)
                let text = await response.text()
                uniqueName = text.trim() == 'false'

                if (uniqueName) {
                    incorrectUsernameAlert.classList.remove('h-0')
                    incorrectUsernameAlert.classList.add('h-max')
                } else {
                    incorrectUsernameAlert.classList.add('h-0')
                    incorrectUsernameAlert.classList.remove('h-max')
                }

                enableSubmit()

            }

            async function checkEmailUnique(e) {

                let response = await fetch('/MML/checkEmail?email=' + email.value)
                let text = await response.text()
                uniqueEmail = text.trim() == 'false'

                if (uniqueEmail) {
                    incorrectEmailAlert.classList.remove('h-0')
                    incorrectEmailAlert.classList.add('h-max')
                } else {
                    incorrectEmailAlert.classList.add('h-0')
                    incorrectEmailAlert.classList.remove('h-max')
                }

                enableSubmit()

            }

            const uname = document.getElementById('username-input')
            uname.addEventListener('keyup', checkUserUnique)
            uname.addEventListener('change', checkUserUnique)
            
            const emailVerify = document.getElementById("email-input")
            emailVerify.addEventListener('keyup', checkEmailUnique)
            emailVerify.addEventListener('change', checkEmailUnique)

            submitBtn.addEventListener("click", validateInputFields)

        </script>

        <% if (request.getAttribute("validate_username") == "false") {%>
        <script>
            const alert_username = document.getElementById("invalid-username-error")

            alert_username.classList.add('show');
            setTimeout(() => {
                alert_username.classList.remove('show');
            }, 2000)

        </script>
        <% }%>

    </body>

</html>