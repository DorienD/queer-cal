{% extends "admin_edit_widget_i18n.tpl" %}

{% block widget_title %}
    {_ Media + text _}<div class="widget-header-tools"></div>
{% endblock %}

{% block widget_show_minimized %}false{% endblock %}
{% block widget_id %}edit-block-{{ #block }}{% endblock %}

{% block widget_content %}
    <fieldset>
        <div class="col-md-6">
            <div class="form-group row">
                <label class="control-label" for="block-{{name}}-title{{ lang_code_for_id }}">
                    {_ Title _} {{ lang_code_with_brackets }}
                </label>
                <input type="text"
                    id="block-{{name}}-title{{ lang_code_for_id }}"
                    name="blocks[].title{{ lang_code_with_dollar }}"
                    class="form-control"
                    {% include "_language_attrs.tpl" language=lang_code %}
                    value="{{ blk.title|translation:lang_code }}">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-12">
                {% if id.is_editable %}
                    <textarea rows="10"
                        id="block-{{name}}-body{{ lang_code_for_id }}"
                        name="blocks[].body{{ lang_code_with_dollar }}"
                        class="body z_editor-init form-control"
                        {% include "_language_attrs.tpl" language=lang_code %}>{{ blk.body|translation:lang_code|escape }}</textarea>
                {% else %}
                    {{ blk.body|translation:lang_code  }}
                {% endif %}
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group row">
                <label class="control-label" for="block-{{name}}-btn_text{{ lang_code_for_id }}">
                    {_ Button text _} {{ lang_code_with_brackets }}
                </label>
                <input type="text"
                    id="block-{{name}}-btn_text{{ lang_code_for_id }}"
                    name="blocks[].btn_text{{ lang_code_with_dollar }}"
                    class="form-control"
                    {% include "_language_attrs.tpl" language=lang_code %}
                    value="{{ blk.btn_text|translation:lang_code|escape }}">
            </div>
        </div>
    </fieldset>
{% endblock %}

{% block widget_content_nolang %}
    
        <div class="form-group row">
            <div class="col-md-3">
                <fieldset class="block-page">
                    <h3 class="h4">{_ Media _}</h3>
                    
                    <div class="rsc-item-wrapper" id="{{ #wrap }}">
                        {% if blk.rsc_id %}
                            {% catinclude "_rsc_block_item.tpl" blk.rsc_id %}
                        {% endif %}
                    </div>
                    <br><br>
                    <a class="btn btn-default page-connect" href="#connect">{_ Connect media _}</a>
                    
                    <br><br>
                    
                    <a href="#disconnect" class="btn btn-xs btn-danger page-disconnect">{_ Remove _}</a>
                    
                    <br><br>
                    
                    <input type="hidden" id="block-{{name}}-rsc_id" name="blocks[].rsc_id" value="{{ blk.rsc_id }}" />
                </fieldset>
            </div>
            
            <div class="col-md-3">
                <fieldset class="block-page">
                    <h3 class="h4">{_ Link _} (optional)</h3>
                    
                    <div class="rsc-item-wrapper" id="{{ #wrap }}">
                        {% if blk.rsc_link_id %}
                            {% catinclude "_rsc_block_item.tpl" blk.rsc_link_id %}
                        {% endif %}
                    </div>
                    <br><br>
                    <a class="btn btn-default page-connect" href="#connect">{_ Connect page _}</a>
                    
                    <br><br>
                    
                    <a href="#disconnect" class="btn btn-xs btn-danger page-disconnect">{_ Remove _}</a>
                    
                    <br><br>
                    
                    <input type="hidden" id="block-{{name}}-rsc_link_id" name="blocks[].rsc_link_id" value="{{ blk.rsc_link_id }}" />
                </fieldset>
            </div>
            
            <div class="col-md-3">
                <h3 class="h4">{_ Show as _}</h3>
                <label for="align-left-{{name}}">
                    <input type="radio" id="align-left-{{name}}" name="blocks[].alignment~{{name}}" value="left" {% if blk.alignment == "left" or blk.alignment == undefined %}checked{% endif%}> {_ Media left _}
                </label><br>
                <label for="align-right-{{name}}">
                    <input type="radio" id="align-right-{{name}}" name="blocks[].alignment~{{name}}" value="right" {% if blk.alignment == "right" %}checked{% endif%}> {_ Media right _}
                </label>
            </div>
        </div>

{% endblock %}
