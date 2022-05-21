function pieChart(chartTitle, chartData){
		 google.charts.load('current', {'packages':['corechart']});
	      google.charts.setOnLoadCallback(drawChart);

	      function drawChart() {

	        var data = google.visualization.arrayToDataTable(chartData);

	        var options = {
	          title: chartTitle
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('chart'));

	        chart.draw(data, options);
	      }
	}

	  function lineChart(chartTitle, chartData) {
	      google.charts.load('current', {'packages':['line']});
	       google.charts.setOnLoadCallback(drawChart);

	       function drawChart() {
	          var data = google.visualization.arrayToDataTable(chartData);
	            var options = {
	              chart: {
	                title: chartTitle,
	              }
	            };
	            var chart = new google.charts.Line(document.getElementById('chart'));
	            chart.draw(data, google.charts.Line.convertOptions(options));
	      }
	   }
	  
	  function lineChart1(chartTitle, chartData) {
	      google.charts.load('current', {'packages':['line']});
	       google.charts.setOnLoadCallback(drawChart);

	       function drawChart() {
	          var data = google.visualization.arrayToDataTable(chartData);
	            var options = {
	              chart: {
	                title: chartTitle,
	              }
	            };
	            var chart = new google.charts.Line(document.getElementById('chart1'));
	            chart.draw(data, google.charts.Line.convertOptions(options));
	      }
	   }


	function barChart(chartTitle, chartData){
		google.charts.load('current', {
			'packages' : [ 'bar' ]
		});
		google.charts.setOnLoadCallback(drawChart);
	
		function drawChart() {
			var data = google.visualization.arrayToDataTable(chartData);
	
			var options = {
				chart : {
					title : chartTitle,
				},
				bars : 'vartical' // Required for Material Bar Charts.
			};
	
			var chart = new google.charts.Bar(document
					.getElementById('chart'));
	
			chart.draw(data, google.charts.Bar.convertOptions(options));
		}
	}