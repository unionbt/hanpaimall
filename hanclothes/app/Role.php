<?php

namespace App;

use Addons\Core\Models\Role as BaseRole;

class Role extends BaseRole
{
	const FACTORY = 'factory';
	const AGENT = 'agent';
	const STORE = 'store';
}
