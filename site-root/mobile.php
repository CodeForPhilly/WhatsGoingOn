<?php

RequestHandler::respond('app/touch', array(
	'App' => Sencha_App::getByName('WhatsGoingOn')
	,'mode' => 'production'
	,'title' => 'What\'s Going On?'
));