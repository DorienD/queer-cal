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
        sort: "rsc.pivot_date_start"
        is_findable: true
    }
    as result %}
    
        {% for r in result %}
            {% if result[forloop.counter -1].id.date_start|date:"m" != r.date_start|date:"m" %}
                {% if forloop.counter != 1 %}
                    </ol>
                {% endif %}

                <ol class="c-calendar">
                    <li>
                        <h2 class="c-calendar__divider">{{ r.date_start|date:"F" }}</h2>
                    </li>
            {% endif %}
                    <li>
                        <article class="c-calendar-item">
                            <h3 class="c-calendar-item__title">
                                {% include "event/event-title.tpl" id=r %}
                            </h3>

                            {% include "event/event-date.tpl" id=r %}
                            {% include "event/event-location.tpl" id=r %}
                            {% include "event/event-keywords.tpl" id=r %}
                            

                            {% if r.summary %}
                                <details class="c-calendar-item__details">
                                    <summary>Description</summary>
                                    <div class="c-calendar-item__details__content">
                                        {{ r.summary }}
                                    </div>
                                </details>
                            {% endif %}
                        </article>
                    </li>
                {% if forloop.last %}
                </ol>
                {% endif %}
        {% endfor %}
    {% endwith %}
{% endblock %}
