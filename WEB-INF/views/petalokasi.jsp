<%-- 
    Document   : petalokasi
    Created on : Jan 15, 2017, 8:15:27 PM
    Author     : radius
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            #map {
                height: 500px;
                width: 100%;
            }

            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                padding-left: 10px;
                margin-left: 120px;

                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color:lightblue; /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                position: relative;
                background-color: lightblue;
                margin: auto;
                padding: 0;
                border: 1px solid #888;
                width: 70%;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: animatetop;
                -webkit-animation-duration: 0.4s;
                animation-name: animatetop;
                animation-duration: 0.4s
            } 
            @-webkit-keyframes animatetop {
                from {top:-300px; opacity:0} 
                to {top:0; opacity:1}
            }

            @keyframes animatetop {
                from {top:-300px; opacity:0}
                to {top:0; opacity:1}
            }

            /* The Close Button */
            .close {
                color: white;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .modal-header {
                padding: 2px 10px;
                background-color: #5cb85c;
                color: white;
            }

            .modal-body {padding: 2px 16px;}

            .modal-footer {
                padding: 2px 16px;
                background-color: #5cb85c;
                color: white;
            }

        </style>
    </head>
    <body>
        <p id="modal2">Double-click me.</p>

        <div id="map"></div>
        <script>
            var modal = document.getElementById('myModal2');
            var locations = [
                [
                    "Kanreg VIII",
                    -6.2115440,
                    106.8451720,
                    1,
                    "BanjarMasin",
                    "",
                    "Kantor Regional BanjarMasin.",
                    "Propinsi Kalimantan Selatan"
                ],
                [
                    "kanreg IV",
                    -3.6687994,
                    119.9740534,
                    2,
                    "Makasar",
                    "Ujung Pandang",
                    "Kantor Regional Makasar",
                    "Propinsi Sulawesi Selatan"
                ],
                [
                    "Kanreg VI",
                    2.1153547,
                    99.5450974,
                    3,
                    "Medan",
                    "",
                    "Kantor Regional Medan.",
                    "Propins Sumatra Utara"
                ],
                [
                    "Kanreg V",
                    -6.2115440,
                    106.8451720,
                    4,
                    "DKI Jakarta",
                    "Jakarta Timur",
                    "Kantor Regional DKI Jakarta.",
                    "Propinsi DKI Jakarta"
                ],
                [
                    "Kanreg II",
                    -7.1509750,
                    110.1402594,
                    5,
                    "Surabaya",
                    "Sidoarjo",
                    "Kantor Regional Surabaya",
                    "Propinsi Jawa Timur"
                ]
            ];

            function initMap() {
                var infowindow = new google.maps.InfoWindow();
                var uluru = {lat: 0.538659, lng: 116.419389};
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 5,
                    center: uluru
                });

                for (i = 0; i < locations.length; i++) {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                        map: map
                    });

                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                        return function () {
                            infowindow.setContent(locations[i][0], locations[i][6]);
                            infowindow.open(map, marker);
                        }
                    })(marker, i));

                    google.maps.event.addListener(marker, 'dblclick', (function (marker, i) {
                        return function myFunction() {
                            document.getElementById("demo").innerHTML = "I was double-clicked!";
                        }
                    })(marker, i));


                }
            }
            ;
        </script>
       <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=initMap">
        </script>
      
    </body>
</html>
