<?php

namespace App;

use Addons\Core\Models\UserFinance as BaseUserFinance;

class UserFinance extends BaseUserFinance 
{
    public function bills()
    {
        return $this->hasMany('App\\Bill', 'uid', 'id');
    }
}
