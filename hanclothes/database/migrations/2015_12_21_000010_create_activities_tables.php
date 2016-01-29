<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateActivitiesTables extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
	    Schema::create('activity_types', function (Blueprint $table) {
	        $table->increments('id');
	        $table->string('name',250)->default(0)->comment='参数类型';
	        $table->string('temp_dir',250)->comment='模板目录';
	        $table->string('class_dir',255)->comment='活动对应的类';
	        $table->softDeletes(); //软删除
	        
	        $table->timestamps();
	    });
	    
		Schema::create('activities', function (Blueprint $table) {
			$table->increments('id');
			$table->unsignedInteger('fid')->default(0)->comment='厂家id'; //Factories ID
			$table->unsignedInteger('type_id')->default(0)->comment='活动类型'; 
			$table->string('name')->default(0)->comment='活动名称'; 
			$table->unsignedInteger('aid')->default(0)->comment='活动图';
			$table->string('argc',250)->comment='活动参数';
			$table->timestamp('start_date')->nullable()->comment = '起始时间';
			$table->timestamp('end_date')->nullable()->comment = '终止时间';
			$table->unsignedInteger('order')->default(0)->comment='排序'; 
			$table->tinyInteger('status')->default(0)->comment='状态'; 
			$table->softDeletes(); //软删除
			$table->foreign('type_id')->references('id')->on('activity_types')
				->onUpdate('cascade')->onDelete('cascade');			
			$table->timestamps();
		});
		//红包奖励
		Schema::create('activity_bonus', function (Blueprint $table) {
		     $table->increments('id');
		     $table->unsignedInteger('uid')->default(0)->comment='用户id'; 
		     $table->unsignedInteger('fid')->default(0)->comment='厂家id'; 
		     $table->unsignedInteger('bonus')->default(0)->comment='红包';
		     $table->unsignedInteger('activity_id')->default(0)->comment='活动id';
		     $table->tinyInteger('status')->default(0)->comment='是否使用,0未使用，1.锁定中，2.已使用';
		     $table->softDeletes(); //软删除
		         
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
		Schema::drop('activity_types');
		Schema::drop('activities');
		Schema::drop('activity_bonus');
	}
}
