<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStoresTable extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('stores', function (Blueprint $table) {
			$table->increments('id');
			$table->string('name', 100)->index();
			$table->string('address', 250)->nullable();
			$table->string('phone', 50);
			$table->unsignedInteger('qrcode_aid')->default(0)->comment = '二维码AID';
			$table->timestamps();

			$table->foreign('id')->references('id')->on('users')
				->onUpdate('cascade')->onDelete('cascade');
		});

		Schema::create('agent_store', function (Blueprint $table) {
			$table->increments('id');
			$table->unsignedInteger('aid'); //Agents ID
			$table->unsignedInteger('sid'); //Stores ID

			$table->foreign('aid')->references('id')->on('agents')
				->onUpdate('cascade')->onDelete('cascade');
			$table->foreign('sid')->references('id')->on('stores')
				->onUpdate('cascade')->onDelete('cascade');
			$table->unique(['aid', 'sid']);
		});

		Schema::create('store_brand', function (Blueprint $table) {
			$table->increments('id');
			$table->unsignedInteger('sid'); //Stores ID
			$table->unsignedInteger('bid'); //Brands ID

			$table->foreign('sid')->references('id')->on('stores')
				->onUpdate('cascade')->onDelete('cascade');
			$table->foreign('bid')->references('id')->on('brands')
				->onUpdate('cascade')->onDelete('cascade');
			$table->unique(['sid', 'bid']);
		});

		Schema::create('store_user', function (Blueprint $table) {
			$table->increments('id');
			$table->unsignedInteger('sid'); //Stores ID
			$table->unsignedInteger('uid'); //Users ID

			$table->foreign('sid')->references('id')->on('stores')
				->onUpdate('cascade')->onDelete('cascade');
			$table->foreign('uid')->references('id')->on('users')
				->onUpdate('cascade')->onDelete('cascade');
			$table->unique(['sid', 'uid']);
		});

		Schema::create('store_audits', function (Blueprint $table) {
			$table->increments('id');
			$table->unsignedInteger('aid')->index(); //Agent ID
			$table->string('username', 100)->index();
			$table->string('idcard', 50);
			$table->string('realname', 50);
			$table->string('name', 100);
			$table->string('address', 250)->nullable();
			$table->string('phone', 50);
			$table->tinyInteger('audited')->default(0);
			$table->json('brand_ids');
			$table->timestamps();

			$table->foreign('aid')->references('id')->on('agents')
				->onUpdate('cascade')->onDelete('cascade');
		});

	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('store_audits');
		Schema::drop('store_user');
		Schema::drop('store_brand');
		Schema::drop('agent_store');
		Schema::drop('stores');
	}
}
