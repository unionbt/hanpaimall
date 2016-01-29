<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWithdrawsTable extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{ 	    
	    Schema::create('withdraws', function (Blueprint $table) {
	        $table->increments('id');
	        $table->unsignedInteger('uid')->comment = '用户UID';
	        $table->decimal('money', 16, 2)->comment='提现金额';;
	        $table->tinyInteger('audit')->index()->default(0)->comment='是否审核 0：未知，1：提交  2：已完成  -1取消';
	        $table->string('note', 255)->comment='审核不通过说明';
	        $table->unsignedInteger('counter_fee')->comment='提现手续费(rmb)';
	        $table->unsignedInteger('card_id')->comment = '银行卡id';
	        $table->timestamps();
	        
	        $table->foreign('uid')->references('id')->on('users')
	        ->onUpdate('cascade')->onDelete('cascade');
	    });

	   Schema::create('user_bankcards', function (Blueprint $table) {
	        $table->increments('id')->comment='主键';
	        $table->unsignedInteger('uid')->comment = '用户UID';
	        $table->unsignedInteger('bank_type')->default('0')->comment='开户行';
	        $table->string('bank_branch',100)->comment='开户行支行';
	        $table->string('cardholder',20)->comment='持卡人名字';
	        $table->string('card_no',20)->comment='银行卡号';
	        $table->timestamp('used_at')->nullable()->comment = '最后使用时间';
	        $table->softDeletes(); //软删除
	        $table->timestamps();
	         
	        $table->foreign('uid')->references('id')->on('users')
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
		Schema::drop('withdrawals');
	}
}
