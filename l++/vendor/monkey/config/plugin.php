<?php
return [
	'register' => [
 		'view' => true,
 		'translator' => true,
 		'router' => true,
 		'validation' => true,
	],
	'injectViews' => [
        'admin/sidebar.inc.tpl' => 9998,
	    'factory-backend/sidebar.inc.tpl' => 9998,
	],
];