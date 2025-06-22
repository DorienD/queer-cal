{% extends "page.tpl" %}

{% block below_body %}
    {% with m.search[{query 
            query_id=id 
            qargs
            id_exclude=m.rsc.administrator.id 
            cat_exclude='meta' 
            cat_exclude='categorization' 
            pagelen=100
            is_findable 
            is_published
            asort='-rsc.is_featured' }] as result %}
        {% include "cards/list.tpl" card_template="cards/card.tpl" %}
     {% endwith %}
{% endblock %}