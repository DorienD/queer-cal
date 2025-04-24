{% extends "base.tpl" %}

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

     {% with id.o.haspart as result %}
        {% include "cards/list.tpl" result=result %}
    {% endwith %}
{% endblock %}