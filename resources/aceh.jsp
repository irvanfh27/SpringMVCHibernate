
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="ilmu-detil.blogspot.com">
    <title>Display Population By Map</title>
    <!-- Bagian css -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/ilmudetil.css">
    <script src="assets/js/jquery-1.10.1.min.js"></script>
    
    <style>
        #container {
            height: 500px; 
            min-width: 310px; 
            max-width: 800px; 
            margin: 0 auto; 
        }
        .loading {
            margin-top: 10em;
            text-align: center;
            color: gray;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            grid-template-rows: 100%;
        }
        
        .item1 {
            background-color: lime;
        }
        
        .item2 {
            background-color: yellow;
            grid-column: span 2 / 7;
            
        }
        
    </style>
    <script>
        $(function () {
            var data = [
            
            
            {
                
                "KABKOTNO" : "1101",
                "KABKOT" : "SIMEULUE",
                color: "red",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            
            {
                
                "KABKOTNO" : "1102",
                "KABKOT" : "ACEH SINGKIL",
                color: "green",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            
            
            {
                
                "KABKOTNO" : "1103",
                "KABKOT" : "ACEH SELATAN",
                color: "yellow",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            
            {
                
                "KABKOTNO" : "1104",
                "KABKOT" : "ACEH TENGGARA",
                color: "blue",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            
            {
                
                "KABKOTNO" : "1105",
                "KABKOT" : "ACEH TIMUR",
                color: "grey",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1106",
                "KABKOT" : "ACEH Tengah",
                color: "pink",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            
            {
                
                "KABKOTNO" : "1107",
                "KABKOT" : "ACEH BARAT",
                color: "pink",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            //
            
            {
                
                "KABKOTNO" : "1108",
                "KABKOT" : "ACEH BESAR",
                color: "blue",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1109",
                "KABKOT" : "PIDIE",
                color: "grey",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1110",
                "KABKOT" : "BIREUEN",
                color: "blue",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1111",
                "KABKOT" : "ACEH UTARA",
                color: "pink",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1112",
                "KABKOT" : "ACEH BARAT DAYA",
                color: "green",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1113",
                "KABKOT" : "GAYO LUES",
                color: "pink",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1114",
                "KABKOT" : "ACEH TAMIANG",
                color: "red",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1115",
                "KABKOT" : "NAGAN RAYA",
                color: "red",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1116",
                "KABKOT" : "ACEH JAYA",
                color: "pink",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1117",
                "KABKOT" : "BENER MERIAH",
                color: "pink",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1118",
                "KABKOT" : "PIDIE JAYA",
                color: "red",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            
            {
                
                "KABKOTNO" : "1171",
                "KABKOT" : "BANDA ACEH",
                color: "yellow",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1172",
                "KABKOT" : "SABANG",
                color: "yellow",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1173",
                "KABKOT" : "LANGSA",
                color: "yellow",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1174",
                "KABKOT" : "LHOKSEUMAWE",
                color: "yellow",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
            },
            {
                
                "KABKOTNO" : "1175",
                "KABKOT" : "SUBULUSSALAM",
                color: "pink",
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                "value": 1.5
                          
            }
          ];            
            
            
            // Initiate the chart
            $('#container').highcharts('Map', {
                //  type: 'heatmap',
                /* chart: {
                    style: {
                        fontFamily: 'serif'
                    }
                }, */
                chart: {
                    style: {
                        fontFamily: 'serif'
                    },
                    /* events: {
                        load: function () {
                            this.renderer.image('assets/css/images/officebuilding2.png', 90, 200, 20, 20).attr({
                                zIndex: 3
                            }).add(); 
                        }
                    } */
                },
                plotOptions: {
                    series: {
                        /*marker: {
                            radius: 4,
                            lineColor: '#666666',
                            lineWidth: 2
                        }, */
                        cursor: 'pointer',
                        point: {
                            events: {
                                click: function () {
                                    // location.href = '${pageContext.request.contextPath}/penduduk';// + this.options.lukkey;
                                    alert(this.KABKOT);
                                }
                            }
                        }
                    }
                }, 
                legend: {
                    enabled: false
                },
                title: {
                    text: 'Jumlah Penduduk Aceh Tahun 2018'
                },
                subtitle: {
                    text: '(Sumber : BPS)'
                },
                mapNavigation: {
                    enabled: true,
                    buttonOptions: {
                        verticalAlign: 'bottom'
                    }
                },
                labels:{
                    formatter: function() {
                        return '<a href="' + categoryLinks[this.value] + '">' + this.value + '</a>';
                    }
                },
                
                series: [{
                    backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"],
                    animation: {
                        duration: 1000
                    },
                    data: data,
                    shadow: {
                        color: 'black',
                        width: 5,
                        offsetX: 0,
                        offsetY: 0
                    },
                    mapData: Highcharts.maps['countries/id/aceh'],
                    joinBy: 'KABKOTNO',
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
                        format: '{point.KABKOT}'
                        // format: getImageUrl("Storm")
                    },
                    tooltip: {
                        valueSuffix: ' Juta',
                        useHTML: true,
                        formatter: function () {
                            return '<img src="http://www.w3schools.com/tags/smiley.gif" width="42" height="42">';
                        }
                    }
                }, 
                {
                    // name: 'Separators',
                    //type: 'mappoint',
                    // color: 'silver',
                    // showInLegend: false,
                    data: data
                    
                }]
            });
        });
      
        function getImageUrl(name) {
            return "url(https://www.highcharts.com/samples/graphics/sun.png)";
        }
        
    </script>
    <script src="https://code.highcharts.com/maps/highmaps.js"></script>
    <script src="assets/js/provinsi/ace.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.6/proj4.js"></script>
    <script src = "https://code.highcharts.com/highcharts.js"></script>  
    <script src = "https://code.highcharts.com/highcharts-more.js"></script> 
    <script src="https://code.highcharts.com/maps/modules/exporting.js"></script>
    
</head>
<body>
    <!-- <div class="grid">
        <div class="item1"></div>
        <div class="item2">
            
        </div>
    </div> -->

    <div id ="container">
    </div>
    
    <div class="navbar navbar-default navbar-fixed-bottom footer-bottom">
        <div class="container text-center">
            <p class="text-center">Copyright &copy; 2016,  DTC. Developed by <a href="https://ilmu-detil.blogspot.com/">Pusat Ilmu</a></p>
        </div>
    </div>
</body>
</html>
