<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 8/7/2020
  Time: 4:43 PM
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

    <link rel="icon" type="image/png" href="../../images/icons/gdfgd.png"/>
    <!-- Bootstrap -->
    <link href="../../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../../build/css/custom.min.css" rel="stylesheet">
    <%
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String date = sdf.format(new Date());
    %>

    <c:if test="${not empty loginError}">
        <script>
            window.addEventListener("load",function(){
                alert("${loginError}");
            });
        </script>
    </c:if>

    <!-- Datatables -->
    <link href="../../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">

    <style>
        .large-btn {
            height: 40px;
            width: 100%;
            font-family: "Playfair Display", Georgia, "Times New Roman", serif;
            font-weight: bolder;

        }

        .large-btn:hover {
            color: #0f0f0f;
        }

        #chartdiv {
            position: relative;
            top: 40px;
            width: 100%;
            height: 500px;
        }

        #chartdiv1 {
            position: relative;
            top: 40px;
            width: 100%;
            height: 500px;
        }
    </style>
    <style>
        .large-btn {
            height: 90px;
            width: 100%;
            font-family: "Playfair Display", Georgia, "Times New Roman", serif;
            font-weight: bolder;
            font-size: 27px;
        }

        .btnq2:hover {
            transform: scale(1.05, 1.1);
            transition: 0.8s ease;
            -webkit-transition: 0.8s ease;
            -moz-transition: 0.8s ease;
        }

        .btnq3:hover {
            transform: scale(1.3, 1.3);
            transition: 0.8s ease;
            -webkit-transition: 0.8s ease;
            -moz-transition: 0.8s ease;
        }
        #chartdiv {
            width: 100%;
            height: 500px;
        }

        #chartdiv1 {
            width: 100%;
            height: 500px;
        }

        .large-btn:hover {
            color: #cebbbb;
        }
        /*//////////////////////////////////////////////////////////////*/

        .containerx {
            display: flex;

        }

        .btnq {
            text-decoration: none;
            border: 5px solid rgb(174, 182, 203);
            position: relative;
            overflow: hidden;
            height: 90px;
            width: 100%;
            font-size: 1.5rem;
            text-align: center;
            border-radius: 5px 5px;
        }

        .btnq:before {
            content: "";
            position: absolute;
            top: 0;
            left: -00%;
            text-align: center;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                    120deg,
                    transparent,
                    rgba(135, 141, 156, 0.4),
                    transparent
            );
            transition: all .8s;
        }

        .btnq:hover:before {
            left: 100%;
        }

    </style>

</head>

