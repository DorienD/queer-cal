{% extends "admin_edit_widget_i18n.tpl" %}

{% block widget_title %}
{_ Block _}
<div class="widget-header-tools"></div>
{% endblock %}

{% block widget_show_minimized %}false{% endblock %}
{% block widget_id %}edit-block-{{ #block }}{% endblock %}
{% block widget_header %}{% endblock %}

{% block widget_content %}
<fieldset class="form-group row">
    <div class="col-md-6">
        <div class="form-group">
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
</fieldset>

<fieldset class="form-group row">
    <div class="col-md-12">
        <h3 class="h4">{_ Text left _}</h3>
        {% if id.is_editable %}
            <textarea rows="10"
                id="block-{{name}}-body{{ lang_code_for_id }}"
                name="blocks[].body{{ lang_code_with_dollar }}"
                class="body z_editor-init form-control"
                {% include "_language_attrs.tpl" language=lang_code %}>{{ blk.body|translation:lang_code  |escape }}</textarea>
        {% else %}
            {{ blk.body|translation:lang_code  }}
        {% endif %}
    </div>
</fieldset>

<fieldset class="form-group row">
    <div class="col-md-12">
        <h3 class="h4">{_ Text right _}</h3>
        {% if id.is_editable %}
            <textarea rows="10"
                id="block-{{name}}-body-right{{ lang_code_for_id }}"
                name="blocks[].body_right{{ lang_code_with_dollar }}"
                class="body z_editor-init form-control"
                {% include "_language_attrs.tpl" language=lang_code %}>{{ blk.body_right|translation:lang_code  |escape }}</textarea>
        {% else %}
            {{ blk.body_right|translation:lang_code  }}
        {% endif %}
    </div>
</fieldset>
{% endblock %}

{% block widget_content_nolang %}
{% endblock %}
