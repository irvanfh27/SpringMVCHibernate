 <div id="myModal2" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Chart</h4>
                    </div>

                    <div class="w3-container">
                        <h2>Mobile First Responsiveness</h2>
                        <p class="w3-large">Try to resize the window!</p>
                    </div>
                    <div class="modal-body">
                        <div class="w3-row w3-border">
                            <div class="w3-container w3-half w3-red">
                                <h2>Chart.js ? Bar Chart Demo</h2>
                                <canvas id="myChart"></canvas>
                                <p id="caption">The chart is displaying apples & oranges</p>
                            </div>
                            <div class="w3-container w3-half w3-blue">
                                <h2>Chart.js ? Polar Chart Demo (apples)</h2>
                                <canvas id="myChart2"></canvas>
                                <p id="caption">The chart is displaying apples & oranges</p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-primary">close</button>
                    </div>
                </div>
            </div>		
        </div>


        <script type="text/javascript">
                $(document).ready(function () {

              $("#myModal2").modal('show');
             
            });
        </script>
        <script>
                    var ctx = document.getElementById("myChart").getContext('2d');
                    var original = Chart.defaults.global.legend.onClick;
                    Chart.defaults.global.legend.onClick = function (e, legendItem) {
                    update_caption(legendItem);
                            original.call(this, e, legendItem);
                    };
                    var myChart = new Chart(ctx, {
                    type: 'bar',
                            data: {
                            labels: ["M", "T", "W", "T", "F", "S", "S"],
                                    datasets: [{
                                    label: 'apples',
                                            backgroundColor: "rgba(153,255,51,1)",
                                            data: [12, 19, 3, 17, 28, 24, 7],
                                    }, {
                                    label: 'oranges',
                                            backgroundColor: "rgba(255,153,0,1)",
                                            data: [30, 29, 5, 5, 20, 3, 10],
                                    }]
                            }
                    });
                    var labels = {
                    "apples": true,
                            "oranges": true
                    };
                    var caption = document.getElementById("caption");
                    var update_caption = function (legend) {
                    labels[legend.text] = legend.hidden;
                            var selected = Object.keys(labels).filter(function (key) {
                    return labels[key];
                    });
                            var text = selected.length ? selected.join(" & ") : "nothing";
                            caption.innerHTML = "The chart is displaying " + text;
                    };
                    var ctx2 = document.getElementById("myChart2").getContext('2d');
                    var myChart2 = new Chart(ctx2, {
                    type: 'polarArea',
                            data: {
                            labels: ["M", "T", "W", "T", "F", "S", "S"],
                                    datasets: [{
                                    backgroundColor: [
                                            "#2ecc71",
                                            "#3498db",
                                            "#95a5a6",
                                            "#9b59b6",
                                            "#f1c40f",
                                            "#e74c3c",
                                            "#34495e"
                                    ],
                                            data: [12, 19, 3, 17, 28, 24, 7]
                                    }]
                            }
                    });

        </script>

