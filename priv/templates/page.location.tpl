{% extends "page.tpl" %}

{% block below_body %}
    {% if m.search.query::%{
            cat: "event",
            qargs: true,
            sort: "-rsc.pivot_date_start",
            is_findable: true,
            upcoming: true,
            hasobject: id,
            pagelen: 1000000
        }
        as result %}
        <div class="c-calendar-listing">
            <h2>{_ Upcoming events in _} {{ id.title }}</h2>

            {% include "cards/calendar.tpl" %}
        </div>
    {% endif %}

    {% if m.search.query::%{
            cat: "event",
            qargs: true,
            sort: "-rsc.pivot_date_start",
            is_findable: true,
            finished: true,
            hasobject: id,
            pagelen: 1000000
        }
        as result %}
    <div class="c-calendar-listing">
        <h2>{_ Past events in _} {{ id.title }}</h2>
        
        {% include "cards/calendar.tpl" %}
    </div>
    {% endif %}
{% endblock %}
