<%-- 
    Document   : editProfile
    Created on : Apr 21, 2021, 2:23:32 PM
    Author     : Ishjot Singh
--%>

<%@page import="beans.User"%>
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.3.0/animate.css" rel="stylesheet" />
    
    <link rel="stylesheet" href="css/color.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/login_user.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Baloo+Tammudu+2:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">

    <title>My Profile — My Movie List</title>
    <style>
        .custom-font {
            font-family: 'Baloo Tammudu 2', cursive;
        }

        .blur-bg {
            background-color: rgba(0, 0, 0, 0.74);
        }

        .nav-pills .nav-link.active>span {
            padding: 0 10px 7px;
            border-bottom: 5px #F9C80E solid;
        }

        .nav-pills .nav-link.active {

            background-color: #F9C80E;
            color: black;
        }

        .straight-corner {
            border-radius: 0 !important;

        }

        .table-img {
            max-width: 100px !important;
        }

        @media screen and (max-width:576px) {
            .table-img {
                max-width: 50px !important;
            }
        }
    </style>
</head>

<body>
    <div class="alert alert-success mb-0 alert-fixed end-0 mt-3 me-3 pe-5 fade" style="z-index:1000; width: 400px;" id="successImage" role="alert" data-mdb-color="secondary">
        <i class="fas fa-check me-2"></i>
        Image successfully updated!
    </div>
    
    <div class="alert alert-success mb-0 alert-fixed end-0 mt-3 me-3 pe-5 fade" style="z-index:1000; width: 400px;" id="successName" role="alert" data-mdb-color="secondary">
        <i class="fas fa-check me-2"></i>
        Names successfully updated!
    </div>
    
    <div class="alert alert-success mb-0 alert-fixed end-0 mt-3 me-3 pe-5 fade" style="z-index:1000; width: 400px;" id="successPassword" role="alert" data-mdb-color="secondary">
        <i class="fas fa-check me-2"></i>
        Password successfully updated!
    </div>
    <div class="container-fluid bg-black p-0 min-vh-100 d-flex flex-column justify-content-between">
        <div>
            <% 
                HttpSession ses = request.getSession();
                User user = (User) ses.getAttribute("loggedUser");
                String fname = user.getFirstName();
                String lname = user.getLastName();
                String uname = user.getUsername();

            %>

            <jsp:include page="navbar.jsp" />
            
            <div class="row position-relative p-0 m-0 pb-5">
                <div class="col-12 col-md-6 offset-md-3 pt-5 ">
                    <form id="namesForm" class="text-white row wow animated bounceInRight" method = "POST" action="/MML/detailsUpdated">
                        <h3 class="h3 mb-4 text-yellow"><i class="fas fa-house-user"></i> General</h3>
                        <div class="col-12 col-md-6 px-3">
                            <div class=" form-outline form-white mb-4">
                                <input type="text" id="fname" name="fname" class="form-control" value=<%=fname%> />
                                <label class="form-label" for="fname">First name</label>
                            </div>
                        </div>

                        <div class="col-12 col-md-6 px-3">
                            <div class=" form-outline form-white mb-4">
                                <input type="text" id="lname" name="lname" class="form-control" value=<%=lname%> />
                                <label class="form-label" for="lname">Last name</label>
                            </div>
                        </div>
                        <div class="col-12 px-3 mb-4">
                            <div class=" form-outline form-white ">
                                <input type="text" id="uname" name="uname" class="form-control" value=<%=uname%> />
                                <label class="form-label" for="uname">Username</label>
                            </div>
                            <div id="incorrect-username-error" class="overflow-hidden h-0 text-danger text-start transition"><small>Username already taken!</small></div>
                        </div>
                        <div class="d-flex flex-row justify-content-end mt-4">
                            <button type="submit" id="updateNames" class="btn btn-yellow disabled ">Update Names</button>
                        </div>
                    </form>
                    <form id="pictureUpdate" enctype="multipart/form-data" action="/MML/picturesUpdated" method="POST" class="text-white row wow animated bounceInLeft" >
                        <h3 class="h3 mb-4 text-yellow"><i class="fas fa-camera-retro"></i> Personalize </h3>
                        <div class="col-12 col-md-6  px-3">
                            <label class="form-label text-white" for="bannerPic">Banner Photo</label>
                            <input type="file" class="form-control" id="bannerPic" name="bannerPic" />

                        </div>

                        <div class="col-12 col-md-6 px-3 bg">
                            <label class="form-label text-white" for="profilePic">Profile Photo</label>
                            <input type="file" class="form-control" id="profilePic" name="profilePic" />

                        </div>
                        <div class="d-flex flex-row justify-content-end mt-4">
                            <button id="updatePic" type="button" class="btn btn-yellow">Update Photos</button>
                        </div>
                    </form>
                    <form id="passwordForm" class="text-white row mt-4 wow animated bounceInUp" method="POST" action="/MML/passwordChanged" >
                        <h3 class="h3 mb-4 text-yellow"><i class="fas fa-shield-alt"></i> Security</h3>

                        <div class="col-12 px-3 mb-4">
                            <div class=" form-outline form-white ">
                                <input type="password" id="currPass" name="currPass" class="form-control" />
                                <label class="form-label" for="curPass">Enter Current Password</label>
                            </div>
                            
                        </div>
                        <div class="col-12 col-md-6 px-3 mb-4">
                            <div class=" form-outline form-white ">
                                <input type="password" id="newPass" name="newPass" class="form-control" />
                                <label class="form-label" for="newPass">Enter New Password</label>
                            </div>
                            <div id="password-length-error" class="overflow-hidden h-0 text-danger text-start transition"><small>The password should be 8 or more characters long!</small></div>
                        </div>
                        <div class="col-12 col-md-6 px-3 mb-4">
                            <div class=" form-outline form-white ">
                                <input type="password" id="conPass" name="conPass" class="form-control" />
                                <label class="form-label" for="conPass">Confirm Password</label>
                            </div>
                            <div id="password-mismatch-error" class="overflow-hidden h-0 text-danger text-start transition"><small>The passwords do not match!</small></div>
                        </div>
                        <div class="d-flex flex-row justify-content-end">
                            <button type="submit" class="btn btn-yellow disabled" id="passSubmit">Update Password</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>

        <jsp:include page="footer.jsp" />
    </div>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
    <!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/snap.svg/0.3.0/snap.svg-min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
    
    
    <script>
        $(function () {
            new WOW().init();
        });

        //also at the window load event
        $(window).on('load', function () {

            new WOW().init();
        });
        
        let userUnique = true
        let passLengthCheck = false
        let passMismatchCheck = false
        let currPassLengthCheck = false
        
        const updatesNamesBtn = document.getElementById('updateNames')
        const incorrectUsernameAlert = document.getElementById('incorrect-username-error')
        const passLengthError = document.getElementById('password-length-error')
        const passMisMatchError = document.getElementById('password-mismatch-error')
        const currentPassLengthError = document.getElementById('current-password-length-error')
        
        const passSubmit = document.getElementById('passSubmit')
        const updatePic = document.getElementById('updatePic')
        
        function sendNamesForm(e){
            e.preventDefault()
            $.ajax({
                type: "POST",
                enctype: 'application/x-www-form-urlencoded',
                url: "/MML/detailsUpdated",
                data: $('#namesForm').serialize(),
                processData: false,
                timeout: 600000,
                success: function (data) {
                    const alert = document.getElementById("successName");
                    alert.classList.add('show');
                    setTimeout(() => {
                        alert.classList.remove('show');
                    }, 2000)
                },
                error: function (e) {
                    console.log("Error")
                }
            });
        }
        
        function sendPasswordForm(e){
            e.preventDefault()
            $.ajax({
                type: "POST",
                enctype: 'application/x-www-form-urlencoded',
                url: "/MML/passwordChanged",
                data: $('#passwordForm').serialize(),
                processData: false,
                timeout: 600000,
                success: function (data) {
                    const alert = document.getElementById("successPassword");
                    alert.classList.add('show');
                    setTimeout(() => {
                        alert.classList.remove('show');
                    }, 2000)
                },
                error: function (e) {
                    console.log("Error")
                }
            });
            document.getElementById("passwordForm").reset()
//            currPassEntered.value = ""
//            passEntered.value = ""
//            passConfirm.value = ""
            
        }
        
        
        function sendImageForm(e){
            e.preventDefault()
            var form = $('#pictureUpdate')[0];
            var data = new FormData(form);

            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "/MML/picturesUpdated",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (data) {
                    const alert = document.getElementById("successImage");
                    alert.classList.add('show');
                    setTimeout(() => {
                        alert.classList.remove('show');
                    }, 2000)
                },
                error: function (e) {
                    console.log("Error")
                }
            });
        }
        
        updatePic.addEventListener('click', sendImageForm)
        passSubmit.addEventListener('click', sendPasswordForm)
        updatesNamesBtn.addEventListener('click', sendNamesForm)
        
        function enableSubmit(){
            if(userUnique || uname.value == '<%=uname%>'){
                updatesNamesBtn.classList.remove('disabled')
            }
            else{
                updatesNamesBtn.classList.add('disabled')
            }
        }
        
        function enablePasswordChange() {
            if(passLengthCheck && passMismatchCheck && currPassLengthCheck){
                passSubmit.classList.remove('disabled')
            }
            
            else{
                passSubmit.classList.add('disabled')
            }
        }
        
        
        async function checkUserUnique(e) {

            let response = await fetch('/MML/checkUsername?uname=' + uname.value)
            let text = await response.text()
            userUnique = text.trim() == 'false'

            if (!userUnique && uname.value != '<%=uname%>') {
                incorrectUsernameAlert.classList.remove('h-0')
                incorrectUsernameAlert.classList.add('h-max')
            } else {
                incorrectUsernameAlert.classList.add('h-0')
                incorrectUsernameAlert.classList.remove('h-max')
            }

            enableSubmit()
        }
        
        function checkCurrPassLength(e){
            currPassLengthCheck = (e.target.value.length > 0)
            enablePasswordChange()
        }

        function checkPassCreds(e){
            passLengthCheck = (e.target.value.length >= 8)
            if(!passLengthCheck){
                passLengthError.classList.remove('h-0')
                passLengthError.classList.add('h-max')
            }
            else{
                passLengthError.classList.add('h-0')
                passLengthError.classList.remove('h-max')
            }
            enablePasswordChange()
        }

        function checkPassConf(e){
            passMismatchCheck = passEntered.value == passConfirm.value
            if(!passMismatchCheck){
                passMisMatchError.classList.remove('h-0')
                passMisMatchError.classList.add('h-max')
            }
            else{
                passMisMatchError.classList.add('h-0')
                passMisMatchError.classList.remove('h-max')
            }
            enablePasswordChange()
        }

        const uname = document.getElementById('uname')
        uname.addEventListener('keyup', checkUserUnique)
        uname.addEventListener('change', checkUserUnique)
        window.addEventListener('load', enableSubmit)
        
        // Current Password
        const currPassEntered = document.getElementById('currPass')
        currPassEntered.addEventListener('keyup', checkCurrPassLength)
        currPassEntered.addEventListener('change', checkCurrPassLength)

        // Check password
        const passEntered = document.getElementById('newPass')
        passEntered.addEventListener('keyup', checkPassCreds)
        passEntered.addEventListener('change', checkPassCreds)

        // Confirm password
        const passConfirm = document.getElementById('conPass')
        passConfirm.addEventListener('keyup', checkPassConf)
        passConfirm.addEventListener('change', checkPassConf)
    </script>
    


</body>

</html>
