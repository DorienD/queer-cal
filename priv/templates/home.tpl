{% extends "base.tpl" %}

{% block body_class %}t-text{% endblock %}

{% block content %}
    <h1>{{ id.title }}</h1>
    
    {% if id.summary %}
        <p class="t-intro">{{ id.summary }}</p>
    {% endif %}

    {% if m.site.environment == `production` %}
        {% with m.search.query::%{
            cat: "event",
            unfinished: true,
            is_findable: true,
            pagelen: 10000
        }
        as total %}

        {% with m.search.query::%{
            cat: "event",
            qargs: true,
            unfinished: true,
            "pivot:city": q.city|if:q.city:"amsterdam",
            sort: "rsc.pivot_date_start",
            is_findable: true,
            pagelen: 10000
        }
        as result %}

            {% include "calendar/_filters.tpl" %}
            
            {% include "calendar/calendar.tpl" result=result %}
        {% endwith %}
        {% endwith %}
    {% else %}
        {# If not production, show all events for easier testing purposes #}
        {% with m.search.query::%{
            cat: "event",
            is_findable: true,
            pagelen: 10000
        }
        as total %}

        {% with m.search.query::%{
            cat: "event",
            qargs: true,
            "pivot:city": q.city|if:q.city:"amsterdam",
            sort: "rsc.pivot_date_start",
            is_findable: true,
            pagelen: 10000
        }
        as result %}

            {% include "calendar/_filters.tpl" %}
            
            {% include "calendar/calendar.tpl" result=result %}
        {% endwith %}
        {% endwith %}
    {% endif %}
{% endblock %}

{% block above_footer %}
    {% with m.search.query::%{
        cat: "event",
        sort: "-rsc.modified",
        is_findable: true,
        pagelen: 1
    } as modified
    %}
    {% for r in modified %}
        <p class="c-calendar-modified">{_ Last updated on _} <time datetime="{{ r.modified|date:"c" }}">{{ r.modified|date:"d-m-Y, H:i" }}</p>
    {% endfor %}
    {% endwith %}
{% endblock %}
