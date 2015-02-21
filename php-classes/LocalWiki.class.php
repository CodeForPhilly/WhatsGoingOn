<?php

class LocalWiki
{
	static public $rootUrl = 'http://beta.wikidelphia.org';
	
	static public function getFullURL($url)
	{
		return static::$rootUrl . $url;
	}
	
	static public function apiGet($url)
	{
		
		$url = static::getFullURL($url); 
	//	die($url);	
		$ch = curl_init($url);
		
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

		$result = curl_exec($ch);
		$httpStatus = curl_getinfo($ch, CURLINFO_HTTP_CODE);
		
		if($httpStatus == 404)
		{
			return false;
		}
		
		return json_decode($result, true);
	}
	
	static public function getChangesSince($when)
	{
		if(!is_int($when)) {
			$when = strtotime($when);
		}
		
		die('/api/page_version?format=json&limit=9999&history_date__gte=' . date('c', $when));
	}
	
	static public function getUserByUrl($url)
	{
		$url = $url . '?format=json';
		
		$response = static::apiGet($url);
		
		return $response;
	}
	
	static public function getPageByName($pageName)
	{
		return static::apiGet("/api/page/$pageName?format=json");
	}
	
	static public function getPageByUrl($pageUrl)
	{
		return static::apiGet("$pageUrl?format=json");
	}
	
	static public function getTagsByPage($pageName)
	{
		
		$url = '/api/page_tags/' . $pageName . '?format=json';
	
		$response = static::apiGet($url);
		return $response;
	}
	
	static public function getPagesByTag($tag)
	{
		$url = '/api/page_tags?tags__slug='.urlencode($tag).'&format=json&limit=50';
	
		$response = static::apiGet($url);
		return $response;
	}
	
	static public function isNotCreator($name, $user)
	{
		if(trim($name) && trim($user)) {
			$response = static::apiGet('/api/page_version?name='.urlencode($name).'&history_type=0&format=json&limit=9999');
			$creator = json_decode($response, true);
			return $user == $creator['objects'][0]['history_user'];
		}
		
		return false;
	}
	
	static public function parseEmail($name)
	{
		if(trim($name)) {
			$response = static::apiGet('/api/page?name='.urlencode($name).'&format=json');
			$content = json_decode($response, true);
			preg_match("/[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})/i", $content['objects'][0]['content'], $matches);
			return $matches[0];
		}
		
		return '';
	}
}