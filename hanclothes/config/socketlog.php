<?php

return [
	'enable'=>true, //是否记录日志的开关
	'host'=>'www.load-page.com',
	//是否显示利于优化的参数，如果允许时间，消耗内存等
	'optimize'=>false,
	'show_included_files'=>false,
	'error_handler'=>true,
	//日志强制记录到配置的client_id
	'force_client_id'=>'slog_48047c',
	//限制允许读取日志的client_id
	'allow_client_ids'=>array('slog_48047c')
];