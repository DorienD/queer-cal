{% extends "base.tpl" %}

{% block body_class %}t-text{% endblock %}

{% block content %}
    <article class="o-page-content">
        <a href="{% url home %}" class="c-btn-back">{% include "icons/icon-caret-left.tpl" width="14px" height="14px" %}{_ All events _}</a>

        <h1>{{ id.title }}</h1>

        {% if id.website %}
            <address>
                {% if id.address_street_1 %}
                    {{ id.address_street_1 }}<br>
                {% endif %}
                {% if id.address_city %}
                    {{ id.address_city }}<br><br>
                {% endif %}
                <a href="https://www.homomonument.nl/">website {% include "icons/icon-external.tpl" width="13px" height="13px" color="var(--typographyColor)" %}</a>
            </address>
        {% endif %}

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
    </article>

    {% block below_body %}{% endblock %}
{% endblock %}
