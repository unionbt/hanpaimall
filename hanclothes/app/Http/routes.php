<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

//$router->pattern('id', '[0-9]+'); //所有id都是数字

$router->any('wechat/feedback/{aid}/{oid?}', 'WechatController@feedback');
$router->addAnyActionRoutes([
	'wechat',
]);

$router->group(['namespace' => 'Admin','prefix' => 'admin', 'middleware' => ['auth', 'role:admin|manager|owner|leader']], function($router) {
	$router->addAdminRoutes([
		'member' => 'MemberController',
		'factory' => 'FactoryController',
		'brand' => 'BrandController',
		'agent' => 'AgentController',
		'agent-audit' => 'AgentAuditController',
		'store' => 'StoreController',
		'store-audit' => 'StoreAuditController',
		'store-user' => 'StoreUserController',
		'withdraw' => 'WithdrawController',
		'order' => 'OrderController',
		'product' => 'ProductController',
		'product-attr' => 'ProductAttrController',
		'product-stock' => 'ProductStockController',
		'statement' => 'StatementController',
		'statistics' => 'StatisticsController'
	]);

	$router->put('home/{id}','HomeController@update');
	$router->any('order/{id}/cancel','OrderController@cancel');
	$router->get('order/{id}/deliver','OrderController@deliver');
	$router->any('order/save_deliver/{id}','OrderController@save_deliver');
	//admin目录下的其它路由需放置在本条前
	$router->addUndefinedRoutes();
});

$router->group(['namespace' => 'Factory','prefix' => 'factory', 'middleware' => ['auth', 'role:factory']], function($router) {
	$router->get('user/password','UserController@password');
	$router->addAdminRoutes([
		'member' => 'MemberController',
		'brand' => 'BrandController',
		'agent' => 'AgentController',
		'agent-audit' => 'AgentAuditController',
		'order' => 'OrderController',
		'store' => 'StoreController',
		'store-user' => 'StoreUserController',
		'express' => 'ExpressController',
		'product' => 'ProductController',
		'withdraw' => 'WithdrawController',
		'order' => 'OrderController',
		'statement' => 'StatementController',
		'product-attr' => 'ProductAttrController',
		'product-stock' => 'ProductStockController',
		'user' => 'UserController',
		'bankcard' => 'BankcardController'
	]);
	
	$router->post('store-user/data/json','StoreUserController@data');
	$router->any('order/{id}/cancel','OrderController@cancel');
	$router->get('order/{id}/deliver','OrderController@deliver');
	$router->any('order/save_deliver/{id}','OrderController@save_deliver');
	$router->addUndefinedRoutes();
});

$router->group(['namespace' => 'Agent','prefix' => 'agent', 'middleware' => ['auth', 'role:agent']], function($router) {
	$router->get('user/password','UserController@password');
	$router->addAdminRoutes([
		'member' => 'MemberController',
		'brand' => 'BrandController',
		'order' => 'OrderController',
		'store' => 'StoreController',
		'express' => 'ExpressController',
		'store-audit' => 'StoreAuditController',
		'statement' => 'StatementController',
		'withdraw' => 'WithdrawController',
		'user' => 'UserController',
		'bankcard' => 'BankcardController',
	]);

	$router->addUndefinedRoutes();
});

$router->group(['namespace' => 'Store','prefix' => 'store', 'middleware' => ['auth', 'role:store']], function($router) {
	$router->get('user/password','UserController@password');
	$this->addAdminRoutes([
		 'member' => 'MemberController',
		 'order' => 'OrderController',
		 'store' => 'StoreController',
		 'qrcode' => 'QrcodeController',
		'withdraw' => 'WithdrawController',
		 'user' => 'UserController',
		'bankcard' => 'BankcardController',
	]);
	$router->any('order/deal/{id}','OrderController@dealing');
	 
	$router->addUndefinedRoutes();
});

$router->group(['namespace' => 'M','prefix' => 'm'], function($router) {
	$router->get('classify','SearchController@classify');
	$router->get('monkey','GameController@monkey');
	$router->get('detail','ProductController@detail');
	$router->get('shopcart','CartController@shopCart');
	$router->post('addcart','CartController@addCart');
	$router->any('to/order','OrderController@toOrder');
	$router->post('to/pay','OrderController@confirm');
	$router->get('ucenter','MemberController@index');
	$router->addUndefinedRoutes();
});

$router->get('classify','SearchController@classify');
$router->get('detail','ProductController@detail');
//$router->get('confirm','OrderController@confirm');
//$router->('qrcode/{id}','QrcodeController@store');
//$router->('*','HomeController@index');
//根目录的其它路由需放置在本条前
$router->addUndefinedRoutes();