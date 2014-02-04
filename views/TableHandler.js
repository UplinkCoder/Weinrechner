// JavaScript Document
function fetchWines() {
	var WineTableStart = document.getElementById("tableStart");
	var fetchTable = new XMLHttpRequest();
	fetchTable.open ("GET","wines.json",true);
	//fetchTable.setRequestHeader("Content-type","application/json",true);
	fetchTable.onreadystatechange = function() {
		if (fetchTable.readyState == 4 && fetchTable.status == 200) {
		var json = JSON.parse(fetchTable.response);
		addRow(fetchTable.response);	
		}
	}

	fetchTable.send(null);
}

 function addRow(JsonArr) {
 
	var table = document.getElementById("Winetable");
	var rowCount = table.rows.length;
	var colCount = table.rows[0].cells.length;
	
	var array = JSON.parse(JsonArr);
	for(var j=0;j<array.length;j++) {
		
		var row = table.insertRow(table.rows.length-1);
		
		for(var i=0; i<colCount; i++) {
			var newcell = row.insertCell(i);
 			newcell.innerHTML = array[j][table.rows[0].cells[i].innerHTML];            
		}
	}
 }
 
 function send() {
	
 }