<body class="nav-md" style="cursor: pointer">
<div class="container body">
    <div class="main_container">


        <!-- Side header -->
        <jsp:include page="sideHeader.jsp"/>
        <!-- /Side header -->

        <!-- Top header -->
        <jsp:include page="topHeader.jsp"/>
        <!-- /Top header -->

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="page-title">
                <div class="title_left">
                    <h3>Package Prices and Menus <br>
                    </h3>
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                        <div class="col-6 col-sm-6 col-md-6 col-lg-4 col-xl-4">
                            <a href="/banquets">
                                <button style=" border: 5px solid rgb(174, 182, 203);background-color: #45526e;
                                    color: #c6d4d3;font-weight: bolder" type="button"  class="btnq2 btn"><i class="fa fa-reply">
                                    Back</i>
                                </button>
                            </a>

                        </div>

                    </div>
                </div>

                <%--Time--%>
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
            <%--/Time--%>
            <%--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--%>


                <div class="">

                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12  ">
                            <div class="x_panel" style="height:600px;">


                                <div class="x_content">
                                    <div class="row">

                                        <div class="col-md-12">

                                            <!-- price element -->
                                            <div class="col-md-3 col-sm-6  " style="color: #000000">
                                                <div class="pricing">
                                                    <div class="title">
                                                        <h1>Bronze</h1>
                                                        <samall>A splendid package for your big day</samall>
                                                    </div>
                                                    <div class="x_content">
                                                        <div class="">
                                                            <div class="pricing_features">
                                                                <ul class="list-unstyled text-left">
                                                                    <li type="disc"><strong> WELCOME DRINK</strong></li>
                                                                    <li type="disc"><strong>SALADS</strong></li>
                                                                    <li>Egg and Onion Salad on Mirror</li>
                                                                    <li>Mix Vegetable Salad</li>
                                                                    <li type="disc"><strong>RICE & NOODLES</strong></li>
                                                                    <li>Basmathi Chicken Fried Rice</li>
                                                                    <li>Vegetable Fried Noodles</li>
                                                                    <li type="disc"><strong>MAIN DISHES</strong></li>
                                                                    <li>Chicken Curry</li>
                                                                    <li>Fish ambulthiyal</li>
                                                                    <c:forEach items="${card1}" var="e">
                                                                        <li>${e.itemName}</li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="pricing_footer" style="background-color:#00aa88;
                                    color: #000000;font-weight: bolder">
                                                            <h3>Rs. 2,750 </h3>nett per person

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!-- price element -->

                                            <!-- price element -->
                                            <div class="col-md-3 col-sm-6  " style="color: #000000">
                                                <div class="pricing">
                                                    <div class="title" >
                                                        <h1>Silver</h1>
                                                        <samall>A splendid package for your big day</samall>
                                                    </div>
                                                    <div class="x_content">
                                                        <div class="">
                                                            <div class="pricing_features">
                                                                <ul class="list-unstyled text-left">
                                                                    <li type="disc"><strong> WELCOME DRINK</strong></li>
                                                                    <li type="disc"><strong>SALADS</strong></li>
                                                                    <li>Egg and Onion Salad on Mirror</li>
                                                                    <li>Mix Vegetable Salad</li>
                                                                    <li>Potato Salad with Onion</li>
                                                                    <li type="disc"><strong>RICE & NOODLES</strong></li>
                                                                    <li>Basmathi Chicken Fried Rice</li>
                                                                    <li>Vegetable Fried Noodles</li>
                                                                    <li type="disc"><strong>MAIN DISHES</strong></li>
                                                                    <li>Chicken Curry</li>
                                                                    <li>Fish ambulthiyal</li>
                                                                    <li>Beef Chili Beef </li>
                                                                    <li>.</li>
                                                                    <li>.</li>

                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="pricing_footer" style="background-color:#00aa88;
                                    color: #000000;font-weight: bolder">
                                                            <h3>Rs. 3,250</h3>nett per person

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!-- price element -->

                                            <!-- price element -->
                                            <div class="col-md-3 col-sm-6  " style="color: #000000">
                                                <div class="pricing">
                                                    <div class="title">
                                                        <h1>Gold</h1>
                                                        <samall>A splendid package for your big day</samall>
                                                    </div>
                                                    <div class="x_content">
                                                        <div class="">
                                                            <div class="pricing_features">
                                                                <ul class="list-unstyled text-left">
                                                                    <li type="disc"><strong> WELCOME DRINK</strong></li>
                                                                    <li type="disc"><strong>SALADS</strong></li>
                                                                    <li>Egg and Onion Salad on Mirror</li>
                                                                    <li>Mix Vegetable Salad</li>
                                                                    <li>Potato Salad with Onion</li>
                                                                    <li type="disc"><strong>RICE & NOODLES</strong></li>
                                                                    <li>Basmathi Chicken Fried Rice</li>
                                                                    <li>Vegetable Fried Noodles</li>
                                                                    <li>Basmathi Seafood Fried Rice</li>
                                                                    <li type="disc"><strong>MAIN DISHES</strong></li>
                                                                    <li>Chicken Curry</li>
                                                                    <li>Fish ambulthiyal</li>
                                                                    <li>Beef Chili Beef </li>
                                                                    <li>.</li>

                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="pricing_footer" style="background-color:#00aa88;
                                    color: #000000;font-weight: bolder">
                                                            <h3>Rs. 3,750</h3>nett per person

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!-- price element -->

                                            <!-- price element -->
                                            <div class="col-md-3 col-sm-6  " style="color: #000000">
                                                <div class="pricing">
                                                    <div class="title">
                                                        <h1>Platinum</h1>
                                                        <samall>A splendid package for your big day</samall>
                                                    </div>
                                                    <div class="x_content">
                                                        <div class="">
                                                            <div class="pricing_features">
                                                                <ul class="list-unstyled text-left">
                                                                    <li type="disc"><strong> WELCOME DRINK</strong></li>
                                                                    <li type="disc"><strong>SALADS</strong></li>
                                                                    <li>Egg and Onion Salad on Mirror</li>
                                                                    <li>Mix Vegetable Salad</li>
                                                                    <li>Potato Salad with Onion</li>
                                                                    <li type="disc"><strong>RICE & NOODLES</strong></li>
                                                                    <li>Basmathi Chicken Fried Rice</li>
                                                                    <li>Vegetable Fried Noodles</li>
                                                                    <li>Basmathi Seafood Fried Rice</li>
                                                                    <li type="disc"><strong>MAIN DISHES</strong></li>
                                                                    <li>Chicken Curry</li>
                                                                    <li>Fish ambulthiyal</li>
                                                                    <li>Beef Chili Beef </li>
                                                                    <li>Pork Deviled</li>

                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="pricing_footer" style="background-color:#00aa88;
                                    color: #000000;font-weight: bolder">
                                                            <h3>Rs. 4,000</h3>nett per person

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!-- price element -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




        <%--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--%>


            </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <jsp:include page="footer.jsp"/>
        <!-- /footer content -->
    </div>
</div>


<!-- jQuery -->
<script src="../../vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Datatables -->
<script src="../../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<%--Show Print Buttons--%>
<script src="../../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="../../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="../../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="../../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="../../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="../../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<%--Responsive Table--%>
<script src="../../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<%--<script src="../../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>--%>
<%--Print--%>
<script src="../../vendors/jszip/dist/jszip.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="../../build/js/custom.min.js"></script>
<%--Pie Chart 1--%>

<script>

    var selectedRow = null;
    $("#datatable-buttons tbody").on('click', 'tr', function () {
        selectedRow = $(this);
        $("#userId").val($(this).find("td:nth-child(1)").text());
        $("#userName").val($(this).find("td:nth-child(2)").text());
        $("#position").val($(this).find("td:nth-child(3)").text());
        $("#mobileNo").val($(this).find("td:nth-child(4)").text());
        $("#pic").val($(this).find("td:nth-child(5)").text());
        $("#salary").val($(this).find("td:nth-child(6)").text());
        $("#address").val($(this).find("td:nth-child(7)").text());
        $("#email").val($(this).find("td:nth-child(8)").text());
        $("#password").val($(this).find("td:nth-child(9)").text());
        $("#gender").val($(this).find("td:nth-child(10)").text());
        $("#date").val($(this).find("td:nth-child(11)").text());
        $("#dateOfBirth").val($(this).find("td:nth-child(12)").text());
        selectedRow.addClass('row-selected');
    });
</script>

<%--/Pie Chart 2--%>
</body>
</html>

