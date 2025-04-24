{% extends "admin_edit_widget_std.tpl" %}

{% block widget_header %}{% endblock %}
    {% block widget_title %}
    {_ Media _}<div class="widget-header-tools"></div>
{% endblock %}
{% block widget_show_minimized %}false{% endblock %}
{% block widget_id %}edit-block-{{ #block }}{% endblock %}

{% block widget_content %}
<p>{_ Connecting 1 image will display a large page filling image. Connecting 2 will display them next to eachother.  _}</p>

<div class="form-group row">
    <div class="col-md-6">
        <fieldset class="block-page">
            <h3 class="h4">{_ Media 1 _}</h3>
            <div class="rsc-item-wrapper" id="{{ #wrap }}">
                {% if blk.rsc_id %}
                    {% catinclude "_rsc_block_item.tpl" blk.rsc_id %}
                {% endif %}
            </div>
            <br>
            <a class="btn btn-default page-connect" href="#connect">{_ Connect media _}</a>
            <br><br>
            <a href="#disconnect" class="btn btn-xs btn-danger page-disconnect">{_ Remove _}</a>
            <input type="hidden" id="block-{{name}}-rsc_id" name="blocks[].rsc_id" value="{{ blk.rsc_id }}" />
        </fieldset>
        <br>
    </div>
    <div class="col-md-6">
        <fieldset class="block-page">
            <h3 class="h4">{_ Media 2 _}</h3>
            <div class="rsc-item-wrapper" id="{{ #wrap2 }}">
                {% if blk.rsc2_id %}
                    {% catinclude "_rsc_block_item.tpl" blk.rsc2_id %}
                {% endif %}
            </div>
            <br>
            <a class="btn btn-default page-connect" href="#connect">{_ Connect media _}</a>
            <br><br>
            <a href="#disconnect" class="btn btn-xs btn-danger page-disconnect">{_ Remove _}</a>
            <input type="hidden" id="block-{{name}}-rsc2_id" name="blocks[].rsc2_id" value="{{ blk.rsc2_id }}" />
        </fieldset>
        <br>
    </div>
</div>
<hr>
<div class="form-group row">
    <div class="col-md-6">
        <h3 class="h4">{_ Height _}</h3>
        <p>{_ The height setting is only an option when using a single image. _}</p>
        <p>{_ A video will take a aspect-ratio of 2/1 always. _}</p>
        <label for="height-standard-{{name}}">
            <input type="radio" id="height-standard-{{name}}" name="blocks[].height~{{name}}" value="standard" {% if blk.height == "standard" or blk.height == undefined %}checked{% endif%}> {_ Standard _}
        </label><br>
        <label for="height-70-{{name}}">
            <input type="radio" id="height-70-{{name}}" name="blocks[].height~{{name}}" value="height-70" {% if blk.height == "height-70" %}checked{% endif%}> {_ 70% of the screen _}
        </label><br>
        <label for="height-100-{{name}}">
            <input type="radio" id="height-100-{{name}}" name="blocks[].height~{{name}}" value="height-100" {% if blk.height == "height-100" %}checked{% endif%}> {_ 100% width of screen auto height of the image _}
        </label>
    </div>
</div>
{% endblock %}


