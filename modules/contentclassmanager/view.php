<?php 
/**
 * This is used to display all objects inside a class 
 */

$Result = array();
$tpl    = eZTemplate::factory();
$http   = eZHTTPTool::instance();

$allowed_sort_by    = array('name','node_id','published','modified');
$allowed_ascending  = array('true','false');


if( isset( $Params['class_id'] ) && $Params['class_id'] && is_int( (int)$Params['class_id'] ) )
{
    $tpl->setVariable( 'class_id', (int)$Params['class_id'] );
}
if( isset( $Params['offset'] ) && $Params['offset'] && is_int( (int)$Params['offset'] ) )
{
    $tpl->setVariable( 'offset', (int)$Params['offset'] );
}
else
{
    $tpl->setVariable( 'offset', 0 );
}
if( isset( $Params['sort_by'] ) && $Params['sort_by'] && in_array( $Params['sort_by'], $allowed_sort_by ) )
{
    $tpl->setVariable( 'sort_by', $Params['sort_by'] );
}
else
{
    $tpl->setVariable( 'sort_by', 'modified' );
}
if( isset( $Params['ascending'] ) && $Params['ascending'] && in_array( $Params['ascending'], $allowed_ascending ) )
{
    $tpl->setVariable( 'ascending', $Params['ascending'] );
}
else
{
    $tpl->setVariable( 'ascending', 'false' );
}

//fetch variable from here
$class_object = eZFunctionHandler::execute('content', 'class', array('class_id'=>$Params['class_id']));

$tpl->setVariable( 'class_object', $class_object );

$tpl->setVariable( 'view_parameters', $Params['UserParameters'] );

$Result['content'] = $tpl->fetch( 'design:contentclassmanager/view.tpl');
$Result['path'] = array( array( 'url' => 'contentclassmanager/main',
                                'text' => 'Objects by content class' ),
                         array( 'url' => false,
                                'text' => "View Class '".$class_object->attribute( 'name' )."'" ));

?>
