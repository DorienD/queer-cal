{% extends "admin_widget_dashboard.tpl" %}

{% block widget_headline %}
    {_ Quick access to special pages _}
{% endblock %}

{% block widget_content %}
    <table class="table do_adminLinkedTable">
        <thead>
            <tr>
                <th width="55%">{_ Title _}</th>
                <th width="45%">{_ Category _}</th>
            </tr>
        </thead>
        <tbody>
            {% for id in m.rsc.special_pages.o.haspart %}
                {% if m.rsc[id].is_visible %}
                    <tr class="{% if not m.rsc[id].is_published %}unpublished{% endif %}" data-href="{% url admin_edit_rsc id=id %}">
                        <td>
                            {% if media %}
                                <div class="admin-list-thumb">
                                {% image id mediaclass="admin-list-dashboard" class="thumb" %}
                            {% endif %}
                            <span>{{ (m.rsc[id].title|striptags|truncate:50)|default:_"<em>Untitled</em>" }}</span>
                            {% if media %}
                                </div>
                            {% endif %}
                            <span class="label label-default pull-right">
                                {{ id.name }}
                            </span> 
                        </td>

                        {% if show_date %}
                            <td>
                                {{ id.modified|date:"j F Y - H:i:s" }}
                            </td>
                            <td>
                                {{ id.category_id.short_title|default:id.category_id.title }}
                                <span class="pull-right buttons">
                                    {% if id.page_url %}<a href="{{ id.page_url }}" class="btn btn-default btn-xs">{_ view _}</a>{% endif %}
                                    <a href="{% url admin_edit_rsc id=id %}" class="btn btn-default btn-xs">{_ edit _}</a>
                                </span>
                            </td>
                        {% else %}
                            <td>
                                {{ id.category_id.short_title|default:id.category_id.title }}
                                <span class="pull-right buttons">
                                    {% if id.page_url %}<a href="{{ id.page_url }}" class="btn btn-default btn-xs">{_ view _}</a>{% endif %}
                                    <a href="{% url admin_edit_rsc id=id %}" class="btn btn-default btn-xs">{_ edit _}</a>
                                </span>
                            </td>
                        {% endif %}
                    </tr>
                {% endif %}
            {% endfor %}
        </tbody>
    </table> 
        
    <div style="margin: 1rem">
        <a href="{% url keyword_view id=id %}" class="btn btn-default btn-sm">{_ View used/unused keywords _}</a>
        <a href="{% url dialogue_view id=id %}" class="btn btn-default btn-sm">{_ View dialogues without country _}</a>
        <a href="{% url custom_export %}" class="btn btn-default btn-sm">{_ Custom exports _}</a>
    </div>
{% endblock %}