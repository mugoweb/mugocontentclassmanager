{* ---------------------------------------
Expected Variables:
    $class_object*  - the class object as fetched by the php file 
    $offset         - the item at which the pagination will begin
    $sort_by        - what attribute to sort_by: name, node_id, published or modified
    $ascending      - is true if the sorting should be ascending, false otherwise
--------------------------------------- *}

{ezcss_require(array( "carets.css" ))}

{def    $item_limit     = ezpreference( 'admin_list_limit' )}
{def    $items_per_page    = min( $item_limit, 3)|choose( 10, 10, 25, 50 )}

{def $sort_asc=true()}
{if eq( $ascending, 'false' )}
    {set $sort_asc=false()}
{else}
    {set $ascending='true'}
{/if}

{def $nodes = fetch( 'content', 'tree', hash(
    'parent_node_id', 1,
    'sort_by', array( $sort_by, $sort_asc ),
    'offset', $offset,
    'limit', $items_per_page,
    'class_filter_type', 'include',
    'class_filter_array', array( $class_object.identifier ),
    'main_node_only', true()
) )}
<div class="box-header">
    <div class="box-ml">
        {if $class_object | is_null()}
            <h4>{"Selected class doesn't exist"|i18n( 'design/admin/class/view'  )}</h4>
        {else}
            <h4>{"Viewing %object_count objects in class '%class_name'"|i18n('design/admin/class/view' ,'',hash( "%object_count", $class_object.object_count, "%class_name", $class_object.name ))|wash()}</h4>
        {/if}
    </div>
</div>
{* DESIGN: Header END *}

{* DESIGN: Content START *}
<div class="box-ml"><div class="box-mr"><div class="box-content">
{* Items per page and view mode selector. *}
<div class="context-toolbar">
<div class="button-left">
    <p class="table-preferences">
    {switch match=$items_per_page}
    {case match=25}
        <a href={'/user/preferences/set/admin_list_limit/1'|ezurl()}>10</a>
        <span class="current">25</span>
        <a href={'/user/preferences/set/admin_list_limit/3'|ezurl()}>50</a>

        {/case}

        {case match=50}
        <a href={'/user/preferences/set/admin_list_limit/1'|ezurl()}>10</a>
        <a href={'/user/preferences/set/admin_list_limit/2'|ezurl()}>25</a>
        <span class="current">50</span>
        {/case}

        {case}
        <span class="current">10</span>
        <a href={'/user/preferences/set/admin_list_limit/2'|ezurl()}>25</a>
        <a href={'/user/preferences/set/admin_list_limit/3'|ezurl()}>50</a>
        {/case}

        {/switch}
    </p>
