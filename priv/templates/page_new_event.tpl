{% extends "page_admin_frontend_edit.tpl" %}

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