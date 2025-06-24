{% extends "page.tpl" %}

{% block below_body %}
    <div class="c-calendar-listing">
        <h2>{_ All events from _} {{ id.title }}</h2>
        
        {% with m.search.query::%{
            cat: "event",
            qargs: true,
            sort: "-rsc.pivot_date_start",
            is_findable: true,
            hasobject: id,
            pagelen: 1000000
        }
        as result %}
            {% include "cards/calendar.tpl" full_date %}
        {% endwith %}
    </div>
{% endblock %}
