<?php
namespace App;

use Addons\Core\Models\Model;
use App\User;
use App\Role;
use App\Store;
use App\Agent;
class StoreAudit extends Model{
	public $auto_cache = true;
	protected $guarded = ['id'];

	protected $casts = [
		'audited' => 'boolean',
		'brand_ids' => 'array',
	];

	public function agent()
	{
		return $this->hasOne('App\\Agent', 'id', 'aid');
	}

	public function doAudit()
	{
		if ($this->audited) return false;

		$agent = Agent::find($this->aid);
		if (empty($agent)) return false;

		$user = (new User)->get($this->username) ?: (new User)->add([
			'username' => $this->username,
			'password' => substr($this->idcard, -6),
			'realname' => $this->realname,
			'idcard' => $this->idcard,
			'phone' => $this->username,
		], Role::STORE);

		$store = Store::find($user->getKey()) ?: Store::create([
			'id' => $user->getKey(),
			'name' => $this->name,
			'phone' => $this->phone,
			'address' => $this->address,
		]);

		$user->roles()->sync([Role::where('name', Role::STORE)->firstOrFail()->getKey()], false);
		$agent->stores()->sync([$store->getKey()], false);
		$store->brands()->sync($this->brand_ids, false);

		$this->audited = true;
		$this->save();

		return true;
	}
}
