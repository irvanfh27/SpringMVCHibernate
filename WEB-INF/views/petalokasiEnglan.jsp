
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="<c:url value="/resources/core/bootstrap.min.js" />"></script>

        <script 
            src="http://maps.google.com/maps/api/js?sensor=false">
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="map" style="border: 2px solid #3872ac;"></div>

        <div id="gambar" onclick="point_it(event)" style = "background:url('http://bimosaurus.com/wp-content/uploads/2013/03/petadiy.jpeg') no-repeat; float:left;">
            <!--POINTER-->
            <div id="titik" style="font-size:11px;padding:5px;color:#f30;width:80px;font-family:arial;height:15px;background:#000;position:relative;visibility:hidden;z-index:2;"></div>
            <!--End of pointer-->
        </div>
        <!--Gambar End-->   


        <div style="float:left;">
            <form method="post" action="" id="submitform">
                Kabupaten: <input type="text" id="kabupaten" name="kabupaten"><br />
                <div id="thecord" style="max-width:300px;  font-size:9px; font-family:courier;  word-wrap: break-word;">Koordinat<textarea id="koordinat" name="koordinat"></textarea></div>
                <input type="submit" id="submit_it" value="Submit" name="submit_it">
            </form>
        </div>

        <div style="clear:both;"></div>
        <!--menyediakan tempat data-->>
        <div id="container">

            <div id="list"></div>
            <div style="clear:both;"></div>
        </div>

        <script>
            $("#submit_it").click(function (anu) {
                anu.preventDefault();//biar nggak ngereload

                var point = $("#koordinat").val();
                point = point.substr(1);
                var kabupaten = $("#kabupaten").val();
                if (kabupaten != '') {
                    $("<div id='list'><div class='kab'>" + kabupaten + "</div><div class='koordplace'>: " + point + "</div></div>").insertBefore('#list').hide().fadeIn(1000);
                } else {
                    alert('masukkan nama kabupaten');
                }

                $("form#submitform")[0].reset();
            });
        </script>

        <script>
            /*         var map;
             var icon = "http://path/to/icon.png";
             var json = "http://path/to/universities.json";
             var infowindow = new google.maps.InfoWindow();
             function initialize() {
             
             var mapProp = {
             center: new google.maps.LatLng(52.4550, -3.3833), //LLANDRINDOD WELLS
             zoom: 7,
             mapTypeId: google.maps.MapTypeId.ROADMAP
             };
             
             map = new google.maps.Map(document.getElementById("map"), mapProp);
             
             //  $.getJSON(json, function(json1) {
             var json1 = {
             "universities": [
             {
             "title": "Aberystwyth University",
             "website": "www.aber.ac.uk",
             "phone": "+44 (0)1970 623 111",
             "lat": 52.415524,
             "lng": -4.063066},
             {
             "title": "Bangor University",
             "website": "www.bangor.ac.uk",
             "phone": "+44 (0)1248 351 151",
             "lat": 53.229520,
             "lng": -4.129987},
             {
             "title": "Cardiff Metropolitan University",
             "website": "www.cardiffmet.ac.uk",
             "phone": "+44 (0)2920 416 138",
             "lat": 51.482708,
             "lng": -3.165881}
             ]
             };
             $.each(json1.universities, function (key, data) {
             
             var latLng = new google.maps.LatLng(data.lat, data.lng);
             
             var marker = new google.maps.Marker({
             position: latLng,
             map: map,
             // icon: icon,
             title: data.title
             });
             
             var details = data.website + ", " + data.phone + ".";
             
             bindInfoWindow(marker, map, infowindow, details);
             
             //    });
             
             });
             
             }
             
             function bindInfoWindow(marker, map, infowindow, strDescription) {
             google.maps.event.addListener(marker, 'click', function () {
             infowindow.setContent(strDescription);
             infowindow.open(map, marker);
             });
             }
             
             google.maps.event.addDomListener(window, 'load', initialize);*/
        </script>    

        <style>
            html, body, #gambar {
                height: 100%;
                width: 100%;
                margin: 0px;
                padding: 0px
            }
        </style>
    </body>
</html>
