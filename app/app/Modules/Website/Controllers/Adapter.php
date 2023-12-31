<?php namespace App\Modules\Website\Controllers;
use App\Controllers\BaseController;
use App\Models\Common_model;
use App\Views;

class Adapter extends BaseController {

	public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger){
        parent::initController($request, $response, $logger);
        $security 	 = \Config\Services::security();
       $this->response;
    }

	public function javascript()
	{

		$this->response->setStatusCode(200);
		$this->response->setContentType('text/javascript');
		$this->response->setHeader('Access-Controll-Allow-Headers', '*');
		$this->response->setHeader('Access-Controll-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');

		$data['settings'] 	= $this->common_model->findById('setting', array('setting_id'=>1));
		$data['active_language'] = $this->session->lang ? $this->session->lang:$data['settings']->language;
		$market_symbol 		= $this->request->getGet('market');

		if(!empty($market_symbol)){

			$symbol = $market_symbol;

		} else {

			$symbol = "LTC_BTC";
		}

		$data['market_details'] = $this->common_model->findById("dbt_coinpair", array('status' => 1, "symbol" => $symbol));
		
		
		$data['fee_to']         = $this->common_model->findById('dbt_fees', array('level' => "BUY", "currency_symbol" => @$data['market_details']->market_symbol));
		$data['fee_from']       = $this->common_model->findById('dbt_fees', array('level' => "SELL", "currency_symbol" => @$data['market_details']->market_symbol));
		$coin    				= $this->common_model->get_all('dbt_cryptocoin', array('show_home' => 1), 'coin_position', 'asc');
	
		$coin_stream = "";
        foreach ($coin as $coin_key => $coin_value) {
            $coin_stream .= "5~CCCAGG~".$coin_value->symbol."~USD,";
        }

        $data['coin_stream'] 	= rtrim($coin_stream, ',');
        $data['get_csrf_hash']	= csrf_hash();
        $data['csrf_token'] 	= csrf_token();

        $data['gateway']	= $this->common_model->findById('payment_gateway', array('identity' => "phone"));
        $gateway_bank 		= $this->common_model->findById('payment_gateway', array('identity' => "bank"));
		
		
		if(!empty($gateway_bank)){
		    $data['gateway_bank'] = $gateway_bank->public_key;
		}
	    $eslectText ="";
	    $languages = $this->languageList();
	    foreach($languages as $ln) {
          $eslectText .= "REPLACE(".strtolower($ln).", \"'\", ' ') as ".strtolower($ln).", ";
	    }

		$sql = "SELECT ".$eslectText." phrase FROM language";
		
		$test1 = $this->db->query($sql, [])->getResult();

		$newarray = [];
        foreach ($test1 as $key => $value) {
            $newarray = array_merge($newarray,array($value->phrase => $value));
        }

		$data['language'] = json_encode($newarray);
		//echo "<pre>";
        //print_r($data['language']); die();

		$theme   	   =  $this->common_model->findById("dbt_theme", array('status' => 1));
		$data['theme'] = $theme->settings;

		$cryptoconfig 		= $this->common_model->findById('external_api_setup', array('id'=>3));
        $apiData  			= json_decode($cryptoconfig->data);
        $data['crypto_key'] = $apiData->api_key;

		echo view('javascript',$data);
	}	
	public function css()
	{
		$this->response->setStatusCode(200);
		$this->response->setContentType('text/css');
		$this->response->setHeader('Access-Controll-Allow-Headers', '*');
		$this->response->setHeader('Access-Controll-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
		
		$theme   	   = $this->common_model->findById('dbt_theme', array('status' => 1));
		$data['theme'] = json_decode($theme->settings);

		echo view('view_css',$data);
	}

	public function languageList()
    { 
        if ($this->db->tableExists("language")) { 

            $fields = $this->db->getFielddata("language");
            $i = 1;
            foreach ($fields as $field)
            {  
                if ($i++ > 2)
                $result[$field->name] = ucfirst($field->name);
            }

            if (!empty($result)) return $result;
        } else {

            return false;
        }
    }
}