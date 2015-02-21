<?php

if(empty($_GET['tag'])) {
	JSON::error('Missing required parameter "tag"');
}

$tags = is_array($_GET['tag']) ? $_GET['tag'] : explode(',', $_GET['tag']);

if(!empty($_GET['include'])) {
	$include = is_array($_GET['include']) ? $_GET['include'] : explode(',', $_GET['include']);
}
else {
	$include = array();
}

// get results for first tag
$baseResult = LocalWiki::getPagesByTag(array_shift($tags));
$pages = $baseResult['objects'];

// filter results by additional tags
while($tag = array_shift($tags)) {
	$pages = array_filter($pages, function($page) use($tag) {
		return in_array("/api/tag/$tag", $page['tags']);
	});
}

// fetch page details
foreach($pages AS &$page) {
	
	if(in_array('content', $include) || in_array('map', $include)) {
		$cacheKey = "localwiki/content/$page[id]";
		
		if(!$pageDetails = Cache::fetch($cacheKey)) {
			$pageDetails = LocalWiki::getPageByUrl($page['page']);
			Cache::store($cacheKey, $pageDetails, 300);
		}
	
		$page = array_merge($page, $pageDetails);
	}
	
	// embed maps
	if(in_array('map', $include) && !empty($page['map'])) {
		$cacheKey = "localwiki/map/$page[id]";
		
		if(!$map = Cache::fetch($cacheKey)) {
			$map = LocalWiki::getPageByUrl($page['map']);
			Cache::store($cacheKey, $map, 300);
		}
	
		$page['map'] = $map;
	}
}

JSON::respond(array(
	'meta' => array(
		'total_count' => count($pages)
	)
	,'objects' => array_values($pages)
));