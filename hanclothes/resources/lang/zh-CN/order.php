<?php
return [
	'failure_cart_stock_less' => [
		'title' => '库存不足',
		'content' => '商品库存不足，请刷新产品页面重新选择！',
	],
	'failure_stock_empty' => [
		'title' => '库存不足',
		'content' => '商品暂时已经售完，请等待商品进货！',
	],
	'failure_stock_less' => [
		'title' => '库存不足',
		'content' => '商品[:title :attr :size]库存暂时只有:count件，请返回购物车重新选择！',
	],
	'success_cart' => [
		'title' => '加入购物车成功',
		'content' => '加入购物车成功，您可以继续购物！',
	],
	'success_quickly' => [
		'title' => '待确认订单',
		'content' => '即将跳转到订单确认页面',
	],
	'success_confirm' => [
		'title' => '订单确认成功',
		'content' => '订单已经确认，请及时支付，24小时内未支付则会取消订单！',
	],
	'failure_product_noexists' => [
		'title' => '订单失败',
		'content' => '订单中产品[:title :attr :size]已下架，请刷新购物车重新选择！',
	],
	'failure_product_unique' => [
		'title' => '订单失败',
		'content' => '订单中有重复的产品和尺寸，请返回购物车检查！',
	],
	'failure_noexists' => [
		'title' => '订单不存在',
		'content' => '订单不存在，您是否删除了该订单？'
	],
	'failure_init' => [
		'title' => '订单创建失败',
		'content' => '订单状态不正确，请稍后重新提交订单！'
	],
	'success_deal' => [
		'title' => '订单完成',
		'content' => '确认收货，该订单已完成！'
	],
    'success_store_deal' => [
        'title' => '订单完成',
        'content' => '确认客户已领货，该订单已完成！'
    ],
	'failure_deal' => [
		'title' => '确认收货失败',
		'content' => '订单状态不正确，无法确认收货！'
	],
	'failure_paid' => [
		'title' => '订单支付失败',
		'content' => '订单已支付，或订单已关闭！',
	],
];