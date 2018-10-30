<%-- 
    Document   : pendudukaceh
    Created on : 2 Okt, 2018, 8:33:57 PM
    Author     : lukman
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
            #mkr {
                position: absolute;
                height: 7px;
                width: 7px;
                top: 340px; 
                left: 430px; 
                z-index: 1; 
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
                        lukkey : 'lucky',
                        color: "red",
                        states: {
                            hover: {
                                color: '#BADA55'
                            }
                        },
                        "value": 4.48
                    },
                    {
                        // Sumatera Utara
                        "hc-key": "id-su",
                        lukkey : 'lucky2',
                        color: "darkgreen",
                        states: {
                            hover: {
                                color: '#BADA55'
                            }
                        },
                        // marker: {
                        //     symbol: 'url(http://highcharts.com/demo/gfx/sun.png)'
                        // },
                        showInLegend: true,
                        markerSize: 20,
                        "value": 12.98
                    },
                    {
                        // Sumatera Barat
                        "hc-key": "id-sb",
                        //  color: "#2f7ed8",
                        image: 'url(https://www.highcharts.com/samples/graphics/sun.png)',
                        type: 'flags',
                        shape: 'circle',
                        showInLegend: false,
                        markerSize: 20,
                        "properties": {
                            "url": getImageUrl("Storm"),
                            "text": "New York"
                        },
                        /*  marker: {
                         symbol: 'url(https://www.highcharts.com/samples/graphics/sun.png)'
                         },*/
                        "value": 4.84
                    },
                    {
                        // Riau
                        "hc-key": "id-ri",
                        "url": getImageUrl("Storm"),
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
                        // marker:"url(data:image/png;base64,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 1dT1gvWd+ 1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx+ 1/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb+ 16EHTh0kX/i +c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAAVVJREFUeNpi/P37NwOxYM2pHtm7lw8uYmBgYGAiVtPC3RWh+88vuneT474Dv4DkcUZibJy8PG72le/nkn+zMzAaMhnNyY1clMpCjKbz/86lMLAzMMA0MTAwMOC1Ea6JgYFB9pPwncbMg6owOaY1p3pk15zqkcWnie8j63ddY18nZHmWI2eW3vzN/Jf168c3UfGuHathAXHl+7lkBnYGBtafDP8NVd3jQ8xKHiNrZMyeqPPtE/9vTgYGBgb1H4oHlHXt43ZfWfDwNzsDIwMDA4POX831RXGrg9BdxLhob63VgTurjsAUsv5k+A9jC3/g/NCdfVoQm/+ZIu3qjhnyW3XABJANMNL19cYVcPBQrZpq9eyFwCdJmIT6D8UD5cmbHXFphKccI9Mgc84vTH9goYhPE4rGELOSx0bSjsUMDAwMunJ2FQST0+/fv1Hw5BWJbehi2DBgAHTKsWmiz+rJAAAAAElFTkSuQmCC)",
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
                        marker: {
                            symbol: 'diamond'
                        },
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
                
                /*   $.each(data, function () {
                 this.code = this.code.toUpperCase();
                 });*/


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
                        events: {
                            load: function () {
                                this.renderer.image('resources/assets/css/images/officebuilding2.png', 90, 200, 20, 20).attr({
                            zIndex: 3
                        }).add(); 
                            }
                        }
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
                                        location.href = '${pageContext.request.contextPath}/penduduk';// + this.options.lukkey;
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
                            mapData: Highcharts.maps['countries/id/aceh'],
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
                                formatter: function () {
                                    return '<img src="http://www.w3schools.com/tags/smiley.gif" width="42" height="42">';
                                }
                            }
                        }, {
                            // type: 'marker',   
                            mapData: Highcharts.maps['countries/id/aceh'],
                            data: data,
                            type: 'mappoint',
                            elementType: "image",
                            dataField: "url",
                            size: 51,
                            label: {
                                dataField: "text",
                                font: {
                                    size: 14
                                }
                            },
                        }, {
                            type: 'mappoint',
                            mapData: Highcharts.maps['countries/id/aceh'],
                            marker: {
                                symbol: 'url(http://highcharts.com/demo/gfx/sun.png)'
                            },
                            name: 'Cities',
                            color: Highcharts.getOptions().colors[1],
                            data: data,
                            /* data: [{
                             name: 'London',
                             lat: -0.7399397,
                             lon: 100.8000051
                             }, {
                             name: 'Birmingham',
                             lat: 52.483056,
                             lon: -1.893611
                             }, {
                             name: 'Leeds',
                             lat: 53.799722,
                             lon: -1.549167
                             }, {
                             name: 'Glasgow',
                             lat: 55.858,
                             lon: -4.259
                             }, {
                             name: 'Sheffield',
                             lat: 53.383611,
                             lon: -1.466944
                             }, {
                             name: 'Liverpool',
                             lat: 53.4,
                             lon: -3
                             }, {
                             name: 'Bristol',
                             lat: 51.45,
                             lon: -2.583333
                             }, {
                             name: 'Belfast',
                             lat: 54.597,
                             lon: -5.93
                             }, {
                             name: 'Lerwick',
                             lat: 60.155,
                             lon: -1.145,
                             dataLabels: {
                             align: 'left',
                             x: 5,
                             verticalAlign: 'middle'
                             }
                             }]*/
                        }]
                });
            });
            function onClick(tesss) {
                alert(tesss);
            }
            function getImageUrl(name) {
                return "url(https://www.highcharts.com/samples/graphics/sun.png)";
            }
            ;
        </script>
        <script src="resources/assets/js/highmaps.js"></script>
        <script src="resources/assets/js/aceh.js"></script>
        <script src="resources/assets/css/aceh.json"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.6/proj4.js"></script>
        <script src = "https://code.highcharts.com/highcharts.js"></script>  
        <script src = "https://code.highcharts.com/highcharts-more.js"></script> 
        <!-- <script src="resources/assets/js/exporting.js"></script>      -->

    </head>
    <body>
        <!-- <nav class="navbar navbar-default navbar-fixed-top">
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
        </br></br> -->
        
        <!-- <div id="mkr"><img src="resources/assets/css/images/officebuilding2.png" /></div> -->
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

