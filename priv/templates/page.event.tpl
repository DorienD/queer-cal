{% extends "base.tpl" %}

{% block body_class %}t-text{% endblock %}

{% block content %}
    <article class="o-page-content">
        <a href="{% url home %}" class="c-btn-back">{% include "icons/icon-caret-left.tpl" width="14px" height="14px" %}{_ All events _}</a>
        
        <h1>
            {{ id.title }} 
            {% if id.is_editable %}
                <a href="{% url admin_frontend_edit id=id %}">
                    - {_ Edit _}
                </a>
            {% endif %}
        </h1>

        {% include "event/event-date.tpl" full_date %}

        {% include "event/event-location.tpl" %}

        {% if id.website %}
            <a href="{{ id.website }}" target="_blank" rel="noopener">{_ Website _}</a>
        {% endif %}

        {% block body %}
            {% if id.summary %}
                <p class="c-summary">{{ id.summary }}</p>
            {% else %}
                {% if z_language == "nl" %}
                    {% if id.summary|translation:"en" %}
                        <p class="c-summary"><i>{_ Description only provided in English _}</i></p>
                    {% endif %}
                {% endif %}

                {% if z_language == "en" %}
                    {% if id.summary|translation:"nl" %}
                        <p class="c-summary"><i>{_ Description only provided in Dutch _}</i></p>
                    {% endif %}
                {% endif %}
            {% endif %}
        {% endblock %}

        {% include "event/event-keywords.tpl" %}
    </article>

    {% block below_body %}{% endblock %}
{% endblock %}
