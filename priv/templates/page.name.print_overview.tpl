{% extends "base.tpl" %}

{% block skip_link %}{% endblock %}
{% block nav %}{% endblock %}

{% block content_area %}
    <h1>Queer-kalender.nl</h1>

    <h2>
        What's on this week in Amsterdam <br>
        <span>{{ id.summary }}</span>
    </h2>

    {# {% if id.summary %}
        <h3 class="p-summary">{{ id.summary }}</h3>
    {% endif %} #}

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

{% block footer %}
    <footer class="p-footer">
        {_ Check the full overview on queer-kalender.nl. Missing something or want to add your event? Mail events@queer-kalender.nl _}.
    </footer>
{% endblock %}