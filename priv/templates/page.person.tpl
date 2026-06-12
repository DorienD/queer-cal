{% extends "page.tpl" %}

{% block below_body %}
    <h2>Your added events</h2>
    {% with m.search.paged[{query 
            query_id=id 
            qargs
            page=q.page
            id_exclude=m.rsc.administrator.id 
            cat="event"
            pagelen=100
            is_findable 
            sort="-rsc.pivot_date_start"
            is_published}] as result %}
        {% include "cards/list.tpl" card_template="cards/card.tpl" %}

        {# {% pager result=result id=id qargs hide_single_page template="pager/_pager.tpl" %} #}
     {% endwith %}
{% endblock %}