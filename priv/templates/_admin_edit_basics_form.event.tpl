{% with not id or id.is_editable as is_editable %}
<fieldset>
    <h2 class="h3">
        {_ Event _}
    </h2>
    <div class="form-group">
        <label class="control-label" for="{{ #title }}{{ lang_code_for_id }}">
            {_ Title _} * {{ lang_code_with_brackets }}
        </label>
        <input type="text" id="{{ #title }}{{ lang_code_for_id }}"
            name="title{{ lang_code_with_dollar }}"
            placeholder="{_ Title _} {{ lang_code_with_brackets }}"
            value="{{ is_i18n|if : id.translation[lang_code].title : id.title }}"
            {% if not is_editable %}disabled="disabled"{% endif %}
            {% include "_language_attrs.tpl" language=lang_code class="do_autofocus form-control" %}
        >
    </div>

    <div class="form-group">
        <label class="control-label" for="{{ #summary }}{{ lang_code_for_id }}">
            {_ Summary _} {{ lang_code_with_brackets }}
        </label>
        <textarea rows="4" cols="10" id="{{ #summary }}{{ lang_code_for_id }}"
            name="summary{{ lang_code_with_dollar }}"
            placeholder="{_ Summary _} {{ lang_code_with_brackets }}"
            {% if not is_editable %}disabled="disabled"{% endif %}
            {% include "_language_attrs.tpl" language=lang_code class="intro form-control" %}>{{ is_i18n|if : id.translation[lang_code].summary : id.summary | brlinebreaks }}</textarea>
        
    </div>
</fieldset>

{% endwith %}
