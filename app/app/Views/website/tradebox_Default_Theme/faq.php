<?php
    $cat_title1  = isset($lang) && $lang =="english"?$cat_info->cat_title1_en:$cat_info->cat_title1_fr;
    $cat_title2  = isset($lang) && $lang =="english"?$cat_info->cat_title2_en:$cat_info->cat_title2_fr;
?>
<div class="page_header" data-parallax-bg-image="<?php echo IMAGEPATH.$cat_info->cat_image; ?>" data-parallax-direction="">
    <div id="banner_bg_effect" class="banner_effect"></div>
    <div class="header-content">
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="haeder-text">
                        <h1><?php echo htmlspecialchars_decode($cat_title1); ?></h1>
                        <p><?php echo htmlspecialchars_decode($cat_title2); ?></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="faq_content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul class="accordion">
                    <?php 
                        $i = 1; 
                        foreach ($article as $key => $value) { ?>
                         <li>
                            <a><?php echo esc(isset($lang)) && $lang =="english"?$value->headline_en:$value->headline_fr; ?></a>
                            <p><?php echo esc(isset($lang)) && $lang =="english"?$value->article1_en:$value->article1_fr; ?></p>
                        </li>
                    <?php $i++; } ?>  
                </ul>
                <!-- / accordion -->
            </div>
        </div>
        <div><?php echo $pager; ?></div>
    </div>
</div>
