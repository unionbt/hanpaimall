<?php

return [
	'member' => [
		'store' => [
			'username' => [
				'name' => '用户名',
				'rules' => 'required|ansi:2|unique:users,{{attribute}},{{id}}|regex:/^[a-z0-9\x{4e00}-\x{9fa5}\x{f900}-\x{fa2d}]*$/iu|max:150|min:3',
				'message' => ['regex' => '用户名必须为汉字、英文、数字'],
			],
			'nickname' => [
				'name' => '昵称',
				'rules' => 'string|min:1',
			],
			'realname' => [
				'name' => '真实姓名',
				'rules' => 'ansi:2|regex:/^[a-z\x{4e00}-\x{9fa5}\x{f900}-\x{fa2d}\s]*$/iu|max:50|min:3',
				'message' => ['regex' => '姓名必须为汉字、英文'],
			],
			'password' => [
				'name' => '密码',
				'rules' => 'required|min:6|confirmed',
			],
			'password_confirmation ' => [
				'name' => '确认密码',
				'rules' => 'required',
			],
			'gender' => [
				'name' => '性别',
				'rules' => 'required|not_zero|field',
			],
			'phone' => [
				'name' => '手机',
				'rules' => 'phone|unique:users,{{attribute}},{{id}}',
			],
			'idcard' => [
				'name' => '身份证',
				'rules' => 'idcard|unique:users,{{attribute}},{{id}}',
			],
			'email' => [
				'name' => 'E-Mail',
				'rules' => 'email|unique:users,{{attribute}},{{id}}',
			],
			'avatar_aid' => [
				'name' => '用户头像',
				'rules' => 'numeric',
			],
			'role_ids' => [
				'name' => '用户组',
				'rules' => 'required|array',
			],
			'accept_license' => [
				'name' => '阅读并同意协议',
				'rules' => 'accepted',
			]
		],
		'login' => [
			'username' => [
				'name' => '用户名',
				'rules' => 'required',
			],
			'password' => [
				'name' => '密码',
				'rules' => 'required',
			],
		],
		'address' => [
			'realname' => [
				'name' => '姓名',
				'rules' => 'required|string',
			],
			'province' => [
				'name' => '省',
				'rules' => 'required|string',
			],
			'city' => [
				'name' => '市',
				'rules' => 'required|string',
			],
			'counties' => [
				'name' => '区/县',
				'rules' => 'string',
			],
			'address' => [
				'name' => '地址',
				'rules' => 'required|string',
			],
			'national_code' => [
				'name' => '国家码',
				'rules' => 'string',
			],
			'postal_code' => [
				'name' => '邮编',
				'rules' => 'string',
			],
			'phone' => [
				'name' => '联系电话',
				'rules' => 'required|string',
			],
		],
	],
	'factory' => [
		'store' => [
			'id' => [
				'name' => '绑定用户',
				'rules' => 'required|numeric|unique:factories',
			],
			'name' => [
				'name' => '厂家名称',
				'rules' => 'required',
			],
			'address' => [
				'name' => '厂家地址',
				'rules' => [],
			],
			'phone' => [
				'name' => '厂家电话',
				'rules' => [],
			],
		],
	],
	'agent' => [
		'store' => [
			'id' => [
				'name' => '绑定用户',
				'rules' => 'required|numeric|unique:factories',
			],
			'name' => [
				'name' => '代理商名称',
				'rules' => 'required',
			],
			'address' => [
				'name' => '代理商地址',
				'rules' => [],
			],
			'phone' => [
				'name' => '代理商电话',
				'rules' => [],
			],
			'factory_ids' => [
				'name' => '厂家ID',
				'rules' => 'required|array',
			],
			'brand_ids' => [
				'name' => '品牌ID',
				'rules' => 'required|array',
			],
		],
		'audit-store' => [
			'username' => [
				'name' => '负责人手机(账号)',
				'rules' => 'required|phone',
			],
			'realname' => [
				'name' => '负责人姓名',
				'rules' => 'required',
			],
			'idcard' => [
				'name' => '负责人身份证号',
				'rules' => 'required|idcard',
			],
			'name' => [
				'name' => '代理商名称',
				'rules' => 'required',
			],
			'fid' => [
				'name' => '厂家ID',
				'rules' => 'required|numeric',
			],
			'brand_ids' => [
				'name' => '品牌ID',
				'rules' => 'required|array',
			],
			'address' => [
				'name' => '代理商地址',
				'rules' => [],
			],
			'phone' => [
				'name' => '代理商电话',
				'rules' => 'phone',
			],
		],
	],
	'store' => [
		'store' => [
			'id' => [
				'name' => '绑定用户',
				'rules' => 'required|numeric|unique:factories',
			],
			'name' => [
				'name' => '门店名称',
				'rules' => 'required',
			],
			'address' => [
				'name' => '门店地址',
				'rules' => [],
			],
			'phone' => [
				'name' => '门店电话',
				'rules' => [],
			],
			'agent_ids' => [
				'name' => '代理ID',
				'rules' => 'required|array',
			],
			'brand_ids' => [
				'name' => '品牌ID',
				'rules' => 'required|array',
			],
		],
		'audit-store' => [
			'username' => [
				'name' => '负责人手机(账号)',
				'rules' => 'required|phone',
			],
			'realname' => [
				'name' => '负责人姓名',
				'rules' => 'required',
			],
			'idcard' => [
				'name' => '负责人身份证号',
				'rules' => 'required|idcard',
			],
			'name' => [
				'name' => '门店名称',
				'rules' => 'required',
			],
			'aid' => [
				'name' => '代理商ID',
				'rules' => 'required|numeric',
			],
			'brand_ids' => [
				'name' => '品牌ID',
				'rules' => 'required|array',
			],
			'address' => [
				'name' => '门店地址',
				'rules' => [],
			],
			'phone' => [
				'name' => '代理商电话',
				'rules' => 'phone',
			],
		],
	],
	'brand' => [
		'store' => [
			'name' => [
				'name' => '名称',
				'rules' => 'required',
			],
			'logo_aid' => [
				'name' => 'LOGO AID',
				'rules' => 'numeric',
			],
			'fid' => [
				'name' => '厂家ID',
				'rules' => 'required|not_zero|numeric',
			],
		],
	],
	'product' => [
		'store' => [
			'title' => [
				'name' => '名称',
				'rules' => 'required',
			],
			'keywords' => [
				'name' => 'SEO关键字',
				'rules' => [],
			],
			'description' => [
				'name' => 'SEO描述',
				'rules' => [],
			],
			'content' => [
				'name' => '内容',
				'rules' => 'required',
			],
			'cover_aids' => [
				'name' => '封面图片',
				'rules' => 'required|array',
			],
			'shop_rate' => [
				'name' => '店铺返利',
				'rules' => 'required|digits_between:1,2',
			],
			'express_price' => [
				'name' => '快递费/件',
				'rules' => 'required|not_zero',
			],
			'agent_rate' => [
				'name' => '代理商返利',
				'rules' => 'required|digits_between:1,2',
			],
			'fid' => [
				'name' => '厂商ID',
				'rules' => 'required|not_zero|numeric',
			],
			'bid' => [
				'name' => '品牌ID',
				'rules' => 'required|not_zero|numeric',
			],
			'activity_type' => [
				'name' => '活动',
				'rules' => 'numeric',
			],
		],
	],
	'product-attr' => [
		'store' => [
			'name' => [
				'name' => '属性名',
				'rules' => 'required',
			],
			'aid' => [
				'name' => '属性图片',
				'rules' => 'required|numeric',
			],
		],
	],
	'product-stock' => [
		'store' => [
			'attr_id' => [
				'name' => '属性',
				'rules' => 'required',
			],
			'size_type' => [
				'name' => '大小',
				'rules' => 'required|not_zero',
			],
			'price' => [
				'name' => '价格',
				'rules' => 'required|numeric|not_zero',
			],
			'count' => [
				'name' => '库存',
				'rules' => 'required|not_zero|numeric',
			],
		],
	],
	'cart' => [
		'store' => [
			'cart' => [
				'name' => '商品',
				'rules' => 'required|array',
			],
			'buy_cnt' => [
				'name' => '商品数量',
				'rules' => 'required|integer|min:0',
			],
		],
	],
	'order' => [
		'store' => [
			'uaid' => [
				'name' => '用户地址',
				'rules' => 'required_without:sid|numeric',
			],
			'sid' => [
				'name' => '自提门店',
				'rules' => 'required_without:uaid|numeric',
			],
			'cart' => [
				'name' => '商品',
				'rules' => 'required|array',
			],
			'buy_cnt' => [
				'name' => '商品数量',
				'rules' => 'required|array',
			],
			'bonus_id' => [
				'name' => '红包id',
				'rules' => 'numeric',
			],
		],
		'cart' => [
			'psid' => [
				'name' => '商品',
				'rules' => 'required|not_zero|numeric',
			],
			'count' => [
				'name' => '商品數量',
				'rules' => 'required|numeric|min:1',
			],
			'quickly' =>[
				'name' => '立即购买',
				'rules' => 'required|boolean',
			],
		],
		'calc' => [
			'uaid' => [
				'name' => '用户地址',
				'rules' => 'required|numeric',
			],
			'cart' => [
				'name' => '商品',
				'rules' => 'array',
			],
			'buy_cnt' => [
				'name' => '商品数量',
				'rules' => 'array',
			],
		   'bonus_id' => [
				'name' => '红包id',
				'rules' => 'numeric',
			],
		],
		'express' =>[
			'expresses_money'=>[
				'name'=>'运费',
				'rules' => 'required|numeric',
			 ],
		],
		'deliver' =>[
			'express_name'=>[
				'name'=>'快递类型',
				'rules' => 'required|numeric',
			 ],
			'no'=>[
				'name'=>'订单号',
				'rules' => 'required',
			],
		],
		'express_store'=>[
			'sid' =>[
				'name' => '指定店铺',
				'rules' => 'required|numeric',
			],
		],
	],
	'withdraw' => [
		'store' => [
			'money' => [
				'name' => '提现金额',
				'rules' => 'required|numeric',
			],
			'card_id' => [
				'name' => '银行卡',
				'rules' => 'required|not_zero',
			]
		],
		'audit' => [
			'audit' => [
				'name' => '审核',
				'rules' => 'required|boolean',
			],
			'note' => [
				'name' => '审核说明',
				'rules' => 'required',
			],
		],
	],
	'bankcard' => [
		'store' => [
			'bank_type' => [
				'name' => '开户行',
				'rules' => 'required|not_zero',
			],
			'cardholder' => [
			   'name' => '持名人',
			   'rules' => 'ansi:2|regex:/^[a-z\x{4e00}-\x{9fa5}\x{f900}-\x{fa2d}\s]*$/iu|max:50|min:3',
			   'message' => ['regex' => '姓名必须为汉字、英文'],
			],
			'card_no'=>[
				'name'=>'卡号',
				'rules' => 'required',
			],
			'bank_branch'=>[
				'name'=>'开户行支行',
				'rules' => 'required',
			],
		],
	],
];