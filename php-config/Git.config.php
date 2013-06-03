<?php

Git::$repositories['WhatsGoingOn'] = array(
	'remote' => 'git@github.com:CfABrigadePhiladelphia/WhatsGoingOn.git'
	,'originBranch' => 'master'
	,'workingBranch' => 'master'
	,'localOnly' => true
	,'trees' => array(
		'ext-library' => array(
			'localOnly' => false
		)
		,'html-templates'
		,'php-classes'
		,'php-config'
		,'sencha-build'
		,'sencha-workspace'
		,'site-root'
	)
);