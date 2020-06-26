<%--
  Created by IntelliJ IDEA.
  User: Rivindu Chamath
  Date: 21-May-20
  Time: 2:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Hotel Management </title>
    <link rel="icon" type="image/png" href="../../images/icons/gdfgd.png"/>
    <!-- Bootstrap -->
    <link href="../../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../../build/css/custom.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
    <%
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String date = sdf.format(new Date());
    %>
    <style>
        .large-btn {
            height: 90px;
            width: 100%;
            font-family: "Playfair Display", Georgia, "Times New Roman", serif;
            font-weight: bolder;
            font-size: 27px;
        }

        .large-btn:hover {
            color: #0f0f0f;
        }
    </style>
</head>

<body class="nav-md" style="cursor: pointer">
<div class="container body">
    <div class="main_container">


        <!-- Side header -->
        <jsp:include page="sideHeader.jsp" />
        <!-- /Side header -->

        <!-- Top header -->
        <jsp:include page="topHeader.jsp" />
        <!-- /Top header -->

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>System Manage
                            <small>Welcome To Hotel Hareesha</small>
                        </h3>
                    </div>

                    <div class="title_right">
                        <script>

                            function formatTime() {
                                now = new Date();
                                hour = now.getHours();
                                min = now.getMinutes();
                                sec = now.getSeconds();

                                if (document.clock.sivamtime[0].checked) {
                                    if (min <= 9) {
                                        min = "0" + min;
                                    }
                                    if (sec <= 9) {
                                        sec = "0" + sec;
                                    }
                                    if (hour > 12) {
                                        hour = hour - 12;
                                        add = " p.m.";
                                    } else {
                                        hour = hour;
                                        add = " a.m.";
                                    }
                                    if (hour == 12) {
                                        add = " p.m.";
                                    }
                                    if (hour == 0) {
                                        hour = "12";
                                    }

                                    document.clock.sivam.value = ((hour <= 9) ? "0" + hour : hour) + ":" + min + ":" + sec + add;
                                }

                                if (document.clock.sivamtime[1].checked) {
                                    if (min <= 9) {
                                        min = "0" + min;
                                    }
                                    if (sec <= 9) {
                                        sec = "0" + sec;
                                    }
                                    if (hour < 10) {
                                        hour = "0" + hour;
                                    }
                                    document.clock.sivam.value = hour + ':' + min + ':' + sec;
                                }

                                setTimeout("formatTime()", 1000);
                            }

                            window.onload = formatTime;

                        </script>
                        <form name="clock" style="float: right">
                            <table class="clock" width="135">
                                <tr>
                                    <td class="clock2">
                                    </td>
                                </tr>
                                <tr>
                                    <h6 style="color:#73879C; float:right;border: none;background-color: #f6f6f6">
                                        <input style="color:#73879C; float:right;border: none;background-color: #f6f6f6"
                                               class="clock2" type="text" name="sivam" size="12"><br>
                                        <p><%=date%>
                                        </p>
                                    </h6>

                                </tr>
                                <tr>
                                    <td>
                                        <label class="clock3" for="1"><input type="radio" style="display: none" id="1"
                                                                             name="sivamtime" checked></label><br>
                                        <label class="clock3" for="2"><input type="radio" style="display: none" id="2"
                                                                             name="sivamtime"></label>
                                    </td>
                                </tr>
                            </table>

                        </form>
                    </div>
                </div>
                <%--///////////////////////////////////////////////////////////////////////////////////////////////////////////--%>
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">


                    <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3">
                        <a href="barStock">
                            <button type="button" class="large-btn btn btn-primary">User Manage</button>
                        </a>
                    </div>

                    <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3">
                        <button type="button" class="large-btn btn btn-info">HR Manage</button>
                    </div>

                    <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3">
                        <button type="button" class="large-btn btn btn-success">Food & Beverage</button>
                    </div>
                    <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3">
                        <button type="button" class="large-btn btn btn-success">Banquet Manage</button>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <button type="button" class="large-btn btn btn-info">House Keeping</button>
                    </div>

                    <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <button type="button" class="large-btn btn btn-success">Daily Activity Report</button>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <button type="button" class="large-btn btn btn-success">Monthly Activity Report</button>
                    </div>
                </div>


                <%--///////////////////////////////////////////////////////////////////////////////////////////////////////////--%>

                <%--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Chart Income %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--%>
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">

                    <div class="container">
                        <canvas id="myChart"></canvas>
                    </div>

                    <script>
                        let myChart = document.getElementById('myChart').getContext('2d');

                        // Global Options
                        Chart.defaults.global.defaultFontFamily = 'Lato';
                        Chart.defaults.global.defaultFontSize = 18;
                        Chart.defaults.global.defaultFontColor = '#4A2D27';

                        let massPopChart = new Chart(myChart, {
                            type: 'pie', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
                            data: {
                                labels: ['Reservation', 'Restaurant', 'Bar', 'Banquet'],
                                datasets: [{
                                    label: 'Population',
                                    data: [
                                        2,
                                        4,
                                        6,
                                        6
                                    ],
                                    //backgroundColor:'green',
                                    backgroundColor: [
                                        'rgba(55, 99, 132, 0.6)',
                                        'rgba(54, 162, 235, 0.6)',
                                        'rgba(25, 206, 86, 0.6)',
                                        'rgba(75, 192, 192, 0.6)'
                                    ],
                                    borderWidth: 1,
                                    borderColor: '#4A2D27',
                                    hoverBorderWidth: 3,
                                    hoverBorderColor: '#000'
                                }]
                            },
                            options: {
                                title: {
                                    display: true,
                                    text: 'Today Income',
                                    fontSize: 20
                                },
                                legend: {
                                    display: false,
                                    position: 'right',
                                    labels: {
                                        fontColor: ' #ff5733 '
                                    }
                                },
                                layout: {
                                    padding: {
                                        left: 50,
                                        right: 0,
                                        bottom: 0,
                                        top: 0
                                    }
                                },
                                tooltips: {
                                    enabled: true
                                }
                            }
                        });
                    </script>


                </div>
            </div>
            <%--                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--%>


        </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
    <jsp:include page="footer.jsp" />
        <!-- /footer content -->
    </div>
</div>


<!-- jQuery -->
<script src="../../vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="../../build/js/custom.min.js"></script>

</body>
</html>