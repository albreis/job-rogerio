<div class="cryp_wrapper">
    <div class="profile-verify mt-4 mb-4">
        <?php if ($session->get('message') != null) {  ?>
            <div class="alert alert-info alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <?php echo $session->get('message'); ?>
            </div> 
            <?php } ?>
                
            <?php if ($session->get('exception') != null) {  ?>
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <?php echo $session->get('exception'); ?>
            </div>
            <?php } ?>
        <div class="user-login form-design">
            <h3 class="user-login-title mb-4"><?php echo display('verify_phone');?></h3>
            <p class="text-white"> <?php echo display('verify_text_phone');?></p>
            <?php echo form_open_multipart("phone-verify") ?>
                               
                <div class="form-group row">
                    <label for="verify_code" class="col-md-4 col-form-label"><?php echo display('verify_code') ?> <i class="text-danger">*</i></label>
                    <div class="col-md-8">
                        <input name="verify_code" type="text" class="form-control" id="verify_code" placeholder="" value="" required="">
                    </div>
                </div>                       
                
               
                <span id="verify_field"></span>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-kingfisher-daisy"><?php echo display('verify_phone') ?></button>
                    </div>
                </div>
            <?php echo form_close() ?>
        </div>
    </div>
</div>