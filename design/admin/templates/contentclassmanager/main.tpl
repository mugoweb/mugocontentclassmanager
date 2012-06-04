{* ---------------------------------------
Expected Variables:
    $sort_by    - what attribute to sort_by: name, node_id, published or modified
    $ascending  - is true if the sorting should be ascending, false otherwise
--------------------------------------- *}
{ezcss_require( array( "carets.css" ) )}

{def $sort_asc=true()}
{if eq( $ascending, "false" )}
    {set $sort_asc=false()}
{else}
    {set $ascending="true"}
{/if}
{def $classes = fetch( "class","list",hash(
                                    "sort_by", array( $sort_by, $sort_asc ),
                                    ) 
                      )}
{def $number_of_classes = $classes|count()}

<div class="box-header">
    <div class="box-ml">
        <h4>{"Viewing %number_of_classes content classes"|
                i18n( 'design/admin/class/list' , "", 
                    hash( "%number_of_classes", $number_of_classes ) )}
        </h4>
    </div>
</div>
<div class="box-bc">
    <div class="box-ml">
        <div class="box-content"><br/>
            <table class="list" cellspacing="0">
            <tr>
                <th>
                    {if and( eq( $sort_by, "name" ), eq( $ascending, "true" ) )}
                        <a href={"contentclassmanager/main/(sort_by)/name/(ascending)/false"|ezurl()}>
                        {"Name"|i18n( "design/admin/class/classlist" )}
                            <div class="carret-arrow-up"></div>
                        </a>
                    {elseif and( eq( $sort_by, "name" ), eq( $ascending, "false") )}
                        <a href={"contentclassmanager/main/(sort_by)/name/(ascending)/true"|ezurl()}>{"Name"|i18n( "design/admin/class/classlist" )}
                            <div class="carret-arrow-down"></div>
                        </a>
                    {else}
                        <a href={"contentclassmanager/main/(sort_by)/name/(ascending)/true"|ezurl()}>
                        {"Name"|i18n( "design/admin/class/classlist" )}</a>
                    {/if}
                </th>
                <th class="tight">
                    {if and( eq( $sort_by, "id" ), eq( $ascending, "true" ) )}
                        <a href={"contentclassmanager/main/(sort_by)/id/(ascending)/false"|ezurl()}>{"ID"|i18n( "design/admin/class/classlist" )}
                            <div class="carret-arrow-up"></div>
                        </a>
                    {elseif and( eq( $sort_by, "id" ), eq( $ascending, "false" ) )}
                        <a href={"contentclassmanager/main/(sort_by)/id/(ascending)/true"|ezurl()}>{"ID"|i18n( "design/admin/class/classlist" )}
                        <div class="carret-arrow-down"></div>
                        </a>
                    {else}
                        <a href={"contentclassmanager/main/(sort_by)/id/(ascending)/true"|ezurl()}>{"ID"|i18n( "design/admin/class/classlist" )}</a>
                    {/if}
                </th>
                <th>
                    {"Identifier"|i18n( "design/admin/class/classlist" )}
                </th>
                <th align="right">{"Objects"|i18n( "design/admin/class/classlist" )}</th>
                <th class="tight">&nbsp;</th>
                <th class="tight">&nbsp;</th>
            </tr>
            {foreach $classes as $class_object sequence array( bglight, bgdark ) as $style}
                <tr class="{$style}">
                    <td>
                        {$class_object.identifier | class_icon( small, $class_object.name|wash() )}&nbsp;
                        <a href={concat( "contentclassmanager/view/", $class_object.id )|ezurl()}>{$class_object.name|wash()}</a>
                    </td>
                    <td class="number" align="right">{$class_object.id}</td>
                    <td>{$class_object.identifier|wash()}</td>
                    <td class="number">{$class_object.object_count}</td>
                    <td>
                        <a href={concat( "class/view/", $class_object.id, "/(language)/", 
                                    $class_object.top_priority_language_locale )|ezurl()} 
                           title="{"View the <%class_name> class."|
                                    i18n( "design/admin/class/classlist",, hash( "%class_name", $class_object.name ) )|
                                        wash()}">
                            <img class="button" src={"find.png"|ezimage()} width="16" height="16" alt="view class" />
                        </a>
                    </td>
                    <td>
                        <a href={concat( "class/edit/", $class_object.id, "/(language)/", 
                                $class_object.top_priority_language_locale )|ezurl()}
                                title="{"Edit the <%class_name> class."|i18n( "design/admin/class/classlist",, 
                                    hash( "%class_name", $class_object.name ) )|wash()}">
                            <img class="button" src={"edit.gif"|ezimage()} width="16" height="16" alt="edit" />
                        </a>
                    </td>
                </tr>
            {/foreach}
            </table>
            <br/>
        </div>
    </div>
</div>