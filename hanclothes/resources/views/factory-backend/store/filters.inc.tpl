<!-- Form Content -->
<form action="<{'factory'|url nofilter}>/<{block "name"}><{/block}>/" method="GET" class="form-bordered form-horizontal">
	<input type="hidden" name="base" value="<{$_base}>">
	<div class="form-group col-sm-4">
		<label class="col-md-3 control-label" for="name">名称</label>
		<div class="col-md-9">
			<div class="input-group">
				<input type="text" id="name" name="filters[name][like]" class="form-control" placeholder="请输入关键词..." value="<{$_filters.name.like}>">
				<span class="input-group-addon"><i class="gi gi-user"></i></span>
			</div>
		</div>
	</div>
	<div class="form-group col-sm-4">
		<label class="col-md-3 control-label" for="uid">绑定用户</label>
		<div class="col-md-9">
			<select name="filters[id]" id="uid" value="<{$_filters.id.equal}>" class="form-control suggest-model" data-model="factory/member" data-text="{realname}({phone})" data-term="realname" data-filters='{"role_id": "5"}' data-placeholder="请输入真实姓名查找"></select>
		</div>
	</div>
	<div class="form-group col-sm-4">
		<label class="col-md-3 control-label" for="aid">代理商</label>
		<div class="col-md-9">
			<select name="filters[aid][in][]" id="aid" class="suggest-model form-control" data-model="factory/agent" data-text="{name}" data-selection="{name}" data-term="name" data-placeholder="请输入代理商名字" value="<{$_filters.aid.in|default:[]|implode:','}>" multiple="multiple"></select>
		</div>
	</div>

	<div class="form-group col-sm-4">
		<label class="col-md-3 control-label" for="created_at-min">加入时间</label>
		<div class="col-md-9">
			<div class="input-group input-daterange">
				<input type="text" id="created_at-min" name="filters[created_at][min]" class="form-control text-center" placeholder="开始时间" value="<{$_filters.created_at.min}>">
				<span class="input-group-addon">～</span>
				<input type="text" id="created_at-max" name="filters[created_at][max]" class="form-control text-center" placeholder="结束时间" value="<{$_filters.created_at.max}>">
			</div>
		</div>
	</div>
	<div class="form-group col-sm-12 text-right">
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 检索</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重置</button>
	</div>
	<div class="clearfix"></div>
</form>
<!-- END Form Content -->
<script>
(function($){
	$().ready(function(){
		$('#created_at-min').on('focus',function(){
			WdatePicker({
				skin: 'twoer',
				isShowClear:true,
				readOnly:true,
				dateFmt:'yyyy-MM-dd',
				isShowOthers:false,
				maxDate: '#F{$dp.$D(\'created_at-max\')}'
			});
		});
		$('#created_at-max').on('focus',function(){
			WdatePicker({
				skin: 'twoer',
				isShowClear:true,
				readOnly:true,
				dateFmt:'yyyy-MM-dd',
				isShowOthers:false,
				minDate: '#F{$dp.$D(\'created_at-min\')}'
			});
		});
	});
})(jQuery);
</script>