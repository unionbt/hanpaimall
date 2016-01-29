<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class Seeds extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return  void
	 */
	public function up()
	{
		\App\Field::create([
			'name' => 'male',
			'title' => '男',
			'field_class' => 'gender',
		])->create([
			'name' => 'female',
			'title' => '女',
			'field_class' => 'gender',
		])->create([
			'name' => 'news',
			'title' => '订阅号',
			'field_class' => 'wechat_type',
		])->create([
			'name' => 'service',
			'title' => '服务号',
			'field_class' => 'wechat_type',
		])->create([
			'name' => 'enterprise',
			'title' => '企业号',
			'field_class' => 'wechat_type',
		])->create([
			'name' => 'depot',
			'title' => '素材',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'news',
			'title' => '图文',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'image',
			'title' => '图片',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'thumb',
			'title' => '缩略图',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'video',
			'title' => '视频',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'shortvideo',
			'title' => '小视频',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'voice',
			'title' => '音频',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'music',
			'title' => '音乐',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'text',
			'title' => '文字',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'link',
			'title' => '连接',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'location',
			'title' => '地址',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'callback',
			'title' => '回调',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'event',
			'title' => '事件',
			'field_class' => 'wechat_message_type',
		])->create([
			'name' => 'subscribe',
			'title' => '关注',
			'field_class' => 'wechat_event_type',
		])->create([
			'name' => 'unsubscribe',
			'title' => '取消关注',
			'field_class' => 'wechat_event_type',
		])->create([
			'name' => 'SCAN',
			'title' => '扫描二维码',
			'field_class' => 'wechat_event_type',
		])->create([
			'name' => 'LOCATION',
			'title' => '地址',
			'field_class' => 'wechat_event_type',
		])->create([
			'name' => 'CLICK',
			'title' => '点击',
			'field_class' => 'wechat_event_type',
		])->create([
			'name' => 'VIEW',
			'title' => '视图',
			'field_class' => 'wechat_event_type',
		])->create([
			'name' => 'scancode_push',
			'title' => '扫描事件',
			'field_class' => 'wechat_event_type',
		])->create([
			'name' => 'scancode_waitmsg',
			'title' => '扫描事件「非跳转」',
			'field_class' => 'wechat_event_type',
		])->create([
			'name' => 'pic_sysphoto',
			'title' => '系统拍照发图',
			'field_class' => 'wechat_event_type',
		])->create([
			'name' => 'pic_photo_or_album',
			'title' => '拍照或者相册发图',
			'field_class' => 'wechat_event_type',
		])->create([
			'name' => 'pic_weixin',
			'title' => '相册发图',
			'field_class' => 'wechat_event_type',
		])->create([
			'name' => 'location_select',
			'title' => '地址选择',
			'field_class' => 'wechat_event_type',
		])->create([
			'name' => 'XXS',
			'title' => '特小号',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => 'XS',
			'title' => '加小号',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => 'S',
			'title' => '小号',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => 'M',
			'title' => '中号',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => 'L',
			'title' => '大号',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => 'XL',
			'title' => '加大号',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => 'XXL',
			'title' => '特大号',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => 'XXXL',
			'title' => '特特大号',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => '27',
			'title' => '腰围27',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => '28',
			'title' => '腰围28',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => '29',
			'title' => '腰围29',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => '30',
			'title' => '腰围30',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => '31',
			'title' => '腰围31',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => '32',
			'title' => '腰围32',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => '33',
			'title' => '腰围33',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => '34',
			'title' => '腰围34',
			'field_class' => 'clothes_size_type',
		])->create([
			'name' => 'store',
			'title' => '自提',
			'field_class' => 'express_type',
		])->create([
			'name' => 'express',
			'title' => '快递',
			'field_class' => 'express_type',
		])->create([
			'name' => 'sf-express',
			'title' => '顺丰快递',
			'field_class' => 'express_name',
		])->create([
			'name' => 'sto-express',
			'title' => '申通快递',
			'field_class' => 'express_name',
		])->create([
			'name' => 'yto-express',
			'title' => '圆通快递',
			'field_class' => 'express_name',
		])->create([
			'name' => 'zto-express',
			'title' => '中通快递',
			'field_class' => 'express_name',
		])->create([
			'name' => 'ems',
			'title' => 'EMS',
			'field_class' => 'express_name',
		])->create([
			'name' => 'deppon',
			'title' => '德邦物流',
			'field_class' => 'express_name',
		])->create([
		    'name' => 'china_bank',
		    'title' => '中国银行',
		    'field_class' => 'bank_name',
		])->create([
		    'name' => 'construction_bank',
		    'title' => '中国建设银行',
		    'field_class' => 'bank_name',	   
		])->create([
		    'name' => 'ICBC',
		    'title' => '中国工商银行',
		    'field_class' => 'bank_name',
		])->create([
		    'name' => 'BOCOM',
		    'title' => '交通银行',
		    'field_class' => 'bank_name',
		])->create([
		    'name' => 'agricultural_bank',
		    'title' => '中国农业银行',
		    'field_class' => 'bank_name',	
		])->create([
		    'name' => 'merchants_bank',
		    'title' => '招商银行',
		    'field_class' => 'bank_name',
		])->create([
		    'name' => 'post_savings_bank',
		    'title' => '中国邮政储蓄银行',
		    'field_class' => 'bank_name',
		])->create([
		    'name' => 'everbright_bank',
		    'title' => '中国光大银行',
		    'field_class' => 'bank_name',
		])->create([
		    'name' => 'minsheng_bank',
		    'title' => '中国民生银行',
		    'field_class' => 'bank_name',	
		])->create([
		    'name' => 'pingan_bank',
		    'title' => '中国平安银行',
		    'field_class' => 'bank_name',
		])->create([
		    'name' => 'SPD',
		    'title' => '浦发银行',
		    'field_class' => 'bank_name',
		])->create([
		    'name' => 'CITIC',
		    'title' => '中信银行',
		    'field_class' => 'bank_name',
		])->create([
		    'name' => 'industrial_bank',
		    'title' => '兴业银行',
		    'field_class' => 'bank_name',
		])->create([
		    'name' => 'huaxia_bank',
		    'title' => '华夏银行',
		    'field_class' => 'bank_name',
		])->create([
		    'name' => 'communications_bank',
		    'title' => '广发银行',
		    'field_class' => 'bank_name',
		])->create([
			'name' => '',
			'title' => '无',
		])->update(['id' => 0]);

		\App\Role::create([
			'id' => 99,
			'name' => 'admin',
			'display_name' => '超级管理员',
			'url' => 'admin',
		])->create([
			'id' => 98,
			'name' => 'manager',
			'display_name' => '项目总监',
			'url' => 'admin',
		])->create([
			'id' => 97,
			'name' => 'owner',
			'display_name' => '经理',
			'url' => 'admin',
		])->create([
			'id' => 96,
			'name' => 'leader',
			'display_name' => '负责人',
			'url' => 'admin',
		])->create([
			'id' => 1,
			'name' => 'viewer',
			'display_name' => '普通用户',
			'url' => '',
		])->create([
			'id' => 2,
			'name' => 'wechater',
			'display_name' => '微信用户',
			'url' => '',
		])->create([
			'id' => 3,
			'name' => 'factory',
			'display_name' => '厂商'
		])->create([
			'id' => 4,
			'name' => 'agent',
			'display_name' => '代理商'
		])->create([
			'id' => 5,
			'name' => 'store',
			'display_name' => '门店'
		])->create([
			'id' => 0,
			'name' => 'guest',
			'display_name' => '访客',
			'url' => '',
		])->update(['id' => 0]);

		foreach([
			'role' => '用户组、权限',
			'attachment' => '附件',
			'member' => '用户',
			'factory' => '厂商',
			'agent' => '代理商',
			'store' => '门店',
			'product' => '产品',
			'wechat-account' => '微信公众号',
			'wechat-depot' => '微信素材',
			'wechat-menu' => '微信菜单',
			'wechat-message' => '微信消息',
			'wechat-reply' => '微信自定义回复',
			'wechat-user' => '微信用户',
		] as $k => $v) {
			foreach([
				'view' => '查看',
				'create' => '新建',
				'edit' => '编辑',
				'destroy' => '删除',
				'export' => '导出'
			] as $k1 => $v1) {
				\App\Permission::create([
					'name' => $k.'.'.$k1,
					'display_name' => '允许'.$v1.$v,
				]);
			}
		}
		\App\Role::find(99)->perms()->sync(\App\Permission::all());

		(new \App\User)->add([
			'username' => 'admin',
			'password' => '123456',
			'nickname' => '超级管理员',
		], \App\Role::ADMIN);
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return  void
	 */
	public function down()
	{

	}
}
