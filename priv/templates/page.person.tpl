{% extends "page.tpl" %}

{% block below_body %}

    <h2>{_ Your added events _}</h2>

    {# <a href="{% url logoff %}" id="{{ #logoff }}">{_ Log Off _}</a> #}
        
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
        {% include "cards/list.tpl" card_template="cards/card.tpl" %}

        {% pager result=result id=id qargs hide_single_page template="pager/_pager.tpl" %}
     {% endwith %}
{% endblock %}`