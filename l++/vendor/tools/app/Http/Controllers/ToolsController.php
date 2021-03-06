<?php
namespace Plugins\Tools\App\Http\Controllers;

use Addons\Core\Controllers\Controller;
use Illuminate\Http\Request;
use Cache;
class ToolsController extends Controller {

	public function index()
	{
		return $this->view('tools::system.tools');
	}

	public function clearCacheQuery()
	{
		//Cache
		Cache::flush();
		//smarty
		$smarty = (new \Addons\Smarty\View\Engine(app('config')))->getSmarty();
		$smarty->clearAllCache();
		$smarty->clearCompiledTemplate();
		//other files
		foreach([storage_path('attachments'), storage_path('debugbar'), storage_path('placeholders'), storage_path('utils'), storage_path('framework/cache'), storage_path('framework/views'), storage_path('smarty/compile'), ] as $value)
		{
			@rename($value.'/.gitignore', $newfile = storage_path('.gitignore,'.rand()));
			@rmdir_recursive($value, TRUE);
			@rename($newfile, $value.'/.gitignore');
		}

		$compiledPath = app()->getCachedCompilePath();
		$servicesPath = app()->getCachedServicesPath();

		if (file_exists($compiledPath)) {
			@unlink($compiledPath);
		}

		if (file_exists($servicesPath)) {
			@unlink($servicesPath);
		}

		return $this->success(array('title' => '清理成功', 'content' => '缓存清理成功'), FALSE);
	}

	public function createStaticFolderQuery()
	{
		$target_path = normalize_path(APPPATH.'../static');
		$link_path = normalize_path(APPPATH . 'static/common');
		@$this->_symlink($target_path, $link_path);

		$target_path = normalize_path(PLUGINSPATH.'static');
		$link_path = normalize_path(APPPATH . 'static/plugins');
		@$this->_symlink($target_path, $link_path);

		return $this->success(array('title' => '指向成功', 'content' => 'static目录指向成功'), FALSE);
	}

	private function _symlink($target_path, $link_path)
	{
		@unlink($link_path);@rmdir($link_path);
		if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' && version_compare(php_uname('r'), '6.0', '<')) { //Windows Vista以下
			exec('"'.APPPATH.'../static/bin/junction.exe" -d "'.$link_path.'"');
			exec('"'.APPPATH.'../static/bin/junction.exe" '.$link_path.'" "'.$target_path.'"');
		} else {
			symlink($target_path, $link_path);
		}
	}
}