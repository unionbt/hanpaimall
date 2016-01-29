<?php

return [

	'title' => '汉派商城',
	'title_reverse' => true, //显示标题时，FALSE顺序为：主标题 - 子标题 - 子标题，设置为TRUE，则表示反转显示
	'pagesize' => [
	    'm' => 3,
		'common' => 25,
		'export' => 500,
		'admin' => [
			'permissions' => 50,
			'users' => 25,
			//
			'factories' => 10,
			'agents' => 10,
			'brands' => 10,
			'stores' => 10,
			'product' => 25,
			//Wechat
			'wechat_depots' => 5,
			'wechat-users' => 50,
		], 
	],
	'order' => [
		'cancel' => 86400,
		'deal' => 86400 * 14,
	],
    'minimum_withdraw' => 100,//提现最小金额
    'withdraw_counter_percent' => 0.01,//提现手续费百分比
];
