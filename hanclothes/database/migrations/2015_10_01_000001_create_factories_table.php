<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFactoriesTable extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('factories', function (Blueprint $table) {
			$table->unsignedInteger('id')->index;
			$table->string('name', 100)->index();
			$table->string('address', 250)->nullable();
			$table->string('phone', 50);
			$table->timestamps();

			$table->foreign('id')->references('id')->on('users')
				->onUpdate('cascade')->onDelete('cascade');
		});

		Schema::create('brands', function (Blueprint $table) {
			$table->increments('id');
			$table->string('name', 100)->unique();
			$table->unsignedInteger('fid')->index(); //Factory ID
			$table->unsignedInteger('logo_aid')->default(0); //图片
			$table->softDeletes(); //软删除

			$table->foreign('fid')->references('id')->on('factories')
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
		Schema::drop('factories');
		Schema::drop('brands');
	}
}
