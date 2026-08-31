{% extends "_admin_frontend_edit.tpl" %}

{% block rscform %}
<div class="edit-container">
    <div class="c-edit-content">
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
                {# <input type="hidden" name="is_published" value="1" /> #}
                <input type="hidden" name="is_published" value="{% if id.is_published|is_defined %}{{ id.is_published }}{% else %}0{% endif %}" />

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

                            <div class="widget">
                                <div class="widget-content">
                                    <div class="date-range">
                                        <h2 class="h3">{_ Date & time _} <sup>*</sup></h2>

                                        <p class="helper-text">{_ The end date must be in the future relative to the start date.  _}</p>

                                        <fieldset>
                                            <div class="checkbox">
                                                <label>
                                                    <input name="date_is_all_day" id="{{ #all_day }}" type="checkbox" {% if id.date_is_all_day %}checked{% endif %}> {_ All day event _}
                                                </label>
                                            </div>

                                            {% javascript %}
                                                $("#{{ #all_day }}").on('change', function() {
                                                    var $times = $(this).closest('.date-range').find("input[type='time']");
                                                    if ($(this).is(":checked"))
                                                        $times.fadeOut("fast").val('');
                                                    else
                                                        $times.fadeIn("fast");
                                                });
                                            {% endjavascript %}

                                            <div class="form-group">
                                                <label class="control-label">{_ Start date _} *</label>
                                                <div>
                                                    {% include "_admin_frontend_edit_date.tpl" date=id.date_start name="date_start" is_end=0 date_is_all_day=id.date_is_all_day is_editable=id.is_editable timezone=id.tz %}
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label">{_ End date _} *</label>
                                                <div>
                                                    {% include "_admin_frontend_edit_date.tpl" date=id.date_end name="date_end" is_end=1 date_is_all_day=id.date_is_all_day  is_editable=id.is_editable timezone=id.tz %}
                                                </div>
                                            </div>
                                        </fieldset>
                                        
                                        <p class="help-block" {% if not id.tz or id.tz == m.req.timezone %}style="display:none"{% endif %}>
                                            <i class="fa fa-exclamation-triangle"></i>
                                            {_ Showing dates in _}: <b class="rsc-timezone">{{ id.tz|escape }}</b>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            {% if id.category_id.is_feature_show_address|if_undefined:true %}
                                {% catinclude "_admin_frontend_edit_address.tpl" cats %}
                            {% endif %}

                            <div class="widget">
                                <div class="widget-content">
                                    <h2 class="h3">{_ Delete your event _}</h2>

                                    <p>
                                        {% button class="btn btn-danger btn-sm" disabled=(id.is_protected or not id.is_deletable) id="delete-button" text=_"Delete" action={dialog_delete_rsc id=id on_success={redirect back}} title=_"Delete" %}
                                    </p>
                                </div>
                            </div>
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
    <div class="c-edit-sidebar" id="sidebar">
        {% live template="edit/_request_approval.tpl"
            id=id
            topic=id
        %}
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