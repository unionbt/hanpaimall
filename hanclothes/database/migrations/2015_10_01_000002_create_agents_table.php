<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAgentsTable extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('agents', function (Blueprint $table) {
			$table->increments('id');
			$table->string('name', 100)->index();
			$table->string('address', 250)->nullable();
			$table->string('phone', 50);
			$table->timestamps();

			$table->foreign('id')->references('id')->on('users')
				->onUpdate('cascade')->onDelete('cascade');
		});

		Schema::create('factory_agent', function (Blueprint $table) {
			$table->increments('id');
			$table->unsignedInteger('fid'); //Factories ID
			$table->unsignedInteger('aid'); //Agents ID

			$table->foreign('fid')->references('id')->on('factories')
				->onUpdate('cascade')->onDelete('cascade');
			$table->foreign('aid')->references('id')->on('agents')
				->onUpdate('cascade')->onDelete('cascade');
			$table->unique(['fid', 'aid']);
		});

		Schema::create('agent_brand', function (Blueprint $table) {
			$table->increments('id');
			$table->unsignedInteger('aid'); //Agents ID
			$table->unsignedInteger('bid'); //Brands ID

			$table->foreign('aid')->references('id')->on('agents')
				->onUpdate('cascade')->onDelete('cascade');
			$table->foreign('bid')->references('id')->on('brands')
				->onUpdate('cascade')->onDelete('cascade');
			$table->unique(['aid', 'bid']);
		});

		Schema::create('agent_audits', function (Blueprint $table) {
			$table->increments('id');
			$table->unsignedInteger('fid')->index(); //Factories ID
			$table->string('username', 100)->index();
			$table->string('idcard', 50);
			$table->string('realname', 50);
			$table->string('name', 100);
			$table->string('address', 250)->nullable();
			$table->string('phone', 50);
			$table->tinyInteger('audited')->default(0);
			$table->json('brand_ids');
			$table->timestamps();

			$table->foreign('fid')->references('id')->on('factories')
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
		Schema::drop('agent_audits');
		Schema::drop('agent_brand');
		Schema::drop('factory_agent');
		Schema::drop('agents');
	}
}
