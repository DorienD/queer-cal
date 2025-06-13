{% extends "base.tpl" %}

{% block body_class %}t-text{% endblock %}

{% block content %}
    <h1>{{ id.title }}</h1>
    
    {% if id.summary %}
        <p class="t-intro">{{ id.summary }}</p>
    {% endif %}

    {% with m.search.query::%{
        cat: "event",
        qargs: true,
        unfinished: true,
        sort: "rsc.pivot_date_start",
        is_findable: true,
        pagelen: 10000
    }
    as result %}
        {% include "event/_filters.tpl" %}
        
        {% for r in result %}
            {# If previous key has different month than current key → display divider #}
            {% if result[forloop.counter -1].id.date_start|date:"m" != r.date_start|date:"m" %}
                {% if forloop.counter != 1 %}
                    </ol>
                {% endif %}

                <ol class="c-calendar">
                    {% with m.search.query::%{
                        cat: "event",
                        qargs: true,
                        unfinished: true,
                        date_start_after: r.date_start|sub_day|date:"Y-m-d",
                        date_end_before: r.date_start|add_month|date:"Y"++"-"++r.date_start|add_month|date:"m"++"-01",
                        is_findable: true,
                        pagelen: 1000
                    }
                    as this_month %}
                    <li class="c-calendar__divider">
                        <h2 id="{{ (r.date_start|date:"F")|slugify }}">{{ r.date_start|date:"F" }} <sup title="{_ approximately _}">({{ this_month|length }})</sup></h2>

                        <a href="#{{ (r.date_start|add_month|date:"F")|slugify }}" class="c-calendar__divider__next">{_ Next month _}</a>
                    </li>
                    {% endwith %}
            {% endif %}
                    <li>
                        {% catinclude "cards/card.tpl" r %}
                    </li>
                {% if forloop.last %}
                </ol>
                {% endif %}
        {% empty %}
            <p class="c-calendar__empty">{_ No events 🥺, know something? Mail it to: _} <a href="mailto:events@queer-kalender.nl">events@queer-kalender.nl</a></p>
        {% endfor %}
    {% endwith %}
{% endblock %}
