{% extends "page.tpl" %}

{% block page_title %}
    <h1>
        {% if id.name_first %}
            Hi {{ id.name_first }}!
        {% else %}
            {{ id.title|default:_"Your profile" }}
        {% endif %}

        {% if id.is_editable %}
            <a href="{% url admin_frontend_edit id=id %}">
                - {_ Edit _}
            </a>
        {% endif %}
    </h1>

    <p>{% trans "If you need some help adding events, check out the <a href=\"{url}\">FAQ</a>."
                     url=m.rsc.page_faq.page_url
            %}</p>
    
{% endblock %}

{% block below_body %}
    {% with m.search.paged[{query 
            query_id=id 
            qargs
            page=q.page
            id_exclude=m.rsc.administrator.id 
            cat="event"
            hasobject=id
            pagelen=100
            is_findable 
            sort="-rsc.pivot_date_start"
            is_published}] as result %}
        {% if result %}
            <h2>{_ Your added events _}</h2>

            {% include "cards/list.tpl" card_template="cards/card.tpl" %}

            {% pager result=result id=id qargs hide_single_page template="pager/_pager.tpl" %}
        {% else %}
            {% if id.is_editable %}
                <h2>{_ Start adding your events! _}</h2>
                
                <a href="{% url new_event %}" class="c-btn c-btn-primary">{_ Publish your first event _}</a>
            {% endif %}
        {% endif %}
     {% endwith %}
{% endblock %}

{% block admin_edit %}
    <div class="c-btns-admin">
        {% if m.acl.is_allowed.insert.event %}
            {% if id.s.author|length > 0 %}
                <a href="{% url new_event %}" class="c-btn-add-event -bg{{ theme }}">{% include "icons/icon-plus.tpl" color="#242424" %} {_ Add Event _}</a>
            {% endif %}
        {% else %}
            <a href="{% url logon %}" class="c-btn-add-event -bg{{ theme }}">{% include "icons/icon-plus.tpl" color="#242424" %} {_ Add Event _}</a>
        {% endif %}

        {% if m.acl.is_allowed.use.mod_admin %}
            {% if id %}
                <a href="{% url admin_edit_rsc id=id %}" class="c-btn-admin-edit">{_ Admin edit _}</a>
            {% else %}
                <a href="{% url admin %}" class="c-btn-admin-edit">{_ Admin _}</a>
            {% endif %}
        {% endif %}
    </div>
{% endblock %}