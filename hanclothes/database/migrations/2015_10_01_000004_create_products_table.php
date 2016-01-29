<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('products', function (Blueprint $table) {
			$table->increments('id')->comment='主键';
			$table->unsignedInteger('fid')->default(0)->comment='厂家id'; //Factories ID
			$table->unsignedInteger('bid')->default(0)->comment='品牌id'; //Brands ID

			$table->string('title', 250)->comment='商品名称';
			$table->string('keywords', 250)->comment='SEO关键字';
			$table->string('description', 250)->comment='SEO描述';
			$table->text('content')->comment='商品介绍';
			$table->unsignedInteger('shop_rate')->comment='店铺返利百分点';
			$table->unsignedInteger('agent_rate')->comment='代理商返利百分点';
			$table->decimal('express_price', 16, 2)->comment='快递费/件';
			$table->unsignedInteger('activity_type')->default(0)->comment='活动类型,0表示未参与活动.';
			$table->softDeletes(); //软删除
			
			$table->foreign('fid')->references('id')->on('factories')
				->onUpdate('cascade')->onDelete('cascade');
			$table->foreign('bid')->references('id')->on('brands')
				->onUpdate('cascade')->onDelete('cascade');
			$table->timestamps();
		});

		Schema::create('product_attrs', function (Blueprint $table) {
			$table->increments('id')->comment='主键';
			$table->unsignedInteger('pid')->default(0)->comment='商品id'; //Products ID
			$table->string('name',20)->comment='属性名';
			$table->unsignedInteger('aid')->default(0)->comment='附件id';
			$table->softDeletes(); //软删除

			$table->foreign('pid')->references('id')->on('products')
				->onUpdate('cascade')->onDelete('cascade');

			$table->timestamps();
		});

		Schema::create('product_sizes', function (Blueprint $table) {
			$table->increments('id')->comment='主键';
			$table->unsignedInteger('pid')->default(0)->comment='商品id'; 
			$table->unsignedInteger('attr_id')->default(0)->comment='属性id';
			$table->unsignedInteger('size_type')->default('34')->comment='衣服大小'; 
			$table->decimal('price', 16, 2)->comment='价格'; //价格
			$table->unsignedInteger('count')->default(0)->comment='数量'; //数量
			$table->softDeletes(); //软删除
			
			$table->foreign('pid')->references('id')->on('products')
				->onUpdate('cascade')->onDelete('cascade');
			$table->foreign('attr_id')->references('id')->on('product_attrs');
			$table->timestamps();
		});

		Schema::create('product_covers', function (Blueprint $table) {
			$table->increments('id')->comment='主键';
			$table->unsignedInteger('pid')->default(0)->comment='商品id'; //Products ID
			$table->unsignedInteger('cover_aid')->default(0)->comment='附件id'; //封面AID
			
			$table->foreign('pid')->references('id')->on('products')
				->onUpdate('cascade')->onDelete('cascade');

			$table->timestamps();
		});


	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('brand_agent');
		Schema::drop('stores');
	}
}
