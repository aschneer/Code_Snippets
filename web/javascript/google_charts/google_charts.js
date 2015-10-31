// These arrays should contain the
// dataset that will be graphed.
// X is the independent variable
// axis and Y is the dependent
// variable axis.
var x = [];
var y = [];

function createGoogleCharts()
{
	// Create data table.
	var dataTable = new google.visualization.DataTable();
	dataTable.addColumn("number","x param (units)");
	dataTable.addColumn("number","y param (units)");
	// Transform data into Google data
	// table format.  This is just a
	// 2D array of coordinate pairs to
	// be graphed.  Each position in
	// the tableTemp array is a 2-element
	// array, an x-y pair.
	var tableTemp = [];

	for (var i = 0; i < n; i++)
	{
		tableTemp[i] = [x[i],y[i]];
	}
	// Create the Google data table.
	dataTable.addRows(tableTemp);
	// Set chart options.
	var options = {
		"title":"Stock price history of...",
		"width":1000,
		"height":700
	};
	// Instantiate and draw chart.
	var chart = new google.charts.Line(document.getElementById("chart-01"));
	chart.draw(dataTable,options);
} 
