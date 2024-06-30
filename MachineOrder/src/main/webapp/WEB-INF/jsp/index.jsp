<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
    <head>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: wheat;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                background-color: whitesmoke;
                padding: 20px;

                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                text-align: center;
            }

            h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }

            .user-info {
                font-size: 18px;
                color: #666;
                margin-bottom: 20px;
            }

            a {
                text-decoration: none;
                color: #007bff;
                font-weight: bold;
                margin: 0 10px;
            }



            .nav-links {
                margin-bottom: 20px;
            }

            .nav-links a {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .nav-links a:hover {
                background-color: #0056b3;
            }

            #log:hover{
                background-color:#D2122E;
            }
            #log{
                background-color: red;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <sec:authentication property="principal" var="curUser" scope="request"/>
            <h1>Welcome</h1>
            <div class="user-info">${curUser.name} - ${curUser.authorities}</div>
            <div class="nav-links">

                <sec:authorize access="hasAnyRole('ROLE_BF_MANAGE_USER')">
                    <button onclick="window.location.href = 'addUser.htm';" >
                        <span >    Add  User  </span>
                    </button>
                </sec:authorize>

                <sec:authorize access="hasAnyRole('ROLE_BF_MANAGE_USER')">
                    <button onclick="window.location.href = 'listUser.htm';" >
                        <span >    Users List  </span>
                    </button>
                </sec:authorize>

                <sec:authorize access="hasAnyRole('ROLE_BF_MANAGE_USER')">
                    <button onclick="window.location.href = 'items.htm';" >
                        <span >    Items List  </span>
                    </button>
                </sec:authorize>


                <button onclick="window.location.href = 'addOrder.htm';" >
                    <span >   Purchase Item  </span>
                </button>


                <sec:authorize access="hasAnyRole('ROLE_BF_MANAGE_USER')">
                    <button onclick="window.location.href = 'listOrder.htm';" >
                        <span >    Orders List  </span>
                    </button>
                </sec:authorize>

                <button onclick="window.location.href = 'myOrder.htm';" >
                    <span >   My Order List  </span>
                </button>

            </div>
            <div class="nav-links" onclick="window.location.href = 'logout';" >

                <button id="redb"   >
                    <span>LOGOUT</span>
                </button>

               

            </div>

        </div>

    </body>
</html>
<style>
    
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