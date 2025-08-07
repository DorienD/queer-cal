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
                        <h2 id="{{ (r.date_start|date:"F")|slugify }}">{{ r.date_start|date:"F" }} {% if this_month|length > 0 %}<sup title="{_ approximately _}">({{ this_month|length }})</sup>{% endif %}</h2>

                        <a href="#first-{{ (r.date_start|sub_month|date:"F")|slugify }}" class="c-calendar__divider__nav -prev" title="{_ Previous month _}">
                            {% include "icons/icon-caret-left.tpl" %}
                            {_ Previous _}
                        </a>

                        <a href="#{{ (r.date_start|add_month|date:"F")|slugify }}" class="c-calendar__divider__nav -next" title="{_ Next month _}">
                            {% include "icons/icon-caret-left.tpl" %}
                            {_ Next _}
                        </a>
                    </li>
                    {% endwith %}
            {% endif %}
                    {% if result[forloop.counter -1].id.date_start|date:"m" != r.date_start|date:"m" %}
                    <li id="first-{{ r.date_start|date:"F"|slugify }}" class="c-calendar__first {% if r.is_featured %} -featured{% endif %}">
                    {% else %}
                        <li{% if r.is_featured %} class="-featured"{% endif %}>
                    {% endif %}
                    {% if forloop.counter == 6 %}
                        {% include "cards/card.support.tpl" %}
                        
                        {% catinclude "cards/card.tpl" r %}
                    {% else %}
                        {% catinclude "cards/card.tpl" r %}
                    {% endif %}
                    </li>
                {% if forloop.last %}
                </ol>
                {% endif %}
        {% empty %}
            {% include "cards/_empty-calendar.tpl" %}
        {% endfor %}
    {% endwith %}
{% endblock %}
