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
            {% if result[forloop.counter -1].id.date_start|date:"m" != r.date_start|date:"m" %}
                {# Previous item has different month than current item → display divider #}
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

                        <a href="#{{ (r.date_start|add_month|date:"F")|slugify }}" class="c-calendar__divider__next" title="{_ Next month _}">
                            {% include "icons/icon-caret-left.tpl" %}
                            {_ Next _}
                            {# <span class="sr-only">{_ Next month _}</span> #}
                        </a>
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
            <div class="c-calendar__empty">
                {% if q.qhasobject %}
                    <p>
                        {_ You filtered on _} <strong class="c-keyword-list__item">{{ q.qhasobject.title }}</strong>. {_ But sadly there are no events 🥺, know something? Mail it to: _} <a href="mailto:events@queer-kalender.nl">events@queer-kalender.nl</a>.<br><br> <a href="{% url home %}">{_ Start with a fresh overview of all the events _}</a>
                    </p>
                {% else %}
                    <p>
                        {_ No events 🥺, know something? Mail it to: _} <a href="mailto:events@queer-kalender.nl">events@queer-kalender.nl</a>
                    </p>
                {% endif %}
            </div>
        {% endfor %}
    {% endwith %}
{% endblock %}
