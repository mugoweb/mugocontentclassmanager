<?php 

$Result = array();
$tpl    = eZTemplate::factory();
$http   = eZHTTPTool::instance();

$allowed_sort_by    = array( 'name', 'id');
$allowed_ascending  = array( 'true', 'false' );

if( isset( $Params['sort_by'] ) && $Params['sort_by'] && in_array( $Params['sort_by'], $allowed_sort_by ) )
{
    $tpl->setVariable( "sort_by", $Params['sort_by'] );
}
else
{
    $tpl->setVariable( "sort_by", 'name' );
}
if( isset( $Params['ascending'] ) && $Params['ascending']  && in_array( $Params['ascending'], $allowed_ascending ) )
{
    $tpl->setVariable( "ascending", $Params['ascending'] );
}
else
{
    $tpl->setVariable( "ascending", 'true' );
}
if( isset( $Params['items_displayed'] ) && $Params['items_displayed'] )
{
    $tpl->setVariable( "items_displayed", $Params['items_displayed'] && is_int( $Params['items_displayed'] ) );
}
else
{
    $tpl->setVariable( "items_displayed", '' );
}
$tpl->setVariable( "view_parameters", $Params['UserParameters'] );

$Result['content']  = $tpl->fetch( "design:contentclassmanager/main.tpl" );
$Result['path']     = array( array( 'url' => 'contentclassmanager/main',
                                'text' => 'Objects by content class' ),
                         array( 'url' => false,
                                'text' => 'All Classes' ) );

?>
