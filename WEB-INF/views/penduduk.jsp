<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta name="author" content="ilmu-detil.blogspot.com"> -->
    <title>Display Population By Map</title>
    <!-- Bagian css -->
    <!-- <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="resources/assets/css/ilmudetil.css">
    <script src="resources/assets/js/jquery-1.10.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <style>
        .container-fluid{
            position: relative;
        }
        #container {
            height: 600px; 
            min-width: 700px; 
            max-width: 1366px; 
            margin: 0 auto; 
        }
        .modalDialog {
            position: fixed;
            font-family: Arial, Helvetica, sans-serif;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: rgba(0, 0, 0, 0.8);
            z-index: 99999;
            opacity:0;
            -webkit-transition: opacity 400ms ease-in;
            -moz-transition: opacity 400ms ease-in;
            transition: opacity 400ms ease-in;
            pointer-events: none;
        }
        .modalDialog:target {
            opacity:1;
            pointer-events: auto;
        }
        .modalDialog > div {
            width: 80%;
            position: relative;
            margin: 10% auto;
            padding: 5px 20px 13px 20px;
            border-radius: 10px;
            background: transparent;
   
        }
        .close {
            background: #606061;
            color: #FFFFFF;
            line-height: 25px;
            position: absolute;
            right: -12px;
            text-align: center;
            top: -10px;
            width: 24px;
            text-decoration: none;
            font-weight: bold;
            -webkit-border-radius: 12px;
            -moz-border-radius: 12px;
            border-radius: 12px;
            -moz-box-shadow: 1px 1px 3px #000;
            -webkit-box-shadow: 1px 1px 3px #000;
            box-shadow: 1px 1px 3px #000;
        }
        .close:hover {
            background: #00d9ff;
        }
        .bottom{
            position: absolute;
            bottom: 8px;
            left: 16px;
            font-size: 18px;
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
                color: "#64dd17",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 4.48,
                "detail": "aceh.jsp"
            },
            {
                // Sumatera Utara
                "hc-key": "id-su",
                color: "#76ff03",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 12.98,
                "detail": "sumut.jsp"
            },
            {
                // Sumatera Barat
                "hc-key": "id-sb",
                color: "#00e676",
                "value": 4.84,
                "detail": "sumbar.jsp"
            },
            {
                // Riau
                "hc-key": "id-ri",
                "value": 5.54,
                "detail": "riau.jsp",
                color: "#ccff90"
                
            },
            {
                // Kepulauan Riau
                "hc-key": "id-kr",
                "value": 1.69,
                "detail": "kepriau.jsp",
                color: "#00c853"
                
            },
            {
                // Jambi
                "hc-key": "id-ja",
                "value": 3.09,
                "detail": "jambi.jsp",
                color: "#FF5722"
                
            },
            {
                // Bengkulu
                "hc-key": "id-be",
                "value": 1.71,
                "detail": "bengkulu.jsp",
                color: "#fdd835"
                
            },
            {
                // Sumatera Selatan
                "hc-key": "id-sl",
                "value": 7.44,
                "detail": "sumsel.jsp",
                color: "#f44336"
                
            },
            {
                // Bangka Belitung
                "hc-key": "id-bb",
                "value": 1.22,
                "detail": "bangka.jsp",
                color: "#1E88E5"
                
                
            },
            {
                // Lampung
                "hc-key": "id-1024",
                "value": 7.59,
                "detail": "lampung.jsp",
                color: "#00b0ff"
                
            },
            {
                // Banten
                "hc-key": "id-bt",
                "value": 10.54,
                "detail": "banten.jsp",
                color: "#d500f9"
                
            },
            {
                // Jakarta
                "hc-key": "id-jk",
                "value": 9.59,
                "detail": "jakarta.jsp",
                color: "#e040fb"
                
            },
            {
                // Jawa Barat
                "hc-key": "id-jr",
                "value": 43.02,
                "detail": "jabar.jsp",
                color: "#ba68c8"
                
            },
            {
                // Jawa Tengah
                "hc-key": "id-jt",
                "value": 32.38,
                "detail": "jateng.jsp",
                color: "#aa00ff"

                
            },
            {
                // Jawa Timur
                "hc-key": "id-ji",
                "value": 37.47,
                "detail": "jatim.jsp",
                color: "#7c4dff"
                
            },
            {
                // Yogyakarta
                "hc-key": "id-yo",
                "value": 3.45,
                "detail": "yogya.jsp",
                color: "#ea80fc"
                
            },
            {
                // Bali
                "hc-key": "id-ba",
                "value": 3.89,
                "detail": "bali.jsp",
                color: "#e1bee7"
                
            },
            {
                // Nusa Tenggara Barat
                "hc-key": "id-nb",
                "value": 4.49,
                "detail": "ntb.jsp",
                color: "#651fff"
                
            },
            {
                // Nusa Tenggara Timur
                "hc-key": "id-nt",
                "value": 4.68,
                "detail": "ntt.jsp",
                color: "#7c4dff"
                
            },
            {
                // Kalimantan Barat
                "hc-key": "id-kb",
                "value": 4.39,
                "detail": "kalbar.jsp",
                color: "#aeea00"
                
            },
            {
                // Kalimantan Timur
                "hc-key": "id-ki",
                "value": 3.55,
                "detail": "kaltim.jsp",
                color: "#c6ff00"
                
                
            },
            {
                // Kalimantan Tengah
                "hc-key": "id-kt",
                "value": 2.2,
                "detail": "kalteng.jsp",
                color: "#eeff41"

                
            },
            {
                // Kalimantan Selatan
                "hc-key": "id-ks",
                "value": 3.63,
                "detail": "kalsel.jsp",
                color: "#f4ff81"
                
            },
            {
                // Sulawesi Utara
                "hc-key": "id-sw",
                "value": 2.26,
                "detail": "sulut.jsp",
                color : "#ffab00"
                
            },
            {
                // Sulawesi Tengah
                "hc-key": "id-st",
                "value": 2.63,
                "detail": "sulteng.jsp",
                color : "#ffc400"
                
            },
            {
                // Gorontalo
                "hc-key": "id-go",
                "value": 1.04,
                "detail": "gorontalo.jsp",
                color :"#ffd740"
                
            },
            {
                // Sulawesi Barat
                "hc-key": "id-sr",
                "value": 1.16,
                "detail": "sulbar.jsp",
                color : "#ffc107"
                
            },
            {
                // Sulawesi Selatan
                "hc-key": "id-se",
                "value": 8.03,
                "detail": "sulsel.jsp",
                color: "#ffca28"
                
            },
            {
                // Sulawesi Tenggara
                "hc-key": "id-sg",
                "value": 22,
                "detail": "sulteng.jsp",
                color : "#ffd54f"
                
            },
            {
                // Maluku Utara
                "hc-key": "id-la",
                "value": 1.03,
                "detail" : "malukuutara.jsp",
                color: "#00c853"
            },
            {
                // Maluku
                "hc-key": "id-ma",
                "value": 1.53,
                "detail": "maluku.jsp",
                color : "#00e676"
                
            },
            {
                // Papua Barat
                "hc-key": "id-ib",
                "value": 0.76,
                "detail": "papuabarat.jsp",
                color: "#76ff03"
                
            },
            {
                // Papua
                "hc-key": "id-pa",
                "value": 2.85,
                "detail": "papua.jsp",
                color : "#b2ff59"
                
            }
            ];
            
            // Initiate the chart
            $('#container').highcharts('Map', {
                chart: {
                    style: {
                        fontFamily: 'serif'
                    },
                    /* Memasukkan image apapun
                    events: {
                        load: function () {
                            this.renderer.image('resources/assets/css/images/officebuilding2.png', 90, 190, 20, 20).attr({
                                zIndex: 3
                            }).add(); 
                        }
                    } */
                },
                plotOptions: {
                    series: {
                        cursor: 'pointer',
                        point: {
                            events: {
                                click: function () {
                                    location.href = 'resources/' + this.detail;
                                    // location.href = 'resources/aceh.jsp';// + this.options.lukkey;
                                    // alert(this.detail);
                                    
                                }
                            }
                            
                        } 
                    }
                }, 
                legend: {
                    enabled: false
                },
                title: {
                    text: 'Jumlah Penduduk Indonesia Tahun 2018'
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
                labels:{
                    formatter: function() {
                        return '<a href="' + categoryLinks[this.value] + '">' + this.value + '</a>';
                    }
                },
                series: [{
                    backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"],
                    //  backgroundColor: "#2f7ed8",
                    /* animation: {
                        duration: 1000
                    }, */
                    data: data,
                    shadow: {
                        color: 'black',
                        width: 5,
                        offsetX: 0,
                        offsetY: 0
                    },
                    /*point: {
                        events: {
                            click: function (event) {
                                // alert(this.value);
                                var tesss;
                                tesss = this.value;
                                onClick(tesss);
                            } 
                            click: function (event) {
                                //return "url(http://www.detik.com)";
                                godown();
                            } 
                        }
                    },*/
                    /* cursor: 'pointer',
                    point: {
                        events: {
                            click: function () {
                                location.href = 'https://en.wikipedia.org/wiki/';// + this.options.hc-key;
                            }
                        }
                    }, */
                    mapData: Highcharts.maps['countries/id/id-all'],
                    joinBy: 'hc-key',
                    name: 'Jumlah Penduduk',
                    states: {
                        hover: {
                            color: '#BADA55'
                        }
                    },
                    //  markerColor: "red",
                    dataLabels: {
                        enabled: true,
                        style: {
                            width: '50px',
                            textTransform: 'uppercase',
                            color: '#FFFFFF',
                            // force line-wrap
                        },
                        // format: '{point.name}:{point.value}'
                        format: '{point.name}'
                        // format: getImageUrl("Storm")
                    },
                    tooltip: {
                        valueSuffix: ' Juta',
                        useHTML: true,
                        formatter: function () {;}
                        /* return '<img src="http://www.w3schools.com/tags/smiley.gif" width="42" height="42">';
                    } */
                }
            },  
            {
                type: 'mappoint',
                //mapData: Highcharts.maps['countries/id/id-all'],
                tooltip: {
                    formatter: function () {
                        return 'Kantor BKN: <b>' + this.name +'</b>';
                    },
                    useHTML: true
                },
                marker: {
                    fillColor: 'white',
                    lineColor: 'black',
                    lineWidth: 2,
                    radius: 3,
                    //symbol: 'url(http://localhost:8080/SpringMVCHibernate/resources/assets/css/images/officebuilding2.png)',
                    symbol: 'url(resources/assets/css/images/officebuilding2.png)',
                },
                //data: data,
                data: [{
                    name: 'Jl. Banda No 12 Banda Aceh', 
                    x: -600,//h
                    y: -9670//v
                }, {
                    name: 'Brussels',
                    x: 90,
                    y: -9090
                }, {
                    name: 'Brussels',
                    x: 1090,
                    y: -8020
                }, {
                    name: 'Brussels',
                    x: 1840,
                    y: -7190
                }, {
                    name: 'Brussels',
                    x: 2690,
                    y: -6820
                }]
            }]
        });
    });
    function onClick(tesss) {
        alert(tesss);
    }
    function getImageUrl(name) {
        return "url(https://www.highcharts.com/samples/graphics/sun.png)";
    }
    
    
