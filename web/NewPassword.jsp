<%-- 
    Document   : NewPassword
    Created on : Nov 15, 2023, 10:28:12 AM
    Author     : Hieu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>New Password</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./assest/css/login.css">
        <style>
            .backimg {
                height: 80px;
                width: 90px;
                background-position: left top;
                background-size: 50%;
                background-repeat: no-repeat;
            }
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }
            html {
                color: #333;
                font-size: 62.5%;
                font-family: 'Open Sans', sans-serif;
            }
            .main {
                background: #f1f1f1;
                min-height: 100vh;
                display: flex;
                justify-content: center;
            }
            .form {
                width: 360px;
                min-height: 100px;
                padding: 32px 24px;
                text-align: center;
                background: #fff;
                border-radius: 2px;
                margin: 24px;
                align-self: center;
                box-shadow: 0 2px 5px 0 rgba(51, 62, 73, 0.1);
            }
            .form .heading {
                font-size: 2rem;
            }
            .form .desc {
                text-align: center;
                color: #636d77;
                font-size: 1.6rem;
                font-weight: lighter;
                line-height: 2.4rem;
                margin-top: 16px;
                font-weight: 300;
            }

            .form-group {
                display: flex;
                margin-bottom: 16px;
                flex-direction: column;
            }

            .form-label,
            .form-message {
                text-align: left;
            }

            .form-label {
                font-weight: 700;
                padding-bottom: 6px;
                line-height: 1.8rem;
                font-size: 1.4rem;
            }

            .form-control {
                height: 40px;
                padding: 8px 12px;
                border: 1px solid #b3b3b3;
                border-radius: 3px;
                outline: none;
                font-size: 1.4rem;
            }

            .form-control:hover {
                border-color: #1dbfaf;
            }

            .form-group.invalid .form-control {
                border-color: #f33a58;
            }

            .form-group.invalid .form-message {
                color: #f33a58;
            }

            .form-message {
                font-size: 1.2rem;
                line-height: 1.6rem;
                padding: 4px 0 0;
            }

            .form-submit {
                outline: none;
                background-color: blue;
                margin-top: 12px;
                padding: 12px 16px;
                font-weight: 600;
                color: #fff;
                border: none;
                width: 100%;
                font-size: 14px;
                border-radius: 8px;
                cursor: pointer;
            }

            .form-submit:hover {
                background-color: #1ac7b6;
            }
            .sendcode{
                padding: 7px;
                cursor: pointer;
            }
            #error {
                margin-top: 12px;
                color: green;
                font-weight: bold;
                display: none;
            }
            
            
        .forgot_1 {
            height: 100vh;
            text-align: center;
            margin-top: 20px;
        }

        .forgot_2 {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        .forgot_2:hover {
            color: #2980b9;
        }
        </style>
    </head>
    <body>

        <div class="main">
            <form action="forgotpassword" method="get" class="form" id="form2" onmousemove="check()">
                <form action="" method="POST" class="form" id="form2">
                    <h3 class="heading">Mật khẩu mới đã được gửi về email: 
                        <span class="value_email">${requestScope.send_email} </span>
                    </h3>                
            </form>
            <div class="forgot_1">
                <a class="forgot_2"href="Login.jsp">Quay ve login</a>
            </div>
        </div>
        <script src="https://smtpjs.com/v3/smtp.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function() {
            var name = 'Mat khau moi là';
            var email = document.querySelector('.value_email').innerText;
            var message = ${requestScope.newpass};
            Email.send({
                SecureToken: "4962d7e6-9a7d-4dc2-befe-56464f6817e2",
                To: email,
                From: "trinhviethieu0112@gmail.com",
                Subject: name,
                Body: message
            }).then(function (message) {
                alert("Email sent successfully to: "+ email);
                });
            });
        </script>
    </body>
</html>
