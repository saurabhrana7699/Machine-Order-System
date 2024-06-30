
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: wheat;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #fff;
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            box-sizing: border-box;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
            text-align: left;
        }

        .form-group {
            margin-bottom: 20px;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
            margin-bottom: 10px;
        }

        #specialities {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-buttons {
            display: flex;
            justify-content: space-between;
        }

        input[type="submit"],
        input[type="button"] {
            width: 48%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background: linear-gradient(135deg, #74ebd5, #acb6e5);
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="button"] {
            background: red;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #acb6e5, #74ebd5);
        }

        input[type="button"]:hover {
           background: darkred;
        }

        .msg {
            color: white;
            margin-top: 20px;
            text-align: center;
        }
    </style>
    
</head>
<body >
    <div class="container">
        <h1>Edit User</h1>
        <form:form name="editUser" modelAttribute="user" method="POST" action="editUser.htm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <form:hidden path="userId" />
            <div class="form-group">
                <label>Name:</label>
                <form:input path="name" />
            </div>
            <div class="form-group">
                <label>Username:</label>
                <form:input path="username" readonly="true" />
            </div>
            
            <div class="form-group">
                <label>Role:</label>
                <form:select path="role" id="role" >
                    <form:options items="${roleList}" itemLabel="label" itemValue="id" ></form:options>
                        
                </form:select>
                
            </div>
             
                  <div class="form-group">
                <label>Active:</label>
                <form:radiobutton path="active" value="True" /> True
                <form:radiobutton path="active" value="False" /> False
            </div>
            
              <button type="submit" value="Submit"  >
                    <span>Submit</span>
                </button>

                <button type="button" value="Cancel"  id="redb" onclick="window.location.href = 'listUser.htm?msg=Cancelled';" >
                    <span>Cancle</span>
                </button>
        </form:form>
        <div class="msg">${msg}${param.msg}</div>
    </div>
</body>
</html>
<style>
    #redb{
        margin-left: 80px;
    }

    #redb span {
        position: absolute;
        width: 100%;
        font-size: 15px;
        font-weight: 100;
        left: 50%;
        top: 39%;
        letter-spacing: 3px;
        text-align: center;
        transform: translate(-50%,-50%);
        color: red;
        transition: all 2s ease;
    }

    #redb:hover:before {
        width: 100%;
    }

    #redb:before {
        content: '';
        position: absolute;
        width: 0;
        height: 100%;
        background-color: red;

        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        transition: all 1s ease;
    }

    #redb:hover span {
        color: white;
    }



    button {
        border: none;
        position: relative;
        width: 200px;
        height: 73px;
        padding: 0;
        z-index: 2;
        -webkit-mask: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' height='868' width='2500' viewBox='0 0 726 252.17'%3E%3Cpath d='M483.92 0S481.38 24.71 466 40.11c-11.74 11.74-24.09 12.66-40.26 15.07-9.42 1.41-29.7 3.77-34.81-.79-2.37-2.11-3-21-3.22-27.62-.21-6.92-1.36-16.52-2.82-18-.75 3.06-2.49 11.53-3.09 13.61S378.49 34.3 378 36a85.13 85.13 0 0 0-30.09 0c-.46-1.67-3.17-11.48-3.77-13.56s-2.34-10.55-3.09-13.61c-1.45 1.45-2.61 11.05-2.82 18-.21 6.67-.84 25.51-3.22 27.62-5.11 4.56-25.38 2.2-34.8.79-16.16-2.47-28.51-3.39-40.21-15.13C244.57 24.71 242 0 242 0H0s69.52 22.74 97.52 68.59c16.56 27.11 14.14 58.49 9.92 74.73C170 140 221.46 140 273 158.57c69.23 24.93 83.2 76.19 90 93.6 6.77-17.41 20.75-68.67 90-93.6 51.54-18.56 103-18.59 165.56-15.25-4.21-16.24-6.63-47.62 9.93-74.73C656.43 22.74 726 0 726 0z'/%3E%3C/svg%3E") no-repeat 50% 50%;
        mask: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' height='868' width='2500' viewBox='0 0 726 252.17'%3E%3Cpath d='M483.92 0S481.38 24.71 466 40.11c-11.74 11.74-24.09 12.66-40.26 15.07-9.42 1.41-29.7 3.77-34.81-.79-2.37-2.11-3-21-3.22-27.62-.21-6.92-1.36-16.52-2.82-18-.75 3.06-2.49 11.53-3.09 13.61S378.49 34.3 378 36a85.13 85.13 0 0 0-30.09 0c-.46-1.67-3.17-11.48-3.77-13.56s-2.34-10.55-3.09-13.61c-1.45 1.45-2.61 11.05-2.82 18-.21 6.67-.84 25.51-3.22 27.62-5.11 4.56-25.38 2.2-34.8.79-16.16-2.47-28.51-3.39-40.21-15.13C244.57 24.71 242 0 242 0H0s69.52 22.74 97.52 68.59c16.56 27.11 14.14 58.49 9.92 74.73C170 140 221.46 140 273 158.57c69.23 24.93 83.2 76.19 90 93.6 6.77-17.41 20.75-68.67 90-93.6 51.54-18.56 103-18.59 165.56-15.25-4.21-16.24-6.63-47.62 9.93-74.73C656.43 22.74 726 0 726 0z'/%3E%3C/svg%3E") no-repeat 50% 50%;
        -webkit-mask-size: 100%;
        cursor: pointer;
        background-color: transparent;
        transform: translateY(8px)
    }

    button:after {
        content: '';
        position: absolute;
        left: 0;
        right: 0;
        bottom: 0;
        box-shadow: 0px 0 0 0 white;
        transition: all 2s ease;
    }

    button:hover:after {
        box-shadow: 0px -13px 56px 12px #ffffffa6;
    }

    button span {
        position: absolute;
        width: 100%;
        font-size: 15px;
        font-weight: 100;
        left: 50%;
        top: 39%;
        letter-spacing: 3px;
        text-align: center;
        transform: translate(-50%,-50%);
        color: black;
        transition: all 2s ease;
    }

    button:hover span {
        color: white;
    }

    button:before {
        content: '';
        position: absolute;
        width: 0;
        height: 100%;
        background-color: black;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        transition: all 1s ease;
    }

    button:hover:before {
        width: 100%;
    }


</style>