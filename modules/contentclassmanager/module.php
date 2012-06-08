<?php

$Module = array( 'name' => 'contentclassmanager' );

$ViewList = array();
$ViewList[''] = array( 'script' => 'main.php'
                            ,'ui_content' => 'administration'
                            ,'functions' => array( 'view' )
                            ,'default_navigation_part' => 'ezcontentclassmanagernavigationpart'
                           );
$ViewList[ 'main' ] = array( 'script' => 'main.php'
                            ,'ui_content' => 'administration'
                            ,'functions' => array( 'view' )
                            ,'unordered_params'  => array( 'offset'=>'offset', 'sort_by'=>'sort_by', 'ascending'=>'ascending' )
                            ,'default_navigation_part' => 'ezcontentclassmanagernavigationpart'
                           );
$ViewList[ 'view' ] = array( 'script' => 'view.php'
                            ,'ui_content' => 'administration'
                            ,'functions' => array( 'view' )
                            , 'params' => array( 'class_id' )
                            ,'unordered_params'  => array( 'offset'=>'offset', 'sort_by'=>'sort_by', 'ascending'=>'ascending' )
                            ,'default_navigation_part' => 'ezcontentclassmanagernavigationpart'
                           );

$FunctionList              = array();
$FunctionList[ 'view' ]    = array();

?>