</div></div></div></div></div><br/>
<br/>
{if gt( $class_object.object_count, 0 )}
    {include name='navigator'
        uri='design:navigator/google.tpl'
        page_uri=concat( "contentclassmanager/view/", $class_object.id )
        view_parameters=$view_parameters
        item_count=$class_object.object_count
        item_limit=$items_per_page}
    <br/>
    <table class="list" cellspacing="0">
        <tr>
            <th class="wide">
                {if and( eq( $sort_by, 'name' ), eq( $ascending, 'true' ) )}
                    <a href={concat("contentclassmanager/view/",$class_object.id,"/(sort_by)/name/(ascending)/false")|ezurl()}>{'Name'|i18n( 'design/admin/node/view/full' )}
                        <div class="carret-arrow-up"></div>
                    </a>
                {elseif and( eq( $sort_by, 'name' ), eq( $ascending, 'false' ) )}
                    <a href={concat("contentclassmanager/view/",$class_object.id,"/(sort_by)/name/(ascending)/true")|ezurl()}>{'Name'|i18n( 'design/admin/node/view/full' )}
                        <div class="carret-arrow-down"></div>
                    </a>
                {else}
                    <a href={concat("contentclassmanager/view/",$class_object.id,"/(sort_by)/name/(ascending)/true")|ezurl()}>{'Name'|i18n( 'design/admin/node/view/full' )}</a>
                {/if}
            </th>
            <th class="tight">
                {if and( eq( $sort_by, 'node_id' ), eq( $ascending, 'true' ) )}
                    <a href={concat("contentclassmanager/view/",$class_object.id,"/(sort_by)/node_id/(ascending)/false")|ezurl()}>
                        {'Node ID'|i18n( 'design/admin/node/view/full' )}
                        <div class="carret-arrow-up"></div>
                    </a>
                {elseif and( eq( $sort_by, 'node_id' ), eq( $ascending, 'false' ) )}
                    <a href={concat("contentclassmanager/view/",$class_object.id,"/(sort_by)/node_id/(ascending)/true")|ezurl()}>
                        {'Node ID'|i18n( 'design/admin/node/view/full' )}
                        <div class="carret-arrow-down"></div>
                    </a>
                {else}
                    <a href={concat("contentclassmanager/view/",$class_object.id,"/(sort_by)/node_id/(ascending)/true")|ezurl()}>{'Node ID'|i18n( 'design/admin/node/view/full' )}</a>
                {/if}
            </th>
            <th class="tight">
                {'Visibility'|i18n( 'design/admin/node/view/full' )}
            </th>
            <th class="wide">
                {if and( eq( $sort_by, 'published' ), eq( $ascending, 'true' ) )}
                    <a href={concat("contentclassmanager/view/",$class_object.id,"/(sort_by)/published/(ascending)/false")|ezurl()}>
                        {'Published'|i18n( 'design/admin/node/view/full' )}
                        <div class="carret-arrow-up"></div>
                    </a>
                {elseif and( eq( $sort_by, 'published' ), eq( $ascending, 'false' ) )}
                    <a href={concat("contentclassmanager/view/",$class_object.id,"/(sort_by)/published/(ascending)/true")|ezurl()}>
                        {'Published'|i18n( 'design/admin/node/view/full' )}
                        <div class="carret-arrow-down"></div>
                    </a>
                {else}
                    <a href={concat("contentclassmanager/view/",$class_object.id,"/(sort_by)/published/(ascending)/true")|ezurl()}>{'Published'|i18n( 'design/admin/node/view/full' )}</a>
                {/if}
            </th>
            <th class="wide">
                {if and( eq( $sort_by, 'modified' ), eq( $ascending, 'true' ) )}
                    <a href={concat("contentclassmanager/view/",$class_object.id,"/(sort_by)/modified/(ascending)/false")|ezurl()}>
                        {'Modified'|i18n( 'design/admin/node/view/full' )}
                        <div class="carret-arrow-up"></div>
                    </a>
                {elseif and( eq( $sort_by, 'modified' ), eq( $ascending, 'false' ) )}
                    <a href={concat("contentclassmanager/view/",$class_object.id,"/(sort_by)/modified/(ascending)/true")|ezurl()}>
                        {'Modified'|i18n( 'design/admin/node/view/full' )}
                        <div class="carret-arrow-down"></div>
                    </a>
                {else}
                    <a href={concat("contentclassmanager/view/",$class_object.id,"/(sort_by)/modified/(ascending)/true")|ezurl()}>{'Modified'|i18n( 'design/admin/node/view/full' )}</a>
                {/if}
            </th>
            <th class="tight"> &nbsp; </th>
        </tr>
        {foreach $nodes as $each_node sequence array( 'bglight', 'bgdark' ) as $style}
        <tr class="{$style}">
            <td><a href={$each_node.url_alias|ezurl()}>{$each_node.name|wash()}</a></td>
            <td class="tight">{$each_node.node_id|wash()}</td>
            <td>{$each_node.hidden_status_string}</td>
            <td>
                {if eq( $each_node.contentobject_is_published, true() )}
                    {$each_node.object.published|l10n( 'shortdatetime' )}
                {else}
                    {"Not Published"|i18n( 'design/admin/class/view'  )}
                {/if}</td>
            <td>{$each_node.object.modified|l10n( 'shortdatetime' )}</td>
            <td>
                <a href={concat( 'content/edit/', $each_node.object.id)|ezurl()} 
                title="Edit"><img class="button" src={'edit.gif'|ezimage()} width="16" height="16" alt="edit" /></a>
            </td>
        </tr>
        {/foreach}
    </table>
    <br/>
    {include name='navigator'
            uri='design:navigator/google.tpl'
            page_uri=concat( "contentclassmanager/view/", $class_object.id )
            view_parameters=$view_parameters
            item_count=$class_object.object_count
            item_limit=$items_per_page}
{else}
    There are no content objects of this content class
{/if}
