{% extends "base.tpl" %}

{% block body_class %}t-text{% endblock %}

{% block content %}
    <article class="o-page-content">
        <h1>{{ id.title }}</h1>

        <time datetime="{{ id.date_start|date:"c":"UTC" }}">
            <span>{{ id.date_start|date:"D d":"UTC" }}</span>
            
            {{ id.date_start|date:"H:i":"UTC" }}

            {% if
                (((id.date_start|add_day)|date:"dm":"UTC" == id.date_end|date:"dm":"UTC") 
                    and id.date_end|date:"H" < 9)
                or
                id.date_end|date:"dm":"UTC" == id.date_start|date:"dm":"UTC" %}
                {# If event ends before next day 9AM only show time #}
                {# If same date only show the end time #}
                - {{ id.date_end|date:"H:i":"UTC" }}
            {% endif %}
            
            {% include "event/share-cal.tpl" %}
        </time>

        {% if r.o.subject or r.tickets %}
            <ul class="c-keyword-list">
                {% for k in r.o.subject %}
                    <li>{{ k.title }}</li>
                {% endfor %}

                {% if r.tickets %}
                    <li><a href="{{ r.tickets }}">Tickets</a></li>
                {% endif %}
            </ul>
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

    {% block page_blocks %}
        {% include "blocks/blocks.tpl" %}
    {% endblock %}

    {% block below_body %}{% endblock %}
{% endblock %}
