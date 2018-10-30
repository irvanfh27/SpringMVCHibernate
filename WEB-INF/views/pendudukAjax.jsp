
<%-- 
    Document   : penduduk
    Created on : Jun 19, 2017, 8:33:57 PM
    Author     : radius
--%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="ilmu-detil.blogspot.com">
        <title>Display Population By Map</title>
        <!-- Bagian css -->
        <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/assets/css/ilmudetil.css">
        <script src="resources/assets/js/jquery-1.10.1.min.js"></script>
        <style>
            #container {
                height: 600px; 
                min-width: 700px; 
                max-width: 1366px; 
                margin: 0 auto; 
            }
        </style>
        <script>
            $(function () {
                var data = [
                    {
                        "hc-key": "id-3700",
                        "value": 0
                    },
                    {
                        // Aceh
                        "hc-key": "id-ac",
                        "value": 4.48
                    },
                    {
                        // Sumatera Utara
                        "hc-key": "id-su",
                        "value": 12.98
                    },
                    {
                        // Sumatera Barat
                        "hc-key": "id-sb",
                        "value": 4.84
                    },
                    {
                        // Riau
                        "hc-key": "id-ri",
                        "value": 5.54
                    },
                    {
                        // Kepulauan Riau
                        "hc-key": "id-kr",
                        "value": 1.69
                    },
                    {
                        // Jambi
                        "hc-key": "id-ja",
                        "value": 3.09
                    },
                    {
                        // Bengkulu
                        "hc-key": "id-be",
                        "value": 1.71
                    },
                    {
                        // Sumatera Selatan
                        "hc-key": "id-sl",
                        "value": 7.44
                    },
                    {
                        // Bangka Belitung
                        "hc-key": "id-bb",
                        "value": 1.22
                    },
                    {
                        // Lampung
                        "hc-key": "id-1024",
                        "value": 7.59
                    },
                    {
                        // Banten
                        "hc-key": "id-bt",
                        "value": 10.54
                    },
                    {
                        // Jakarta
                        "hc-key": "id-jk",
                        "value": 9.59
                    },
                    {
                        // Jawa Barat
                        "hc-key": "id-jr",
                        "value": 43.02
                    },
                    {
                        // Jawa Tengah
                        "hc-key": "id-jt",
                        "value": 32.38
                    },
                    {
                        // Jawa Timur
                        "hc-key": "id-ji",
                        "value": 37.47
                    },
                    {
                        // Yogyakarta
                        "hc-key": "id-yo",
                        "value": 3.45
                    },
                    {
                        // Bali
                        "hc-key": "id-ba",
                        "value": 3.89
                    },
                    {
                        // Nusa Tenggara Barat
                        "hc-key": "id-nb",
                        "value": 4.49
                    },
                    {
                        // Nusa Tenggara Timur
                        "hc-key": "id-nt",
                        "value": 4.68
                    },
                    {
                        // Kalimantan Barat
                        "hc-key": "id-kb",
                        "value": 4.39
                    },
                    {
                        // Kalimantan Timur
                        "hc-key": "id-ki",
                        "value": 3.55
                    },
                    {
                        // Kalimantan Tengah
                        "hc-key": "id-kt",
                        "value": 2.2
                    },
                    {
                        // Kalimantan Selatan
                        "hc-key": "id-ks",
                        "value": 3.63
                    },
                    {
                        // Sulawesi Utara
                        "hc-key": "id-sw",
                        "value": 2.26
                    },
                    {
                        // Sulawesi Tengah
                        "hc-key": "id-st",
                        "value": 2.63
                    },
                    {
                        // Gorontalo
                        "hc-key": "id-go",
                        "value": 1.04
                    },
                    {
                        // Sulawesi Barat
                        "hc-key": "id-sr",
                        "value": 1.16
                    },

                    {
                        // Sulawesi Selatan
                        "hc-key": "id-se",
                        "value": 8.03
                    },
                    {
                        "hc-key": "id-sg",
                        "value": 22
                    },
                    {
                        // Maluku Utara
                        "hc-key": "id-la",
                        "value": 1.03
                    },
                    {
                        // Maluku
                        "hc-key": "id-ma",
                        "value": 1.53
                    },
                    {
                        // Papua Barat
                        "hc-key": "id-ib",
                        "value": 0.76
                    },
                    {
                        // Papua Barat
                        "hc-key": "id-pa",
                        "value": 2.85
                    }
                ];

                // Initiate the chart
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
                            events: {
                                click: function (event) {
                                    onClick();
                                }
                            },
                            mapData: Highcharts.maps['countries/id/id-all'],
                            joinBy: 'hc-key',
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
            });
            
               function onClick(chart) {
    alert("tes");
    }
        </script>
        <script src="resources/assets/js/highmaps.js"></script>
        <script src="resources/assets/js/id-all.js"></script>
        <script src="resources/assets/css/provinsi.json"></script>

        <script src="resources/assets/js/exporting.js"></script>     
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">
                        Pusat Ilmu Secara Detil</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li class="clr1 active"><a href="index.jsp">Home</a></li>
                        <li class="clr2"><a href="">Programming</a></li>
                        <li class="clr3"><a href="">English</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        </br></br>
        <div class="container-fluid" style="margin-top:7px">
            <div id ="container"></div>
        </div>
        <div class="navbar navbar-default navbar-fixed-bottom footer-bottom">
            <div class="container text-center">
                <p class="text-center">Copyright &copy; 2016,  DTC. Developed by <a href="https://ilmu-detil.blogspot.com/">Pusat Ilmu</a></p>
            </div>
        </div>
    </body>
</html>

