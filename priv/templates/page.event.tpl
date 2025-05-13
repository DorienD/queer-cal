{% extends "base.tpl" %}

{% block body_class %}t-text{% endblock %}

{% block content %}
    <article class="o-page-content">
        <a href="{% url home %}" class="c-btn-back">{% include "icons/icon-caret-left.tpl" width="14px" height="14px" %}{_ All events _}</a>
        
        <h1>{{ id.title }}</h1>

        {% include "event/event-date.tpl" %}

        {% block body %}
            {% if id.summary %}
                <p class="c-summary">{{ id.summary }}</p>
            {% endif %}
            
            {% if id.body %}
                <div class="c-body-text">
                    {{ id.body|show_media }}
                </div>
            {% endif %}
        {% endblock %}

        {% include "event/event-keywords.tpl" %}
    </article>

    {% block below_body %}{% endblock %}
{% endblock %}
