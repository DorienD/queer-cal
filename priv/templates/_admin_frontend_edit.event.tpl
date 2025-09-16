{% extends "_admin_frontend_edit.tpl" %}

{% block rscform %}
<div class="edit-container">
    <div class="edit-container__content">
        {% if id.exists %}
            {% with id.is_editable as is_editable %}
            {% with id.is_a|default:(m.category[cat].is_a) as cats %}
            {% wire id="rscform"
                    type="submit"
                    postback={rscform view_location=view_location cat=cat id=id}
                    delegate=`controller_admin_edit`
            %}

            <form id="rscform" method="post" action="postback" class="form do_formdirty">
                <input type="hidden" name="id" value="{{ id }}" />
                <input type="hidden" name="is_published" value="1" />
                {# <input type="hidden" name="is_published" value="{% if id.is_published|is_defined %}{{ id.is_published }}{% else %}0{% endif %}" /> #}

                {% if id.is_temporary %}
                    <input type="hidden" name="o.author[]" value="{{ m.acl.user.id }}">
                {% endif %}

                <ul class="nav nav-tabs">
                    <li class="active"><a href="#poststuff" data-toggle="tab">{_ Content _}</a></li>
                    {% block meta_tabs %}{% endblock %}
                    {% if m.modules.active.mod_translation %}
                        <li><a href="#meta-language" data-toggle="tab">{_ Language _}</a></li>
                    {% endif %}
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="poststuff">
                        {% optional include "_translation_init_languages.tpl" %}
                        
                        {% block edit_blocks %}
                            <p style="margin: 1em 0;"><span class="indicator-required">*</span><i> {_ Required field _}</i></p>

                            {% catinclude "_admin_edit_basics.tpl" cats %}

                            {% if id.category_id.is_feature_show_address|if_undefined:true %}
                                {% catinclude "_admin_frontend_edit_address.tpl" cats %}
                            {% endif %}
                        {% endblock %}
                    </div>
                    {% block meta_panels %}{% endblock %}
                    <div class="tab-pane" id="meta-language">
                        <div class="widget">
                            <div class="widget-header">
                                {_ Language _}
                            </div>
                            <div class="widget-content">
                                {% optional include "_translation_edit_languages.tpl" %}
                            </div>
                        </div>
                    </div>
                </div>

                {# Hidden safe buttons and publish state - controlled via the nabvar #}
                <div style="display: none">
                    <span id="button-prompt">
                        {% block nav_prompt %}
                            {{ id.category_id.title }}
                        {% endblock %}
                    </span>

                    {% block buttons %}
                        {% button type="submit" id="save_stay" class="btn btn-primary" text=_"Save" title=_"Save this page." disabled=not id.is_editable %}

                        {% if id.is_editable %}
                            {% button type="submit" id="save_view" class="btn btn-default" text=_"Save &amp; view" title=_"Save and view the page." %}
                        {% elseif id %}
                            {% button id="save_view" class="btn btn-primary" text=_"View" title=_"View this page." action={redirect id=id} %}
                        {% endif %}
                    {% endblock %}
                </div>
            </form>
            {% endwith %}
            {% endwith %}
        {% else %}
            <h1 class="text-muted">{_ No page _}</h1>
            <p class="text-muted">
                {_ The page might have been deleted. _}
            </p>
        {% endif %}
        
    </div>
    <div class="edit-container__sidebar" id="sidebar">
        {# {% live template="edit/_request_approval.tpl"
            id=id
            topic=id
        %} #}
        
        <div class="widget">
            <div class="widget-content">
                <h4>{_ Keywords _} <span class="indicator-required">*</span></h4>
                
                <p class="helper-text">
                    {_ You can add multiple keywords if needed. _}
                </p>
                <br>

                {% live template="_admin_edit_content_page_connections_list.tpl"
                    topic={object id=id predicate="subject"}
                    id=id
                    predicate="subject"|as_atom
                    button_label=button_label
                    button_class=button_class
                    dialog_title_add=dialog_title_add
                    callback=callback
                    action=action
                    nocatselect
                    cat=m.rsc.keyword.id
                    content_group=content_group
                    unlink_action=unlink_action
                    undo_message_id="unlink-undo-message"
                    list_id=list_id
                    tabs_enabled=["find"]
                    dialog_title_add=_"Add keywords"
                %}
                <br>

                <div class="form-group">
                    <input type="hidden" id="check-subject" value="subject" form="rscform">
                    {% validate id="check-subject"
                                type={hasedge id=id minimum=1}
                                only_on_submit
                    %}
                    <p class="if-has-error" style="display: none">{_ You must have at least one keyword. _}</p>
                </div>

                <p>
                    <small>{_ Missing a keyword? Please send them to _} <a href="mailto:event@queer-kalender.nl">event@queer-kalender.nl</a>.</small>
                </p>
            </div>
        </div>

        <div class="widget">
            <div class="widget-content">
                <h4>{_ Known location _}</h4>

                <p>
                    {_ Some locations are already in the system, if you can't find the location add the address in the form. _}
                </p>
                <br>

                {% live template="_admin_edit_content_page_connections_list.tpl"
                    topic={object id=id predicate="haslocation"}
                    id=id
                    predicate="haslocation"|as_atom
                    button_label=button_label
                    button_class=button_class
                    dialog_title_add=dialog_title_add
                    callback=callback
                    action=action
                    nocatselect
                    cat=m.rsc.location.id
                    content_group=content_group
                    unlink_action=unlink_action
                    undo_message_id="unlink-undo-message"
                    list_id=list_id
                    tabs_enabled=["find"]
                    dialog_title_add=_"Connect a location"
                %}
                <br>
            </div>
        </div>

        <div class="widget">
            <div class="widget-content">
                <h4>{_ Known organisation _}</h4>

                <p>
                    {_ Some organisations are already in the system, if you can't find the organisation add the title in the form. _}
                </p>
                <br>

                {% live template="_admin_edit_content_page_connections_list.tpl"
                    topic={object id=id predicate="hasorganisation"}
                    id=id
                    predicate="hasorganisation"|as_atom
                    button_label=button_label
                    button_class=button_class
                    dialog_title_add=dialog_title_add
                    callback=callback
                    action=action
                    nocatselect
                    cat=m.rsc.organization.id
                    content_group=content_group
                    unlink_action=unlink_action
                    undo_message_id="unlink-undo-message"
                    list_id=list_id
                    tabs_enabled=["find"]
                    dialog_title_add=_"Connect an organization"
                %}
                <br>
            </div>
        </div>
    </div>

    {% javascript %}
        setTimeout(function() {
            $('#rscform').on('shown.bs.tab', '.language-tabs > li > a[data-toggle="tab"]', function (e) {
                if (e.target != e.relatedTarget) {
                    const showLang = e.target.closest('li').getAttribute('lang');
                    const hideLang = e.relatedTarget.closest('li').getAttribute('lang');
                    $("li[lang='"+showLang+"']:visible > a").tab('show');

                    // Also switch language dependent parts that are not inside the tab panes.
                    $(".widget-content-lang-" + hideLang).hide()
                    $(".widget-content-lang-" + showLang).show();

                    setTimeout( () => z_editor.init(), 1 );
                }
            });
            {% if tab %}
                $("li a[href='#{{ tab|escape }}'").tab("show");
            {% endif %}
        }, 10);

        setTimeout(function() {
            $('#rscform').on('shown.bs.tab', '.blocks-tabs > li > a[data-toggle="tab"]', function (e) {
                setTimeout( () => z_editor.init(), 1 );
            });
        }, 10);
    {% endjavascript %}
</div>
{% endblock %}