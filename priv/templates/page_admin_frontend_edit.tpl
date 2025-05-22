{% overrules %}

{% block body_class %}t-edit{% endblock %}

{% block navbar %}{% endblock %}
{% block admin_edit %}{% endblock %}

{% block nav %}
    <nav class="c-btns-admin">
        <div id="save-buttons" style="display:none" class="c-main-nav__btns">

            {% button 
                class="c-btn-add-event -bg{{ theme }}" 
                text=_"Save" 
                title=_"Save and view the page"
                action={script script="$('#save_view').click();"}
            %}

            {% if id.is_temporary %}
                <a href="{% url mx_resource_cleanup id=id %}" class="c-btn-admin-edit -cancel">{_ Cancel _}</a>
            {% elseif not tree_id %}
                {% button class="c-btn-admin-edit -cancel" text=_"Cancel" action={redirect back} tag="a" %}
            {% else %}
                {% button class="c-btn-admin-edit -cancel" text=_"Cancel" action={redirect back} tag="a" %}
            {% endif %}
        </div>
    </nav>
{% endblock %}

{% block content_area %}
    <div class="container">
    {% with tree_id|default:(id|menu_rsc) as tree_id %}
        <div class="row">
            {% with m.rsc[tree_id].id as tree_id %}
                {% if tree_id and tree_id.is_visible %}
                    <div class="col-lg-12 col-md-12" id="editcol">
                    {% block editcol %}
                        {% if id %}
                            <p><img src="/lib/images/spinner.gif" width="16" /> {_ Loading ... _}</p>
                        {% else %}
                            {% include "_admin_frontend_nopage.tpl" tree_id=tree_id %}
                        {% endif %}
                    {% endblock %}
                    </div>
                {% elseif id %}
                    <div class="col-lg-12 col-md-12" id="editcol">
                        <p><img src="/lib/images/spinner.gif" width="16" /> {_ Loading ... _}</p>
                    </div>
                {% endif %}

                {% include "_admin_edit_js.tpl" %}
                {% javascript %}
                    cotonic.ready.then( function() {
                        cotonic.broker.publish("$promised/menu/edit-default", { id: {{ id|default:"undefined" }} });
                    });
                {% endjavascript %}

            {% endwith %}
        </div>
    </div>
    {% endwith %}
{% endblock %}