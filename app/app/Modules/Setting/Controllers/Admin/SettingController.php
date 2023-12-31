<?php namespace App\Modules\Setting\Controllers\Admin;

require_once(APPPATH.'Libraries/phpoffice/phpspreadsheet/vendor/autoload.php');
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class SettingController extends BaseController
{
    //check setting table row if not exists then insert a row
    public function check_setting()
    {
        if ($this->common_model->countRow('setting', array()) == 0) {
            $this->db->insert('setting',[
                'title'         => 'bdtask Treading System',
                'description'   => '123/A, Street, State-12345, Demo',
                'time_zone'     => 'Asia/Dhaka',
                'footer_text'   => '2018&copy;Copyright',
            ]);
        }
    }
  
    public function index(){


        $this->check_setting();
        #-------------validation start------------------#
        $this->validation->setRule('title',display('website_title'),'required|max_length[50]');
        $this->validation->setRule('description', display('address') ,'max_length[255]');
        $this->validation->setRule('email',display('email'),'max_length[100]|valid_email');
        $this->validation->setRule('phone',display('phone'),'max_length[20]');
        $this->validation->setRule('language',display('language'),'max_length[250]'); 
        $this->validation->setRule('footer_text',display('footer_text'),'max_length[255]'); 
        $this->validation->setRule('time_zone',display('time_zone'),'required|max_length[100]'); 
        #-------------validation end------------------#
        $this->validation->setRule('favicon', "Favicon", "ext_in[favicon,png,jpg,gif,ico]|is_image[favicon]");
        $this->validation->setRule('logo', display('dashboard_logo'), "ext_in[logo,png,jpg,gif,ico]|is_image[logo]");
        $this->validation->setRule('logo_web', display('dashboard_logo'), "ext_in[logo_web,png,jpg,gif,ico]|is_image[logo_web]");
      

        if($this->validation->withRequest($this->request)->run()){

            $logo_image_path = $this->imageupload->upload_image($this->request->getFile('logo'), 'upload/settings/', $this->request->getPost('old_logo'), 155, 50);

        } else {

            $logo_image_path = "";
        }
        if($this->validation->withRequest($this->request)->run()){

            $favicon_image_path = $this->imageupload->upload_image($this->request->getFile('favicon'), 'upload/settings/', $this->request->getPost('old_favicon'), 35, 35);

        } else {

            $favicon_image_path = "";
        }
        if($this->validation->withRequest($this->request)->run()){

            $logo_web_image_path = $this->imageupload->upload_image($this->request->getFile('logo_web'), 'upload/settings/', $this->request->getPost('old_web_logo'), 155, 50);

        } else {

            $logo_web_image_path = "";
        }

        $data['setting'] = (object)$postData = [
            
            'setting_id'  => $this->request->getPost('setting_id', FILTER_UNSAFE_RAW),
            'title'       => $this->request->getPost('title', FILTER_UNSAFE_RAW),
            'description' => $this->request->getPost('description', FILTER_UNSAFE_RAW),
            'siteDescription' => $this->request->getPost('siteDescription', FILTER_UNSAFE_RAW),
            'sitekeywords' => $this->request->getPost('sitekeywords', FILTER_UNSAFE_RAW),
            'email'       => $this->request->getPost('email', FILTER_UNSAFE_RAW),
            'phone'       => $this->request->getPost('phone', FILTER_UNSAFE_RAW),
            'logo'        => $logo_image_path,
            'logo_web'    => $logo_web_image_path,
            'favicon'     => $favicon_image_path,
            'language'    => $this->request->getPost('language', FILTER_UNSAFE_RAW), 
            'show_trademenu_without_verify'    => $this->request->getPost('show_trademenu_without_verify', FILTER_UNSAFE_RAW), 
            'email_verify'    => $this->request->getPost('email_verify', FILTER_UNSAFE_RAW), 
            'phone_verify'    => $this->request->getPost('phone_verify', FILTER_UNSAFE_RAW), 
            'kyc_verify'    => $this->request->getPost('kyc_verify', FILTER_UNSAFE_RAW), 
            'time_zone'   => $this->request->getPost('time_zone', FILTER_UNSAFE_RAW), 
            'site_align'  => $this->request->getPost('site_align', FILTER_UNSAFE_RAW), 
            'office_time' => $this->request->getPost('office_time', FILTER_UNSAFE_RAW), 
            'latitude'    => $this->request->getPost('latitude', FILTER_UNSAFE_RAW), 
            'footer_text' => $this->request->getPost('footer_text', FILTER_UNSAFE_RAW),
        ]; 

        if($this->request->getMethod() == 'post'){

            //From Validation Check
            if ($this->validation->withRequest($this->request)->run()) {

                if (empty($postData['setting_id'])) 
                {
                    if ($this->common_model->save('setting', $postData)) {
                        $this->session->setFlashdata('message', display('save_successfully'));

                    } else {
                        $this->session->setFlashdata('exception', display('please_try_again'));

                    }
                    return  redirect()->to(base_url('/backend/setting/app-setting'));

                } else {

                    if ($this->common_model->update('setting', $postData, array('setting_id' => $postData['setting_id']))) {
                        $this->session->setFlashdata('message', display('update_successfully'));

                    } else {
                        $this->session->setFlashdata('exception', display('please_try_again'));
                    }

                    $this->session->remove('lang');

                   return  redirect()->to(base_url('/backend/setting/app-setting'));

                }

            } else { 

                $this->session->setFlashdata("exception", $this->validation->listErrors());
                return  redirect()->to(base_url('/backend/setting/app-setting'));
            }

        } else {

            $data['languageList'] = $this->languageList(); 
            $data['setting']      = $this->common_model->findById('setting', array());

            $data['content'] = $this->BASE_VIEW . '\settings\setting';
            return $this->template->admin_layout($data);
        }
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


    public function security(){

        $data['title'] = display('application_setting');
        $this->check_setting();
        #-------------validation start------------------#
        $this->validation->setRule('site_key','Site Key','required|trim');
        $this->validation->setRule('secret_key','Secret Key','required|trim'); 
        #-------------validation end------------------#

        if($this->request->getMethod() == 'post'){

            //From Validation Check
            if ($this->validation->withRequest($this->request)->run()) {

                $site_key        = $this->request->getPost('site_key', FILTER_UNSAFE_RAW);
                $secret_key      = $this->request->getPost('secret_key', FILTER_UNSAFE_RAW);
                $capture_status  = $this->request->getPost('capture_status', FILTER_UNSAFE_RAW)==1?1:0;
                $capture_data = array(

                    'site_key'  =>$site_key,
                    'secret_key'=>$secret_key,
                );
                $capture_data = json_encode($capture_data);

                $this->common_model->update('dbt_security', array('status' => $capture_status, 'data' => $capture_data), array('keyword' => 'capture'));

                $this->session->setFlashdata('message','Update Successfully!');
                return redirect()->route('backend/setting/security');

            } else { 

                $this->session->setFlashdata("exception", $this->validation->listErrors());
                return redirect()->route('backend/setting/security');
            }

        } else {

            $data['security']     = $this->db->table('dbt_security')->select('*')->get()->getResult();
            $data['url']          = "http://".$_SERVER["HTTP_HOST"].str_replace(basename($_SERVER["SCRIPT_NAME"]), "", $_SERVER["SCRIPT_NAME"]);
            $data['languageList'] = $this->languageList(); 
            $data['setting']      = $this->common_model->findById('setting', array());

            $data['content'] = $this->BASE_VIEW . '\settings\security';
            return $this->template->admin_layout($data);
        }
    }


    public function blocklist(){


        $page_number      = (!empty($this->request->getGet('page'))?$this->request->getGet('page'):1);
        //findAll paramiter = where, limit, offset.
        $data['blocklist']  = $this->common_model->get_all('dbt_blocklist', array(),'id', 'desc', 20,($page_number-1)*20);
        $total            = $this->common_model->countRow('dbt_blocklist', array());
        $data['pager']    = $this->pager->makeLinks($page_number, 20, $total, 'pagination_template');

        $data['content'] = $this->BASE_VIEW . '\settings\blocklist';
        return $this->template->admin_layout($data);
    }

    public function delete_block($id = null)
    { 
       
        if ($this->common_model->delete('dbt_blocklist', array('id' => $id))){
            $this->session->setFlashdata('message', display('delete_successfully'));
        } else {
            $this->session->setFlashdata('exception', display('please_try_again'));
        }
        return redirect()->route('backend/setting/block-list');
    }

    public function fees_settig(){

        $data['coins']     = $this->common_model->findAllGroupBy('dbt_cryptocoin', array('status' => 1), 'symbol', 'rank', 'asc');
        $page_number      = (!empty($this->request->getGet('page'))?$this->request->getGet('page'):1);
        //findAll paramiter = where, limit, offset.
        $data['fees_data'] = $this->common_model->get_all('dbt_fees', array(),'id', 'desc', 20,($page_number-1)*20);
        $total             = $this->common_model->countRow('dbt_fees', array());
        $data['pager']     = $this->pager->makeLinks($page_number, 20, $total, 'pagination_template');

        $data['content'] = $this->BASE_VIEW . '\settings\fees_setting';
        return $this->template->admin_layout($data);
    }

    public function fees_setting_save()
    {

        $this->validation->setRule('coin_id', "Coin Name",'required|trim|max_length[20]');
        $this->validation->setRule('level', "Level",'required|trim|max_length[20]');
        $this->validation->setRule('fees', "Fees Pecentage",'required|trim|max_length[20]');

        if ($this->validation->withRequest($this->request)->run()) {
      
            $check = $this->common_model->findById('dbt_fees', array('level' => $this->request->getPost('level'), 'currency_symbol' => $this->request->getPost('coin_id')));

            if(!empty($check)){
                $this->session->setFlashdata('exception', display('this_level_already_exist'));
                return redirect()->route('backend/setting/fees-setting');
            } else {
                $fees = array(
                    'level'=>$this->request->getPost('level', FILTER_UNSAFE_RAW),
                    'fees'=>$this->request->getPost('fees', FILTER_UNSAFE_RAW),
                    'currency_symbol'=>$this->request->getPost('coin_id', FILTER_UNSAFE_RAW),
                    'status'=>1,
                );
                $this->common_model->save('dbt_fees',$fees);
                $this->session->setFlashdata('message',display('fees_setting_successfully'));
                return redirect()->route('backend/setting/fees-setting');
            }
        } else {

            $this->session->setFlashdata("exception", $this->validation->listErrors());
            return redirect()->route('backend/setting/fees-setting');
        }
    }

    public function delete_fees_setting($id = null)
    { 
       
        if ($this->common_model->delete('dbt_fees', array('id' => $id))){
            $this->session->setFlashdata('message', display('delete_successfully'));
        } else {
            $this->session->setFlashdata('exception', display('please_try_again'));
        }
        return redirect()->route('backend/setting/fees-setting');
    }

    public function transaction_setup(){

        $page_number       = (!empty($this->request->getGet('page'))?$this->request->getGet('page'):1);
        $data['transaction_setup'] = $this->common_model->get_all('dbt_transaction_setup', array(),'id', 'asc', 25,($page_number-1)*25);
        $total             = $this->common_model->countRow('dbt_transaction_setup', array());
        $data['pager']     = $this->pager->makeLinks($page_number, 25, $total, 'pagination_template');

        $data['coins']      = $this->common_model->findAllGroupBy('dbt_cryptocoin', array() , 'symbol', 'rank', 'asc');

        $data['content']   = $this->BASE_VIEW . '\settings\transaction_setup';
        return $this->template->admin_layout($data);
    }

    public function transaction_save()
    {

        $this->validation->setRule('currency_symbol', "Coin Name",'required|trim|max_length[20]');
        $this->validation->setRule('trntype', "Transaction Type",'required|trim|max_length[20]');
        $this->validation->setRule('acctype', "Account Type",'required|trim|max_length[50]');
        $this->validation->setRule('upper', "Max Limit Amount",'required|trim|max_length[50]');
        $this->validation->setRule('lower', "Min Limit Amount",'required|trim|max_length[50]');

        if ($this->validation->withRequest($this->request)->run()) {
       
                $check = $this->common_model->findById('dbt_transaction_setup', array('trntype' => $this->request->getPost('trntype'), 'acctype' => $this->request->getPost('acctype'), 'currency_symbol' => $this->request->getPost('currency_symbol'), 'network_type' => $this->request->getPost('network_type')));

                if(!empty($check)){
                    $this->session->setFlashdata('exception', display('this_level_already_exist'));
                    return redirect()->route('backend/setting/transaction-setup');

                } else {

                    $fees = array(

                        'trntype'         => $this->request->getPost('trntype', FILTER_UNSAFE_RAW),
                        'acctype'         => $this->request->getPost('acctype', FILTER_UNSAFE_RAW),
                        'currency_symbol' => $this->request->getPost('currency_symbol', FILTER_UNSAFE_RAW),
                        'network_type'    => '',
                        'lower'           => $this->request->getPost('lower', FILTER_UNSAFE_RAW),
                        'upper'           => $this->request->getPost('upper', FILTER_UNSAFE_RAW),
                        'duration'        => 7,
                        'status'          => 1
                    );

                    $this->common_model->save('dbt_transaction_setup',$fees);
                    $this->session->setFlashdata('message',display('save_successfully'));
                    return redirect()->route('backend/setting/transaction-setup');
                }
        } else {

                $this->session->setFlashdata("exception", $this->validation->listErrors());
                return redirect()->route('backend/setting/transaction-setup');
        }
    }

    public function delete_transaction($id = null)
    { 
       
        if ($this->common_model->delete('dbt_transaction_setup', array('id' => $id))){

            $this->session->setFlashdata('message', display('delete_successfully'));

        } else {

            $this->session->setFlashdata('exception', display('please_try_again'));
        }
        return redirect()->route('backend/setting/transaction-setup');
    }

    public function language(){

        $data['languages'] = $this->languageList();

        $data['content']   = $this->BASE_VIEW . '\language\main';
        return $this->template->admin_layout($data);
    }

    public function addLanguage()
    { 
        $dbforge = \Config\Database::forge();

        $language = preg_replace('/[^a-zA-Z0-9_]/', '', $this->request->getPost('language',FILTER_UNSAFE_RAW));
        $language = strtolower($language);

        if (!empty($language)) {

            if (!$this->db->fieldExists($language, "language")) {

                $dbforge->addColumn("language", [
                    $language => [
                        'type' => 'TEXT'
                    ]
                ]); 

                $this->session->setFlashdata('message', 'Language added successfully');
                return redirect()->route('backend/setting/language');

            } 

        } else {

            $this->session->setFlashdata('exception', display('please_try_again'));

        }
        return redirect()->route('backend/setting/language');
    }

    public function phrase(){


        $page_number      = (!empty($this->request->getGet('page'))?$this->request->getGet('page'):1);
        //findAll paramiter = where, limit, offset.
        $data['phrases']  = $this->common_model->get_all('language', array(),'id', 'desc', 20,($page_number-1)*20);
        $total            = $this->common_model->countRow('language', array());
        $data['pager']    = $this->pager->makeLinks($page_number, 20, $total, 'pagination_template');

        $data['content']  = $this->BASE_VIEW . '\language\phrase';
        return $this->template->admin_layout($data);
    }

    public function addPhrase() {  

        $lang = $this->request->getPost('phrase', FILTER_UNSAFE_RAW); 

        if (sizeof($lang) > 0) {

            if ($this->db->tableExists("language")) {

                if ($this->db->fieldExists("phrase", "language")) {

                    foreach ($lang as $value) {

                        $value = preg_replace('/[^a-zA-Z0-9_]/', '', $value);
                        $value = strtolower($value);

                        if (!empty($value)) {
                            
                            $num_rows = $this->common_model->findById('language', array('phrase' => $value));

                            if (empty($num_rows)) { 

                                $this->common_model->save('language',['phrase' => $value]); 
                                $this->session->setFlashdata('message', 'Phrase added successfully');

                            } else {

                                $this->session->setFlashdata('exception', 'Phrase already exists!');
                            }
                        }   
                    }  

                    return redirect()->route('backend/setting/phrase');
                }  
            }
        } 

        $this->session->setFlashdata('exception', 'Please try again');
        return redirect()->route('backend/setting/phrase');
    }

    public function editPhrase($language = null){


        $page_number      = (!empty($this->request->getGet('page'))?$this->request->getGet('page'):1);
        //findAll paramiter = where, limit, offset.
        $data['phrases']  = $this->common_model->get_all('language', array(),'id', 'asc', 20,($page_number-1)*20);

        $total            = $this->common_model->countRow('language', array());
        $data['pager']    = $this->pager->makeLinks($page_number, 20, $total, 'pagination_template');

        $data['search_result']  = "";
        $data['search_lang_id'] = "";

        if($this->session->get('search_lang_id') != null){

            $data['search_lang_id'] = $search_lang_id = $this->session->get('search_lang_id');
            $data['search_result']  = $this->common_model->findById('language', array('id' =>$search_lang_id));
        }

        $data['language'] = $language;
        $data['content']  = $this->BASE_VIEW . '\language\phrase_edit';
        return $this->template->admin_layout($data);
    }

    public function deletePhrase($language = null){

        $dbforge = \Config\Database::forge();
        $language = strtolower($language);
        $fields = $this->db->getFieldNames('language');
        
        if (!empty($language)) {
            if(count($fields) > 3) {
                if ($this->db->fieldExists($language, "language")) {
                    
                    if($dbforge->dropColumn("language",$language)){

                        echo json_encode(array('success' => true, 'message' => 'Language successfully deleted'));
                    } else {

                        echo json_encode(array('success' => false, 'message' => 'Something went wrong, please try again!'));
                    }                  

                } else {
                    echo json_encode(array('success' => false, 'message' => 'Language not exist!'));
                }

            } else {
                echo json_encode(array('success' => false , 'message' => 'Your can not delete all language!'));
            }             

        } else {
            echo json_encode(array('success' => false , 'message' => 'Language not found!'));
        }       
    }


    public function search($segment="")
    {
        
        $this->validation->setRule('search_box', "Search box",'required|trim|max_length[200]');
        if ($this->validation->withRequest($this->request)->run()) {

            $search_box = $this->request->getPost('search_box',FILTER_UNSAFE_RAW);

            $languagedata = $this->db->getFieldData('language');
            $search       = 0;

            foreach ($languagedata as $key => $value) {

                if($key == 0){

                    continue;
                }
                
                $search_result = $this->common_model->findById('language', array('phrase' => $search_box));

                if($search_result){

                    $search = $search_result->id;
                    break;
                }
            }

            if($search != 0){

                $this->session->setFlashdata('search_lang_id', $search);
                $this->session->setFlashdata('message', "We find your searching language");

            } else {

                $this->session->setFlashdata('exception', "Sorry, we couldn't find and language for '".$search_box."'");
            }

        } else {

            $this->session->setFlashdata('exception', validation_errors());
        }

        return redirect()->to(base_url("/backend/setting/edit-phrase/".$segment));
    }

    public function exportPhrase($language = null) {

        $all_language = $this->db->table('language')->get()->getResult();

        $file_name = $language . '.xlsx';

        $spreadsheet = new Spreadsheet();
        $sheet       = $spreadsheet->getActiveSheet();
        $sheet->setCellValue('A1', 'Phrase');
        $sheet->setCellValue('B1', 'Label');
        $count = 2;

        foreach ($all_language as $row) {
            $sheet->setCellValue('A' . $count, $row->phrase);
            $sheet->setCellValue('B' . $count, $row->$language);
            $count++;
        }

        $writer = new Xlsx($spreadsheet);

        $writer->save($file_name);
        header("Content-Type: application/vnd.ms-excel");
        header('Content-Disposition: attachment; filename="' . basename($file_name) . '"');
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length:' . filesize($file_name));
        flush();

        readfile($file_name);

        exit;
    }

    /**
     * Import Language Phrase
     *
     * @param [string] $language
     * @return view
     */
    public function importPhrase($language = null) {
       
        $this->validation->setRule('file', "Phrase", 'ext_in[file,csv,xls,xlsx]');

        if($this->validation->withRequest($this->request)->run()){
        
            if ($file = $this->request->getFile('file')) {

                if ($file->isValid()) {
                    $this->db->transBegin();

                    try {
                        $arr_file  = explode('.', $_FILES['file']['name']);
                        $extension = array_slice($arr_file, -1);

                        if ('csv' == $extension) {
                            $reader = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
                        } else {
                            $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
                        }

                        $spreadsheet = $reader->load($_FILES['file']['tmp_name']);
                        $sheetData   = $spreadsheet->getActiveSheet()->toArray();

                        $all_update_data = [];

                        /**
                         * Check Import Input file
                         */

                        if (!empty($sheetData)) {

                            for ($i = 1; $i < count($sheetData); $i++) {
                                $phrase = $sheetData[$i][0];
                                $label  = $sheetData[$i][1];

                                $phraseKey = $this->common_model->where_row('language', ['phrase' => $phrase]);

                                if ($phraseKey) {
                                    $all_update_data[] = [
                                        'phrase'  => $phrase,
                                        $language => $label,
                                    ];

                                }

                            }

                        }

                        /**
                         * Update All Phrase
                         */

                        if ($all_update_data && count($all_update_data)) {
                            $this->db->table('language')->updateBatch($all_update_data, 'phrase');

                            $this->db->transCommit();
                            $this->session->setFlashdata('message', 'Phrase Key Update Successfully');
                        } else {
                            $this->db->transRollback();
                            $this->session->setFlashdata('exception', 'Database Error 1');
                        }

                    } catch (\Throwable $th) {
                        $this->session->setFlashdata('exception', 'Database Error 2');
                        $this->db->transRollback();
                    }

                } else {
                    $this->session->setFlashdata('exception', 'Database Error 3');
                }

            } else {
                $this->session->setFlashdata('exception', 'Database Error 4');
            }

         } else {

            $this->session->setFlashdata('exception', 'Please try again!');
            return redirect()->to(base_url('backend/setting/edit-phrase/'.$language));
        }

        return redirect()->to(base_url('backend/setting/edit-phrase/'.$language));

    }

    public function addLebel() { 

        $language = $this->request->getPost('language', FILTER_UNSAFE_RAW);
        $phrase   = $this->request->getPost('phrase', FILTER_UNSAFE_RAW);
        $lang     = $this->request->getPost('lang', FILTER_UNSAFE_RAW);

        if (!empty($language)) {

            if ($this->db->tableExists('language')) {

                if ($this->db->fieldExists($language, 'language')) {

                    if (sizeof($phrase) > 0)

                    for ($i = 0; $i < sizeof($phrase); $i++) {

                        $datau = array($language => $lang[$i]);
                        $this->common_model->update('language', $datau, array('phrase' => $phrase[$i]));
                    }  

                    $this->session->setFlashdata('message', display('label_added_successfully'));
                    return redirect()->to(base_url("/backend/setting/edit-phrase/".$language));
                }  
            }
        } 

        $this->session->setFlashdata('exception', 'Please try again');
        return redirect()->to(base_url("/backend/setting/edit-phrase/".$language));
    }

    public function payment_gateway(){

        $data['payment_gateway'] = $this->common_model->findAll('payment_gateway', array(), 'id', 'asc', 15, 0);

        $data['module'] = "Settings";
        $data['page']   = 'payment_gateway/list'; 
        return $this->template->layout($data);
    }


    public function update_payment_gateway($id = null)
    { 
        $data['title']  = display('add_payment_gateway');
        $data_value = "";

        if ($this->request->getPost('identity')=='bitcoin') {

            $this->validation->setRule('status', display('status'),'required|max_length[10]');
            
            $public_key = serialize(array(

                $this->request->getPost('key1', FILTER_UNSAFE_RAW)  => $this->request->getPost('public_key', FILTER_UNSAFE_RAW),
                $this->request->getPost('key2', FILTER_UNSAFE_RAW)  => $this->request->getPost('public_key2', FILTER_UNSAFE_RAW),
                $this->request->getPost('key3', FILTER_UNSAFE_RAW)  => $this->request->getPost('public_key3', FILTER_UNSAFE_RAW),
                $this->request->getPost('key4', FILTER_UNSAFE_RAW)  => $this->request->getPost('public_key4', FILTER_UNSAFE_RAW),
                $this->request->getPost('key5', FILTER_UNSAFE_RAW)  => $this->request->getPost('public_key5', FILTER_UNSAFE_RAW),
                $this->request->getPost('key6', FILTER_UNSAFE_RAW)  => $this->request->getPost('public_key6', FILTER_UNSAFE_RAW),
                $this->request->getPost('key7', FILTER_UNSAFE_RAW)  => $this->request->getPost('public_key7', FILTER_UNSAFE_RAW),
                $this->request->getPost('key8', FILTER_UNSAFE_RAW)  => $this->request->getPost('public_key8', FILTER_UNSAFE_RAW),
                $this->request->getPost('key9', FILTER_UNSAFE_RAW)  => $this->request->getPost('public_key9', FILTER_UNSAFE_RAW),
                $this->request->getPost('key10', FILTER_UNSAFE_RAW) => $this->request->getPost('public_key10', FILTER_UNSAFE_RAW),
                $this->request->getPost('key11', FILTER_UNSAFE_RAW) => $this->request->getPost('public_key11', FILTER_UNSAFE_RAW),
                $this->request->getPost('key12', FILTER_UNSAFE_RAW) => $this->request->getPost('public_key12', FILTER_UNSAFE_RAW),
                $this->request->getPost('key13', FILTER_UNSAFE_RAW) => $this->request->getPost('public_key13', FILTER_UNSAFE_RAW)

            ));

            $private_key = serialize(array(

                $this->request->getPost('key1', FILTER_UNSAFE_RAW)  => $this->request->getPost('private_key', FILTER_UNSAFE_RAW),
                $this->request->getPost('key2', FILTER_UNSAFE_RAW)  => $this->request->getPost('private_key2', FILTER_UNSAFE_RAW),
                $this->request->getPost('key3', FILTER_UNSAFE_RAW)  => $this->request->getPost('private_key3', FILTER_UNSAFE_RAW),
                $this->request->getPost('key4', FILTER_UNSAFE_RAW)  => $this->request->getPost('private_key4', FILTER_UNSAFE_RAW),
                $this->request->getPost('key5', FILTER_UNSAFE_RAW)  => $this->request->getPost('private_key5', FILTER_UNSAFE_RAW),
                $this->request->getPost('key6', FILTER_UNSAFE_RAW)  => $this->request->getPost('private_key6', FILTER_UNSAFE_RAW),
                $this->request->getPost('key7', FILTER_UNSAFE_RAW)  => $this->request->getPost('private_key7', FILTER_UNSAFE_RAW),
                $this->request->getPost('key8', FILTER_UNSAFE_RAW)  => $this->request->getPost('private_key8', FILTER_UNSAFE_RAW),
                $this->request->getPost('key9', FILTER_UNSAFE_RAW)  => $this->request->getPost('private_key9', FILTER_UNSAFE_RAW),
                $this->request->getPost('key10', FILTER_UNSAFE_RAW) => $this->request->getPost('private_key10', FILTER_UNSAFE_RAW),
                $this->request->getPost('key11', FILTER_UNSAFE_RAW) => $this->request->getPost('private_key11', FILTER_UNSAFE_RAW),
                $this->request->getPost('key12', FILTER_UNSAFE_RAW) => $this->request->getPost('private_key12', FILTER_UNSAFE_RAW),
                $this->request->getPost('key13', FILTER_UNSAFE_RAW) => $this->request->getPost('private_key13', FILTER_UNSAFE_RAW)

            ));


        } elseif ($this->request->getPost('identity')=='bank'){

            $this->validation->setRule('acc_name', display('account_name'), 'required|trim');
            $this->validation->setRule('acc_no', display('account_no'), 'required|trim');
            $this->validation->setRule('branch_name', display('branch_name'), 'required|trim');
            $this->validation->setRule('country', display('country'), 'required|trim');
            $this->validation->setRule('bank_name', display('bank_name'), 'required|trim');


            $acc_name       = $this->request->getPost('acc_name', FILTER_UNSAFE_RAW);
            $acc_no         = $this->request->getPost('acc_no', FILTER_UNSAFE_RAW);
            $branch_name    = $this->request->getPost('branch_name', FILTER_UNSAFE_RAW);
            $swift_code     = $this->request->getPost('swift_code', FILTER_UNSAFE_RAW);
            $abn_no         = $this->request->getPost('abn_no', FILTER_UNSAFE_RAW);
            $country        = $this->request->getPost('country', FILTER_UNSAFE_RAW);
            $bank_name      = $this->request->getPost('bank_name', FILTER_UNSAFE_RAW);

            $post_data = $this->request->getPost();

            $public_key = json_encode($post_data);
            $private_key = $this->request->getPost('private_key', FILTER_UNSAFE_RAW);


        } elseif ($this->request->getPost('identity', FILTER_UNSAFE_RAW)=='coinpayment'){

            $this->validation->setRule('public_key', display('public_key'),'required|max_length[1000]');
            $this->validation->setRule('private_key', display('private_key'),'required|max_length[1000]');
            $this->validation->setRule('mercent_id', display('mercent_id'), 'required|trim');
            $this->validation->setRule('ipn_secret', display('ipn_secret'), 'required|trim');
            $this->validation->setRule('debug_email', display('debug_email'),'required|trim');
            $this->validation->setRule('coinpayment_wtdraw', 'Withdraw','required|trim');

            $public_key         = $this->request->getPost('public_key', FILTER_UNSAFE_RAW);
            $private_key        = $this->request->getPost('private_key', FILTER_UNSAFE_RAW);
            $mercent_id         = $this->request->getPost('mercent_id', FILTER_UNSAFE_RAW);
            $ipn_secret         = $this->request->getPost('ipn_secret', FILTER_UNSAFE_RAW);
            $debug_email        = $this->request->getPost('debug_email', FILTER_UNSAFE_RAW);
            $coinpayment_wtdraw = $this->request->getPost('coinpayment_wtdraw', FILTER_UNSAFE_RAW);
            
            if($this->request->getPost('debuging_active', FILTER_UNSAFE_RAW)){

                $debuging_active = 1;

            } else {

                $debuging_active = 0;
            }

            $post_data = array(

                'marcent_id'        => $mercent_id,
                'ipn_secret'        => $ipn_secret,
                'debug_email'       => $debug_email,
                'debuging_active'   => $debuging_active,
                'withdraw'          => $coinpayment_wtdraw
            );

            $data_value = json_encode($post_data);

        } else {
            $this->validation->setRule('public_key', display('public_key'),'required|max_length[1000]');
            $this->validation->setRule('private_key', display('private_key'),'required|max_length[1000]');

            $public_key  = $this->request->getPost('public_key', FILTER_UNSAFE_RAW);
            $private_key = $this->request->getPost('private_key', FILTER_UNSAFE_RAW);
        }

        $data['payment_gateway']    = (object)$userdata = array(

            'id'            => $this->request->getPost('id', FILTER_UNSAFE_RAW),
            'agent'         => $this->request->getPost('agent', FILTER_UNSAFE_RAW),
            'public_key'    => $public_key,
            'private_key'   => $private_key,
            'secret_key'    => $this->request->getPost('secret_key', FILTER_UNSAFE_RAW),
            'data'          => $data_value,
            'status'        => $this->request->getPost('status', FILTER_UNSAFE_RAW)
        );

        if($this->request->getMethod() == 'post'){

            if ($this->validation->withRequest($this->request)->run())
            {

                if ($this->common_model->update('payment_gateway', $userdata, array('id' => $id))) {

                    $this->session->setFlashdata('message', display('update_successfully'));

                } else {

                    $this->session->setFlashdata('exception', display('please_try_again'));
                }

                return redirect()->to(base_url("/backend/setting/update-gateway/".$id));

            } else {

                $this->session->setFlashdata("exception", $this->validation->listErrors());
            }
        }

        if(!empty($id)) {

            $data['payment_gateway']   = $this->common_model->findById('payment_gateway', array('id' => $id));
        }

        $data['countrys'] = $this->common_model->findAll('dbt_country', array(), 'id', 'asc', 300, 0);

        $data['module'] = "Settings";
        $data['page']   = 'payment_gateway/form'; 
        return $this->template->layout($data);
    }


    public function affiliation()
    {  
        
        $this->validation->setRule('commission', display('commission'),'max_length[100]|required|trim');
        $this->validation->setRule('type', display('type'),'max_length[11]|required|trim');
        $this->validation->setRule('status', display('status'),'max_length[1]|required|trim');

        $data['affiliation'] = (object)$userdata = array(

            'id'            => $this->request->getPost('id', FILTER_UNSAFE_RAW),
            'commission'    => $this->request->getPost('commission', FILTER_UNSAFE_RAW),
            'type'          => $this->request->getPost('type', FILTER_UNSAFE_RAW),
            'status'        => $this->request->getPost('status', FILTER_UNSAFE_RAW)
        );
        
        if($this->request->getMethod() == 'post'){

            if ($this->validation->withRequest($this->request)->run())
            {

                if ($this->common_model->update('dbt_affiliation', $userdata, array('id' => 1))) {

                    $this->session->setFlashdata('message', display('update_successfully'));

                } else {

                    $this->session->setFlashdata('exception', display('please_try_again'));
                }

                return redirect()->to(base_url("/backend/setting/affiliation"));

            } else {

                $this->session->setFlashdata("exception", $this->validation->listErrors());
            }
        }

        $data['affiliation'] = $this->common_model->findById('dbt_affiliation', array('id' => 1));
      
        $data['content']  = $this->BASE_VIEW . '\affiliation\affiliation';
        return $this->template->admin_layout($data);
    }


    public function extrnal_api_list(){

        $page_number   = (!empty($this->request->getGet('page'))?$this->request->getGet('page'):1);
        //findAll paramiter = where, limit, offset.
        $data['apis']  = $this->common_model->get_all('external_api_setup', array(),'id', 'asc', 20,($page_number-1)*20);
        $total         = $this->common_model->countRow('external_api_setup', array());
        $data['pager'] = $this->pager->makeLinks($page_number, 20, $total, 'pagination_template');

        $data['content']  = $this->BASE_VIEW . '\external_api\list';
        return $this->template->admin_layout($data);
    }

    public function update_external_api($id = null)
    { 

        $this->validation->setRule('name', display('name'),'required|max_length[50]');
        $this->validation->setRule('api_key', 'API Key','required|max_length[100]');

        $existingData = $this->common_model->findById('external_api_setup', array('id' => $id));
        $api_data = array();
        if (is_string($existingData->data) && is_array(json_decode($existingData->data, true)) && (json_last_error() == JSON_ERROR_NONE) ? true : false) {
            $api_data = json_decode($existingData->data, true);
        }

        $data['apis'] = (object)$userdata = array(

            'id'     => $this->request->getPost('id',FILTER_UNSAFE_RAW),
            'name'   => $this->request->getPost('name',FILTER_UNSAFE_RAW),
            'data'   => json_encode(array('api_key'=> $this->request->getPost('api_key',FILTER_UNSAFE_RAW),'create_link'=> $api_data['create_link'])),
            'status' => $this->request->getPost('status',FILTER_UNSAFE_RAW)

        );

        if($this->request->getMethod() == 'post'){

            if($this->validation->withRequest($this->request)->run())
            {

                $dataupdate = $this->common_model->update('external_api_setup', $userdata, array('id' => $id));
                if ($dataupdate) {

                    $this->session->setFlashdata('message', display('update_successfully'));

                } else {

                    $this->session->setFlashdata('exception', display('please_try_again'));
                }

                return redirect()->to(base_url("/backend/setting/update-external-api/".$id));

            } else {

                $this->session->setFlashdata("exception", $this->validation->listErrors()); 
                return redirect()->to(base_url("/backend/setting/update-external-api/".$id)); 

            }

        } else {

            if(!empty($id)) {

                $data['apis']  = $this->common_model->findById('external_api_setup', array('id' => $id));
            } 
        }

        $data['content']  = $this->BASE_VIEW . '\external_api\form';
        return $this->template->admin_layout($data);
    }

    /*
    |----------------------------
    |   email Gateway
    |----------------------------
    */   
    public function email_gateway()
    {

        $data['email']  = $this->common_model->findById('email_sms_gateway', array('es_id' => 2));

        $data['content']  = $this->BASE_VIEW . '\settings\email_gateway';
        return $this->template->admin_layout($data);
    }

    /*
    |----------------------------
    |   SMS Gateway
    |----------------------------
    */   
    public function sms_gateway()
    {

        $data['sms']      = $this->common_model->findById('email_sms_gateway', array('es_id' => 1));

        $data['content']  = $this->BASE_VIEW . '\settings\sms_gateway';
        return $this->template->admin_layout($data);
    }

    public function getemailsmsgateway()
    {
        $sms = $this->common_model->findById('email_sms_gateway', array('es_id' => 1));
        echo json_encode($sms);
    }

    public function update_sms_gateway()
    {
        $sms = $this->request->getPost('es_id', FILTER_UNSAFE_RAW);
        $pass = '';
        $password = $this->common_model->findById('email_sms_gateway', array('es_id' => 1));
        
        if($password->password == base64_decode($this->request->getPost('password', FILTER_UNSAFE_RAW))){

           $pass = $password->password;
           
        } else {

            $pass = $this->request->getPost('password', FILTER_UNSAFE_RAW);
        }

        $data = array(

            'gatewayname' => $this->request->getPost('gatewayname', FILTER_UNSAFE_RAW),
            'title'       => $this->request->getPost('title', FILTER_UNSAFE_RAW),
            'host'        => $this->request->getPost('host', FILTER_UNSAFE_RAW),
            'user'        => $this->request->getPost('user', FILTER_UNSAFE_RAW),
            'userid'      => $this->request->getPost('userid', FILTER_UNSAFE_RAW),
            'sid'      => $this->request->getPost('sid', FILTER_UNSAFE_RAW),
            'token'      => $this->request->getPost('auth_token', FILTER_UNSAFE_RAW),
            'number'      => $this->request->getPost('phone_number', FILTER_UNSAFE_RAW),
            'password'    => $pass,
            'api'         => $this->request->getPost('api', FILTER_UNSAFE_RAW)
        );

        $this->common_model->update('email_sms_gateway', $data, array('es_id' => $sms));     
        $this->session->setFlashdata('message',display('update_successfully'));
        return redirect()->to(base_url("/backend/setting/sms-gateway")); 
    }

    public function update_email_gateway()
    {
        $email = $this->request->getPost('es_id', FILTER_UNSAFE_RAW);
        $pass = '';
        $password = $this->common_model->findById('email_sms_gateway', array('es_id' => 2));
        
        if($password->password == base64_decode($this->request->getPost('email_password', FILTER_UNSAFE_RAW))){

           $pass = $password->password;

        } else {

            $pass = $this->request->getPost('email_password', FILTER_UNSAFE_RAW);
        }

        $data = array(

            'title'     =>$this->request->getPost('email_title', FILTER_UNSAFE_RAW),
            'protocol'  =>$this->request->getPost('email_protocol', FILTER_UNSAFE_RAW),
            'host'      =>$this->request->getPost('email_host', FILTER_UNSAFE_RAW),
            'port'      =>$this->request->getPost('email_port', FILTER_UNSAFE_RAW),
            'user'      =>$this->request->getPost('email_user', FILTER_UNSAFE_RAW),
            'password'  =>$pass,
            'mailtype'  =>$this->request->getPost('email_mailtype', FILTER_UNSAFE_RAW),
            'charset'   =>$this->request->getPost('email_charset', FILTER_UNSAFE_RAW)
        );

        $this->common_model->update('email_sms_gateway', $data, array('es_id' => $email));
        $this->session->setFlashdata('message',display('update_successfully'));
        return redirect()->to(base_url("/backend/setting/email-gateway")); 
    }

    /*
|----------------------------
|   Email Testing Action
|----------------------------
*/ 
    public function test_email()
    {
        $this->validation->setRule('email_to','Email','required|valid_email');
        $this->validation->setRule('email_sub','Subject','required');
        $this->validation->setRule('email_message','Message','required');


        if($this->validation->withRequest($this->request)->run()){

            $post = array(
                'title'    => "Test Email Gateway",
                'subject'  => $this->request->getPost('email_sub'),
                'to'       => $this->request->getPost('email_to'),
                'message'  => $this->request->getPost('email_message'),
            );

            $code_send = $this->common_model->send_email($post);


            if($code_send == 1){

                $this->session->setFlashdata('message','Email Send Successfully!');
                return redirect()->to(base_url("/backend/setting/email-gateway")); 

            } else {

                $this->session->setFlashdata('exception',"Email Send Fail, Please check your gateway!");
                return redirect()->to(base_url("/backend/setting/email-gateway")); 
            }

        } else {

            $this->session->setFlashdata("exception", $this->validation->listErrors());
            return redirect()->to(base_url("/backend/setting/email-gateway")); 
        }
    }

    public function test_sms()
    {

        $this->validation->setRule('mobile_num','Mobile Number','required|trim');
        $this->validation->setRule('test_message','Test SMS','required');

       if($this->validation->withRequest($this->request)->run()){

            #----------------------------
            #      SMS Test
            #----------------------------
        
            $mobile_num     = $this->request->getPost('mobile_num');
            $test_message   = $this->request->getPost('test_message');

            if ($mobile_num) {

                try {
                     $send_sms = array(
                        'to'        => $mobile_num,
                        'template'  =>  $test_message,
                    );
                    $smssend = $this->sms_lib->send($send_sms);                    
                }
                catch (exception $e) {                   
                    $this->session->setFlashdata('exception',"Please Set Your SMS Gateway Information!");
                }


                if (is_string($smssend) && is_array(json_decode($smssend, true)) && (json_last_error() == JSON_ERROR_NONE) ? true : false) {

                    $smsdata = json_decode($smssend,true);

                     if($smsdata['status'] != 400){


                        $this->session->setFlashdata('message',$smsdata['message']);

                    } else {

                          $this->session->setFlashdata('exception', $smsdata['message']); 
                    }
                } else {

                    $this->session->setFlashdata('message',$smssend);
                }

            } else {

                $this->session->setFlashdata('exception', "There is no Phone number!!!");

            }

        } else {

            $this->session->setFlashdata("exception", $this->validation->listErrors());
        }

        return redirect()->to(base_url("/backend/setting/sms-gateway")); 
    }

    public function email_sms_template_list()
    {

        $data['template_list'] = $this->common_model->findAll('dbt_sms_email_template', array(), 'id', 'asc');

        $data['content']  = $this->BASE_VIEW . '\email_sms_template\list';
        return $this->template->admin_layout($data);
    }

    public function template_update($id = null){

       if($this->request->getMethod() == 'post'){

            $this->validation->setRule('subject_en', 'subject-english', 'required|max_length[200]|trim');
            $this->validation->setRule('subject_fr', 'subject-french','required|max_length[200]|trim');
            $this->validation->setRule('template_en', display('template-english'),'required');
            $this->validation->setRule('template_fr', display('template-french') ,'required');

            if($this->validation->withRequest($this->request)->run())
            {

                $sid = $this->request->getPost('id');

                $datasave = array(

                    'subject_en'  => $this->request->getPost('subject_en', FILTER_UNSAFE_RAW),
                    'subject_fr'  => $this->request->getPost('subject_fr', FILTER_UNSAFE_RAW),
                    'template_en' => $this->request->getPost('template_en', FILTER_UNSAFE_RAW),
                    'template_fr' => $this->request->getPost('template_fr', FILTER_UNSAFE_RAW),
                );
               
                $this->common_model->update('dbt_sms_email_template', $datasave, array('id' => $sid));     
                $this->session->setFlashdata('message',display('update_successfully'));

            } else {

                $this->session->setFlashdata("exception", $this->validation->listErrors());
            }

            return redirect()->to(base_url("/backend/setting/email-sms-template")); 
        }

        $data['template'] = $this->common_model->findById('dbt_sms_email_template', array('id' => $id));
        $data['content']  = $this->BASE_VIEW . '\email_sms_template\form';
        return $this->template->admin_layout($data);
    }

    #-----------------------------------
    #Email Sms Setting View
    #-----------------------------------
    public function email_sms_setting()
    {

        $whereemail=array(
                'method' => 'email'
        );
        $data['email']=$this->common_model->findById('sms_email_send_setup',$whereemail);
        $wheresms=array(
            'method' => 'sms'
        );
        $data['sms']=$this->common_model->findById('sms_email_send_setup',$wheresms);
       
        $data['content']  = $this->BASE_VIEW . '\settings\email_and_sms_setting';
        return $this->template->admin_layout($data);
    }

    public function update_sender()
    {
        $this->validation->setRule('email', display('email'),'alpha_space');
        $this->validation->setRule('sms', display('sms'),'alpha_space');
        $this->validation->setRule('deposit', display('deposit'),'numeric|permit_empty');
        $this->validation->setRule('transfer', display('transfer'),'numeric|permit_empty');
        $this->validation->setRule('withdraw', display('withdraw'),'numeric|permit_empty');
       
        if($this->validation->withRequest($this->request)->run())
        {
            $email = $this->request->getVar('email');
            $sms   = $this->request->getVar('sms');

            if($email!=NULL){
                $data = array(
                    'deposit' =>$this->request->getVar('deposit',FILTER_UNSAFE_RAW),
                    'transfer' =>$this->request->getVar('transfer',FILTER_UNSAFE_RAW),
                    'withdraw' =>$this->request->getVar('withdraw',FILTER_UNSAFE_RAW),
                );
                $where=array(
                    'method'    =>$email
                );
                $this->common_model->update('sms_email_send_setup',$data, $where);
                $this->session->setflashdata('message',display('update_successfully'));
            }

            if($sms!=NULL){
                $data = array(
                    'deposit'       =>$this->request->getVar('deposit',FILTER_UNSAFE_RAW),
                    'transfer'      =>$this->request->getVar('transfer',FILTER_UNSAFE_RAW),
                    'withdraw'      =>$this->request->getVar('withdraw',FILTER_UNSAFE_RAW),
                );
                $where=array(
                    'method'    => $sms
                );
                $this->common_model->update('sms_email_send_setup',$data, $where);
                $this->session->setflashdata('message',display('update_successfully'));
            }
        }else {
            $error=$this->validation->listErrors();
            if($this->request->getMethod() == "post"){
                $this->session->setFlashdata('exception', $error);
            }
        }
        
        return  redirect()->to(base_url('backend/setting/email-sms-settings'));
    }
}
