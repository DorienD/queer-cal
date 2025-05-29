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
        pagelen: 1000000
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
                                    <a href="{% url admin_frontend_edit id=r %}" class="c-calender-item__edit">
                                        - {_ Edit _}
                                    </a>
                                {% endif %}
                            </h3>

                            {% include "event/event-date.tpl" id=r %}
                            {% include "event/event-location.tpl" id=r %}
                            {% include "event/event-keywords.tpl" id=r %}
                            

                            {# {% if r.summary %}
                                <dialog id="details-{{ r.id }}" class="c-calendar-item__details">
                                    <div class="c-calendar-item__details__content">
                                        <h3>{_ Description _}</h3>
                                        
                                        <p>{{ r.summary }}</p>

                                        <button class="c-calendar-item__details-close">Close</button>
                                    </div>
                                </dialog>
                                <button class="c-calendar-item__details-toggle" data-dialog="details-{{ r.id }}">{_ Description _}</button>
                            {% endif %} #}
                        </article>
                    </li>
                {% if forloop.last %}
                </ol>
                {% endif %}
        {% endfor %}
    {% endwith %}

    {% javascript %}
        
    {% endjavascript %}
{% endblock %}
