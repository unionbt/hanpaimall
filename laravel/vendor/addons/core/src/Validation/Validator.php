<?php
namespace Addons\Core\Validation;
 
use Illuminate\Validation\Validator as BaseValidator;
use Addons\Core\Models\Field;
/**
 * 本Class主要是处理宽字符的长度、Fields检索等
 * 
 */
class Validator extends BaseValidator {
  
	/**
	 * Allow only alphabets, spaces and dashes (hyphens and underscores)
	 *
	 * @param string $attribute
	 * @param mixed $value
	 * @return bool
	 */
	protected function validateAnsi( $attribute, $value, $parameters )
	{
		return true;
	}

	protected function validatePhone($attribute, $value, $parameters)
	{
		$patten = '/[0-9\-\s]*/i';empty($parameters) && $parameters = ['cn'];
		switch (strtolower($parameters[0])) {
			case 'us':
				break;
			default: //cn
				//如：010-12345678、0912-1234567、(010)-12345678、(0912)1234567、(010)12345678、(0912)-1234567、01012345678、09121234567
				$patten = '/^(((\+86|086|17951)[\-\s])?1([358][0-9]|7[01678]|4[57])[\-\s]?[0-9]{4}[\-\s]?[0-9]{4}|(^0\d{2}-?\d{8}$)|(^0\d{3}-?\d{7}$)|(^\(0\d{2}\)-?\d{8}$)|(^\(0\d{3}\)-?\d{7}$))$/';
				break;
		}
		return preg_match($patten, $value);
	}

	protected function validateNotZero($attribute, $value, $parameters)
	{
		if (!is_numeric($value)) return true;
		$value += 0;
		return !empty($value);
	}

	protected function validateField($attribute, $value, $parameters)
	{
		return (new Field())->exists($value, empty($parameters) ? $attribute : $parameters[0]);
	}

	protected function validateFieldName($attribute, $value, $parameters)
	{
		return (new Field())->exists_name($value, empty($parameters) ? $attribute : $parameters[0]);
	}

