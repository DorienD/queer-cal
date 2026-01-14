{% extends "base.tpl" %}

{% block skip_link %}{% endblock %}
{% block nav %}{% endblock %}

{% block content_area %}
    <h1>Queer-kalender.nl</h1>

    <h2>
        Upcoming events in Amsterdam<br>
    </h2>

    {% if id.summary %}
        <p class="p-summary">{{ id.summary }}</p>
    {% endif %}

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
        Wanna see everything that’s happening this month (and then some)? Head to queer-kalender.nl. Got something queer to add, or spot a missing event? Mail us at events@queer-kalender.nl
    </footer>
{% endblock %}