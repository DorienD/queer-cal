{% extends "page.tpl" %}

{% block below_body %}
    <div class="c-calendar-listing">
        <h2>{_ All events with the _} <span class="c-keyword-list__item">{{ id.title }}</span> {_ keyword _}</h2>

        {% if id.summary or id.body %}
            <div class="c-body-text">
                {% if id.summary %}
                    <p class="c-summary">{{ id.summary }}</p>
                {% endif %}

                {% if id.body %}
                    {{ id.body|show_media }}
                {% endif %}
            </div>
        {%endif %}

        {% with m.search.query::%{
            cat: "event",
            qargs: true,
            sort: "-rsc.pivot_date_start",
            is_findable: true,
            hasobject: id,
            pagelen: 1000000
        }
        as result %}
            {% include "cards/calendar.tpl" %}
        {% endwith %}
    </div>
{% endblock %}