	protected function validateIdCard($attribute, $value, $parameters)
	{
		$patten = '/[0-9\-\s]*/i';empty($parameters) && $parameters = ['cn'];
		switch (strtolower($parameters[0])) {
			case 'us':
				$patten = '/^\d{6}-\d{2}-\d{4}$/';
				break;
			default: //cn
				$patten = '/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/';
				if(strlen($value) == 18) {
					$idCardWi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ]; //将前17位加权因子保存在数组里
					$idCardY = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ]; //这是除以11后，可能产生的11位余数、验证码，也保存成数组
					$idCardWiSum = 0; //用来保存前17位各自乖以加权因子后的总和
					for($i = 0; $i < 17; $i++)
						$idCardWiSum += $value[$i] * $idCardWi[$i];
					$idCardMod = $idCardWiSum % 11;//计算出校验码所在数组的位置
					$idCardLast = $value[17];//得到最后一位身份证号码

					//如果等于2，则说明校验码是10，身份证号码最后一位应该是X
					if($idCardMod == 2){
	 					if(strtolower($idCardLast) != 'x')
							return false;
					} else {
	 					//用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
	 					if($idCardLast != $idCardY[$idCardMod])
	  						return false;
	 				}
 				}
				break;
		}
		return preg_match($patten, $value);
	}

	/**
	 * Get the size of an attribute.
	 *
	 * @param  string  $attribute
	 * @param  mixed   $value
	 * @return mixed
	 */
	protected function getSize($attribute, $value)
	{
		$hasNumeric = $this->hasRule($attribute, $this->numericRules);

		// This method will determine if the attribute is a number, string, or file and
		// return the proper size accordingly. If it is a number, then number itself
		// is the size. If it is a file, we take kilobytes, and for a string the
		// entire length of the string will be considered the attribute size.
		if (is_numeric($value) && $hasNumeric) {
			return array_get($this->data, $attribute);
		} elseif (is_array($value)) {
			return count($value);
		} elseif ($value instanceof File) {
			return $value->getSize() / 1024;
		}

		//宽字节按照字体的几个宽度计算，比如「微软雅黑」下，汉字占据两个显示宽度
		$rule = $this->getRule($attribute, 'Ansi');
		$ansiWidth = empty($rule) || empty($rule[1]) ? 1 : intval($rule[1][0]);

		return strlen_ansi($value, NULL, $ansiWidth);
		//return mb_strlen($value);
	}

	public function getParsedRules()
	{
		$rules = [];
		foreach ($this->rules as $attribute => $_list)
		{
			foreach ($_list as $rule)
			{
				list($rule, $parameters) = $this->parseRule($rule);
				$rules[$attribute][$rule] = empty($parameters) ? true : (count($parameters) == 1 ? $parameters[0] : $parameters); 
			}
		}
		return $rules;
	}

	private function isNumeric($rule_list)
	{
		foreach ($rule_list as $rule => $value) 
			return in_array(strtolower($rule), ['digits', 'digitsbetween', 'numeric', 'integer']);
		return false;
	}

	public function getjQueryRules()
	{
		$jqueryRules = [];
		$rules = $this->getParsedRules();
		foreach($rules as $attribute => $_list)
		{ //3
			$jqueryRules[$attribute] = [];
			foreach($_list as $rule => $parameters)
			{ //2
				if (empty($rule)) continue;
				$rule = strtolower($rule);
				switch ($rule) { // 1
					case 'alpha':
						$rule = 'regex';
						$parameters = '/^[\w]+$/i';
						break;
					case 'alphadash':
						$rule = 'regex';
						$parameters = '/^[\w_-]+$/i';
						break;
					case 'alpha_num':
						$rule = 'regex';
						$parameters = '/^[\w\d]+$/i';
						break;
					case 'ansi':
						$parameters = $parameters === true ? 2 : $parameters;
						break;
					case 'notin':
						$rule = 'regex';
						$parameters = '(?!('.implode('|', array_map('preg_quote', $parameters)).'))';
						break;
					case 'in':
						$rule = 'regex';
						$parameters = '('.implode('|', array_map('preg_quote', $parameters)).')';
						break;
					case 'digits':
						if (!empty($parameters))
						{
							$jqueryRules[$attribute] += ['rangelength' => [$parameters, $parameters]];
							$parameters = true;
						}
						break;
					case 'digitsbetween':
						$jqueryRules[$attribute] += ['rangelength' => [$parameters[0], $parameters[1]]];
						$rule = 'digits';
						$parameters = true;
						break;
					case 'ip':
						$rule = 'regex';
						$parameters = '\d{1,3}\\.\d{1,3}\\.\d{1,3}\\.\d{1,3}';
						break;
					case 'boolean':
						$rule = 'regex';
						$parameters = '(true|false|1|0)';
						break;
					case 'size':
						$rule = $this->isNumeric($_list) ? 'range' : 'rangelength';
						$parameters = [$parameters, $parameters];
						break;
					case 'requiredwithoutall': //任意一个有值
						$rule = 'require_from_group';
						$attribute =  [1, implode(',', array_map(function($v) {return '[name="'.$v.'"]';}, $parameters))];
						break;
					case 'requiredwithout': //任意一个有值
						$rule = 'require_from_group';
						$attribute =  [count($parameters) > 1 ? count($parameters) - 1 : 1, implode(',', array_map(function($v) {return '[name="'.$v.'"]';}, $parameters))];
						break;
					case 'max':
						$rule = $this->isNumeric($_list) ? 'max' : 'maxlength';
						break;
					case 'min':
						$rule = $this->isNumeric($_list) ? 'min' : 'minlength';
						break;
					case 'between':
						$rule = 'range';
						break;
					case 'confirmed': //交換兩者的attribute
						$parameters = '[name="'.$attribute.'"]';
						$attribute = $attribute.'_confirmation';
						!isset($jqueryRules[$attribute]) && $jqueryRules[$attribute] = [];
					case 'same':
						$rule = 'equalTo';
						break;
					case 'mimes':
						$rule = 'extension';
						$attribute = implode('|', $parameters);
						break;
					case 'accepted':
						$rule = 'required';
						break;
					case 'activeurl':
						$rule = 'url';
						break;
					case 'dateformat':
						$rule = 'date';
						break;
					case 'integer':
						$rule = 'digits';
						break;
					case 'numeric':
						$rule = 'number';
						break;
					case 'field':
						$rule = 'digits';
						break;
					case 'fieldname':
						$rule = 'regex';
						$parameters = '/^[\pL\pM\pN_-]+$/u';
						break;
					//case 'date':
					//	$rule = 'regex';
					//	$parameters = '(1[1-9]\d{2}|20\d{2}|2100)-([0-1]?[1-9]|1[0-2])-([0-2]?[1-9]|3[0-1]|[1-2]0)(\s([0-1]?\d|2[0-3]):([0-5]?\d)(:([0-5]?\d))?)?';
					//	break;
					case 'before':
					case 'different':
					case 'exists':
					case 'image':
					case 'array':
					case 'requiredif':
					case 'requiredwith':
					case 'requiredwithall':
					case 'string':
					case 'timezone':
					case 'unique':
						continue 2;
					default: //email url regex required ansi phone idcard notzero
						
						break;
				}
				$jqueryRules[$attribute] +=  [$rule => $parameters];
			}
		}
		foreach ($jqueryRules as $key => $value)
			if (empty($value)) unset($jqueryRules[$key]);

		return $jqueryRules;
	}
 
}   //end of class
 
 
//EOF