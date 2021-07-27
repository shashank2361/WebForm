<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm11.aspx.cs" Trace="false" Inherits="Webforms.WebForm11" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/Chart.js"></script>
    <script src="Scripts/Common.js"></script>
    <script>




        $.ajax({
            url: "BarChart.asmx/BarChartData",
            //data: "{ 'searchItem':  ' }",
            type: "Post",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function (data) {
                console.log(data.d)
                var c = document.getElementById("barChart");
                var ctx = c.getContext("2d");

                tData = data.d;
                var myBarChart = new Chart(ctx, {
                    type: 'horizontalBar',
                    data: tData,
                    options: {
        scales: {
            xAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
                });

            },
            error: function (result) {
                alert('There is a problem processing your request');
            }
        });



        $.ajax({
            url: "BarChart.asmx/MultiBarChartData",
            //data: "{ 'searchItem':  ' }",
            type: "Post",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function (data) {
              var c = document.getElementById("barMultibarChart");
        var ctx = c.getContext("2d");

                tData = data.d;
                var myBarChart = new Chart(ctx, {
                    type: 'bar',
                    data: tData
                });

            },
            error: function (result) {
                alert('There is a problem processing your request');
            }
        });






        $.ajax({
            url: "BarChart.asmx/BarChartData",
            //data: "{ 'searchItem':  ' }",
            type: "Post",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
                    success: function (res) {

                        var response = res.d;

                        console.log(response)
                        console.log(response.labels)
                        console.log(response.datasets[0].data)
                        var xaxis = [];
                        var yaxis = [];
                        var dataPoints = [];


                        xaxis = response.labels;
                        yaxis = response.datasets[0].data;

                        for (var i = 0; i < response.labels.length; i++) {
                                dataPoints.push({ label: response.labels[i], y: response.datasets[0].data[i]  });
                        }



                var data = {
                            datasets: [{
                            data: yaxis,
                            linearGradient: [209, 4, 4, 0.90],
                            backgroundColor: ["rgba(21, 35, 33, 0.12)", "#F7464A", "#46BFBD", "#FDB45C" , "#F7465A" , "#FDA45C" , "#FEA45C" , "#FFA45C"]
                            }],
                        labels: xaxis,
                        };


                console.log(data)

                var canvas =   document.getElementById("doughtChart");
                var ctx = canvas.getContext("2d");
                        Chart.defaults.global.responsive = true;
                   

                var myNewChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: data,
                    options: { maintainAspectRatio: false }

                });




            },
            error: function (result) {
                alert('There is a problem processing your request');
            }
                });






    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-lg-12">


            <div class="col-lg-8">
                <div class="row">
                    <div class="form-group">
                        <label>Bar Chart</label>
                        <canvas id="barChart" width="400" height="150"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-lg-8">
                <div class="row">
                    <div class="form-group">
                        <label>Multi Bar Chart</label>
                        <canvas id="barMultibarChart" width="400" height="150"></canvas>
                    </div>
                </div>
            </div>


            <div class="col-lg-8">
                <div class="row">
                    <div class="form-group">
                        <label>Donut Chart</label>
                        <canvas id="doughtChart" width="40 " height="150"></canvas>
                    </div>
                </div>
            </div>




        </div>
    </form>
</body>
</html>
