<?php
namespace App;

use Addons\Core\Models\Model;
use App\User;
use App\Role;
use App\Factory;
use App\Agent;
class AgentAudit extends Model{
	public $auto_cache = true;
	protected $guarded = ['id'];

	protected $casts = [
		'audited' => 'boolean',
		'brand_ids' => 'array',
	];

	public function factory()
	{
		return $this->hasOne('App\\Factory', 'id', 'fid');
	}

	public function doAudit()
	{
		if ($this->audited) return false;

		$factory = Factory::find($this->fid);
		if (empty($factory)) return false;

		$user = (new User)->get($this->username) ?: (new User)->add([
			'username' => $this->username,
			'password' => substr($this->idcard, -6),
			'realname' => $this->realname,
			'idcard' => $this->idcard,
			'phone' => $this->username,
		], Role::AGENT);

		$agent = Agent::find($user->getKey()) ?: Agent::create([
			'id' => $user->getKey(),
			'name' => $this->name,
			'phone' => $this->phone,
			'address' => $this->address,
		]);

		$user->roles()->sync([Role::where('name', Role::AGENT)->firstOrFail()->getKey()], false);
		$factory->agents()->sync([$agent->getKey()], false);
		$agent->brands()->sync($this->brand_ids, false);

		$this->audited = true;
		$this->save();

		return true;
	}
}
