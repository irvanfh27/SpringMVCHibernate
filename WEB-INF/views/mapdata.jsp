<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
     


        <script src="http://maps.google.com/maps/api/js?sensor=false&language=en" type="text/javascript"></script>
        
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">
      </script>
      <script src = "https://code.highcharts.com/highcharts.js">
      </script>    
      <script src = "https://code.highcharts.com/modules/treemap.js">
      </script>    
      <script src = "https://code.highcharts.com/modules/heatmap.js">
      </script>  


    </head>
    <body>
        <h2>Spring MVC + jQuery + Autocomplete example</h2>

        <div>
            <input type="text"  id="w-input-search" value="">
            <span>
                <button id="w-button-search" type="button">Search</button>
                <button id="btn1">Append text</button>
            </span>

        </div>
        <div id="map" style="width: 1200px; height: 700px" >This is a paragraph.</div>
        <style>
            img {
                height: 100px;
                float: left;
            }
        </style>
        <script>
            $(document).ready(function () {

             /*   var map;
                var icon = "http://path/to/icon.png";
                var json = "http://path/to/universities.json";
                var infowindow = new google.maps.InfoWindow();
                var uluru = {lat: 0.538659, lng: 116.419389};
                var mapProp = {
                    center: new google.maps.LatLng(0.538659, 116.419389), //LLANDRINDOD WELLS
                    zoom: 7,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                map = new google.maps.Map(document.getElementById("map"), mapProp);*/

                $('#btn1').click(function () {
                    /* var showData = $('#show-data');
                     $.getJSON("/resources/assets/css/ina.json", function (data) {
                     console.log(data);
                     var items = data.items.map(function (item) {
                     return item.key + ': ' + item.value;
                     });
                     showData.empty();
                     if (items.length) {
                     var content = '<li>' + items.join('</li><li>') + '</li>';
                     var list = $('<ul />').html(content);
                     showData.append(list);
                     }
                     });
                     showData.text('Loading the JSON file.');*/
//http://localhost:8084/SpringMVCHibernate/resources/assets/css/filename.txt
                    $.ajax({
                        type: 'Get',
                        contentType: 'application/json; charset=utf-8',
                        url: "http://localhost:8080/SpringMVCHibernate/resources/assets/css/provinsi.json",
                        //force to handle it as text
                        dataType: "json",
                        cache: false,
                        success: function (data) {
                            var json = data;
                            
                          //   alert('tes');


                            $('#container').highcharts('Map', {
                                legend: {
                                    enabled: false
                                },
                                title: {
                                    text: 'Jumlah Penduduk Indonesia Tahun 2010'
                                },
                                subtitle: {
                                    text: '(Sumber : BPS)'
                                },
                                mapNavigation: {
                                    enabled: true,
                                    buttonOptions: {
                                        verticalAlign: 'top'
                                    }
                                },
                                series: [{
                                        data: data,
                                        mapData:data,
                                        name: 'Jumlah Penduduk',
                                        states: {
                                            hover: {
                                                color: '#BADA55'
                                            }
                                        },
                                        dataLabels: {
                                            enabled: true,
                                            format: '{point.name}'
                                        },
                                        tooltip: {
                                            valueSuffix: ' Juta'
                                        }
                                    }]
                            });




                            var myObj, x2, x, x1, xi, xj;

                            //    x = "<h1>" + json.crs.type + "<br></h1>";

                            //   x += "<div>" + json.crs.properties.name + "</div>";

                         /*   for (i in json.features) {
                                // x2 =json.features[i].geometry.coordinates[0];
                                //             alert(x2);

                                for (j in json.features[i].geometry.coordinates) {
                                    x2 = json.features[i].geometry.coordinates[j][0];
                                    //  alert(x2);

                                    for (k in x2) {
                                        xi = x2[k][0];
                                        xj = x2[k][1];
                                        alert(xj);

                                        var latLng = new google.maps.LatLng(xi, xj);
                                        var marker = new google.maps.Marker({
                                            position: latLng,
                                            map: map,
                                            // icon: icon,
                                            title: json.crs.properties.name
                                        });
                                        var details = "tes";
                                        bindInfoWindow(marker, map, infowindow, details);
                                        // alert(xi);


                                    }
                                    ;
                                }
                            }*/
                            // $('#show-data').append(' < div class = "name" > ' + x + ' < />');
                            // $('#show-data').append( x );

                        },
                        error: function () {
                            alert('Error while request..');
                        }
                    });

                }

                );
                function bindInfoWindow(marker, map, infowindow, strDescription) {
                    google.maps.event.addListener(marker, 'click', function () {
                        infowindow.setContent(strDescription);
                        infowindow.open(map, marker);
                    });
                }
                google.maps.event.addDomListener(window, 'load', initialize)
            });
        </script>
<div class="container-fluid" style="margin-top:7px">
	<div id ="container"></div>
</div>
    </body>
</html>