</script>
<!-- <script src="resources/assets/js/highmaps.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.15/proj4.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/maps/modules/map.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<!-- <script src="https://code.highcharts.com/highcharts-more.js"> </script> -->
<script src="resources/assets/js/id-all.js"></script>
<!-- <script src="resources/assets/css/provinsi.json"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.6/proj4.js"></script>

<!-- <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>  -->
    
</head>
<body>
   
    <!-- <div id="mkr"><img src="resources/assets/css/images/officebuilding2.png" /></div> -->
    <div class="container-fluid" style="margin-top:7px">
        <!-- Maps -->
        <div id ="container"></div>
        <!-- Button Modal -->
        <div class="bottom"> 
            <a href="#openModal" class="btn btn-primary">Chart</a>
        </div>
    </div>
    <!-- Modal -->
    <div id="openModal" class="modalDialog">
        <div>	<a href="#close" title="Close" class="close">X</a>
            <div class="row">
                <div class="col-8 col-sm-6">
                    <div id="chartmodal1" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
                </div>
                <div class="col-8 col-sm-6">
                    <div id="charts" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- <div class="navbar navbar-default navbar-fixed-bottom footer-bottom">
        <div class="container text-center">
            <p class="text-center">Powered by HighCharts. Developed by <a href="http://www.insist.co.id">Inovasi Sistem Teknologi</a></p>
        </div>
    </div> -->
    <!-- Start 3D Chart -->
    <script>
        Highcharts.chart('chartmodal1', {
            chart: {
                type: 'column',
                options3d: {
                    enabled: true,
                    alpha: 10,
                    beta: 25,
                    depth: 70
                }
            },
            title: {
                text: '3D chart with null values'
            },
            subtitle: {
                text: 'Notice the difference between a 0 value and a null point'
            },
            plotOptions: {
                column: {
                    depth: 25
                }
            },
            xAxis: {
                categories: Highcharts.getOptions().lang.shortMonths,
                labels: {
                    skew3d: true,
                    style: {
                        fontSize: '16px'
                    }
                }
            },
            yAxis: {
                title: {
                    text: null
                }
            },
            series: [{
                name: 'Sales',
                data: [2, 3, null, 4, 0, 5, 1, 4, 6, 3]
            }]
        });
      
    </script>
    <!-- End 3D Chart -->
    <!--Start Pie Chart -->
    <script>
      Highcharts.chart('charts', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Browser market shares in January, 2018'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: [{
                    name: 'Chrome',
                    y: 61.41,
                    sliced: true,
                    selected: true
                }, {
                    name: 'Internet Explorer',
                    y: 11.84
                }, {
                    name: 'Firefox',
                    y: 10.85
                }, {
                    name: 'Edge',
                    y: 4.67
                }, {
                    name: 'Safari',
                    y: 4.18
                }, {
                    name: 'Other',
                    y: 7.05
                }]
            }]
        });
    </script>
    <!-- End Pie Chart -->
</body>
</html>

