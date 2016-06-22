<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <SCRIPT type="text/javascript" src="materialize/js/jquery.js"></SCRIPT>
    <SCRIPT type="text/javascript" src="materialize/js/materialize.js"></SCRIPT>
    <SCRIPT type="text/javascript" src="materialize/js/materialize.min.js"></SCRIPT>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
    <link href="materialize/css/materialize.css" type="text/css" rel="STYLESHEET"/>
    <link href="materialize/css/materialize.min.css" type="text/css" rel="STYLESHEET"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <script>
        $(document).ready(function () {
            $('select').material_select();
        });
    </script>


</head>
<body>

<header>
    <nav style="height: 7em; background-color: #009688;">
        <div class="nav-wrapper container">
            <div class="row">
                <a href="index.jsp" class="left hide-on-small-and-down" style="margin-top: 0.5%; margin-left: 10%;">
                    <img src="images/gkLogo.png" style="height: 90px;">
                </a>
                <a href="index.jsp" class="brand-logo center" style="margin-top: 2%;">eMagazine
                </a>
                <a href="index.jsp" class="right hide-on-small-and-down" style="margin-top: 0.5%; margin-right: 10%;">
                    <img src="images/mrcLogo.png" style="height: 90px;">
                </a>
            </div>
        </div>
    </nav>
</header>

<br><br/>
<div class="container" style="width: 25em;">
    <div class="card blue-grey darken-1">
        <div class="card-content white-text">
            <center><span class="card-title">Create User</span></center>
            <p>
            <form action="userControl.jsp" method="post">
                <div class="row">
                    <div class="input-field">
                        <i class="material-icons prefix">perm_identity</i>
                        <input name="email" id="email" type="email" class="validate" required>
                        <label for="email">Email</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field">
                        <i class="material-icons prefix">vpn_key</i>
                        <input name="password" id="password" type="password" class="validate" required>
                        <label for="password">Password</label>
                    </div>
                </div>
                <div class="row">
                    <center>
                        <div class="input-field" style="width: 15em;">
                            <select name="area" required>
                                <option value="" disabled selected>Choose area</option>
                                <option value="mrc">mrc</option>
                            </select>
                        </div>
                    </center>
                </div>
                <div class="row">
                    <center>
                        <button class="btn waves-effect waves-light" type="submit" name="requestFor"
                                value="create_user">Submit
                        </button>
                    </center>
                </div>
            </form>
        </div>
        </p>

        </center>
    </div>
</div>
</div>

</body>
</html>
