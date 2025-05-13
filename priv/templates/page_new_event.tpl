{% extends "page_admin_frontend_edit.tpl" %}

{% block body_class %}t-edit{% endblock %}

{% block navbar %}{% endblock %}
{% block admin_edit %}{% endblock %}

{% block nav %}
    <nav class="c-btns-admin">
        {% if tree_id %}
            {% block close_button %}
                {% if id.is_temporary %}
                    <a href="{% url mx_resource_cleanup id=id %}" class="c-main-nav__btn">{_ Close _}</a>
                {% else %}
                    <a href="{{ id.page_url }}" class="c-main-nav__btn">{_ Close _}</a>
                {% endif %}
            {% endblock %}
            <div id="save-buttons" style="display:none" class="c-main-nav__btns">
        {% else %}
            {# If its not a temp rsc #}
            <div id="save-buttons" style="display:none" class="c-main-nav__btns">
        {% endif %}
            {# {% button class="c-main-nav__btn c-main-nav__btn-primary" text=_"Save" title=_"Save this page."
                      action={script script="$('#save_stay').click();"}
             %} #}

            {% button class="c-btn-add-event -bg{{ theme }}" text=_"Save" title=_"Save and view the page"
                      action={script script="$('#save_view').click();"}
            %}

            {% if not tree_id %}
                <a href="{{ id.page_url }}" class="c-btn-admin-edit -cancel" title="{_ Cancel _}">{_ Cancel _}</a>
            {% else %}
                {% button class="c-btn-admin-edit -cancel" text=_"Cancel" title=_"Cancel" action={redirect back} tag="a" %}
            {% endif %}
        </div>
    </nav>
{% endblock %}

{% block content_area %}
    {% with m.rsc[q.id].id|temporary_rsc:{props category_id='event'} as id %}
        <div class="container">
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