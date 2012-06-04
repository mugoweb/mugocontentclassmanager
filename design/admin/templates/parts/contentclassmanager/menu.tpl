{def $menu_name  = ezini( 'Leftmenu_contentclassmanager', 'Name', 'menu.ini' )}
 
{def $classes = fetch( 'class','list',hash('sort_by',array( 'name',true() )) )}

<div class="box-header">
    <div class="box-ml">
    <h4>{$menu_name|wash()}</h4>
    </div>
</div>

        {* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-content">
        
            <ul class="leftmenu-items">
            {foreach $classes as $classobject}
                <li {if eq($classobject.id,$class_id)}class="current"{/if}>
                    <div>
                        <a href={concat("contentclassmanager/view/",$classobject.id)|ezurl()}>{$classobject.name}</a>
                    </div>
                </li>
            {/foreach}
            </ul>

            {* DESIGN: Content END *}
                </div>
            </div>
        </div>