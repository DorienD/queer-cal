{% extends "base.tpl" %}

{% block header %}
    {% catinclude 'header/header-small.tpl' id %}
{% endblock %}

{% block content %}
    <article class="o-page-content">
        <h1>{{ id.title }}</h1>
        
        {% if id.summary %}
            <p class="summary">{{ id.summary }}</p>
        {% endif %}

        <div class="body-text">
            {{ id.body|show_media }}
        </div>
        
        {% block below_body %}{% endblock %}
    </article>

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