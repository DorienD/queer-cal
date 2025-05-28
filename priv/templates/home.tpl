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
                                {% if r.is_editable %}
                                    <a href="{% url admin_frontend_edit id=id %}" class="c-calender-item__edit">
                                        - {_ Edit _}
                                    </a>
                                {% endif %}
                            </h3>

                            {% include "event/event-date.tpl" id=r %}
                            {% include "event/event-location.tpl" id=r %}
                            {% include "event/event-keywords.tpl" id=r %}
                            

                            {% if r.summary %}
                                <details class="c-calendar-item__details">
                                    <summary>Description</summary>
                                    <div class="c-calendar-item__details__content">
                                        {# TODO: check if there is a summary in dutch and explain #}
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
