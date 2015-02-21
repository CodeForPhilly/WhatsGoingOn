function fetchData(tags, success, error) {
	$.ajax({
		url: '/localwiki/tag-search',
		data: {
			_dc: +new Date(),
			include: 'map,page',
			tag: tags,
			format: 'json',
			offset: 0,
			limit: 25
		},
		type: 'GET',
		success: success,
		error: error
	});
}

function cleanPageURL(dirtyURL) {
	return dirtyURL.replace('/api/page/', 'http://beta.wikidelphia.org/');
}

function updateResultsList(results) {
	// input: JSON results from API
	if (results['objects'].length == 0) {
		$('.search-results').html('No results found.');
		return;
	}
	
	$('.search-results').html('<ol></ol>');
	for (var i = 0; i < results['objects'].length; i++) {
		var result = results['objects'][i];
		$('.search-results ol').append('<li><a href="' + cleanPageURL(result['page']) +'">' + result['name'] + '</a></li>');
	}
}

function updateResultsMap(results) {
	console.log(results);
	var latLongPairs = [];
	
	for(var i = 0; i < results.objects.length; i++) {
		var result = results.objects[i];
		if (result.map !== null) {
			point_info = result.map.points.coordinates[0];
			var marker_info = {
				lat: point_info[1],
				lng: point_info[0],
				name: result.name,
				url: cleanPageURL(result.page)
			};
			latLongPairs.push(marker_info);
		}
	}
	
	console.log(latLongPairs);
	updateMapWithInfo(latLongPairs);
}

function updateMapWithInfo(markers_to_place) {
	clearMarkers(); 
	
	for(var i = 0; i < markers_to_place.length; i++) {
		var marker_data = markers_to_place[i];
		
		addMarker(marker_data);
	}
}

function addMarker(marker_info) {
	var marker = new google.maps.Marker({
      		position: new google.maps.LatLng(marker_info.lat, marker_info.lng),
      		map: map
	});
	
	google.maps.event.addListener(marker, 'click', function() {
		infoWindow.setContent("<a class='infowindow-link' target='_blank' href='" + marker_info.url + "'>" + marker_info.name + "</a>");
    	infoWindow.open(map, marker);
  	});
	markers.push(marker);
}

function clearMarkers() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}

function generateTagForSection(section_name) {
	var inputs = $('input[name=' + section_name + ']:checked');
	var tag = inputs.attr('value');
	
	return tag;
}

function generateTags() {
	// generates list of all tags on the page
	subject_tag = generateTagForSection('subject');
	age_tag = generateTagForSection('age');
	season_tag = generateTagForSection('season');
	
	var tagObjects = $('input:checked');
	
	var tags = [];
	
	for (var i = 0; i < tagObjects.length; i++){
		tagName = $(tagObjects[i]).attr('value');
		if (tagName != '') {
			tags.push(tagName);
		}
	}
	
	return tags;
}

function updateResults(results) {
	updateResultsMap(results);
	updateResultsList(results);
	
	removeSpinner();
	
}

function addSpinner() {
	$('.results-column').children().hide();
	$('.results-column img.spinner').show();
}

function removeSpinner() {
	$('.results-column').children().show();
	$('.results-column img.spinner').hide();
}

function buttonClicked() {
	// Turn search results into a spinner
	addSpinner();
	
	
	// Generate list of tags 
	tags = generateTags();
	
	// if "all" selected for all sections...
	if (tags.length === 0) {
		tags.push("afterschoolprogram");
	}
	
	// Make request
	fetchData(tags, updateResults, function(err) { console.error(err)});
}



$(document).ready(function() {
	$('input[type=radio]').change(buttonClicked);
	
});

// Map stuff
var map = null;
var markers = [];
var infoWindow = new google.maps.InfoWindow();


function initialize() {
	var mapEl = document.getElementById("map"),
		myLatlng = new google.maps.LatLng(39.952, -75.1642);

	if (!mapEl) {
		return;
	}

    map = new google.maps.Map(mapEl, {
		center: myLatlng,
		zoom: 12,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		rotateControl: false,
		overviewMapControl: false,
		zoomControlOptions: { 
			style: google.maps.ZoomControlStyle.SMALL
		}
	});   
}

google.maps.event.addDomListener(window, 'load', initialize);