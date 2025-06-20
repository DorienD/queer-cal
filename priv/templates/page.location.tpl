{% extends "page.tpl" %}

{% block below_body %}
    <div class="c-calendar-listing">
        <h2>{_ All events in _} {{ id.title }}</h2>
        
        {% with m.search.query::%{
            cat: "event",
            qargs: true,
            sort: "-rsc.pivot_date_start",
            is_findable: true,
            hasobject: id,
            pagelen: 1000000
        }
        as result %}
            {% for r in result %}
                <ol class="c-calendar">
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

                            {% include "event/event-date.tpl" id=r full_date %}
                            {% include "event/event-location.tpl" id=r %}
                            {% include "event/event-keywords.tpl" id=r %}
                        </article>
                    </li>
                </ol>
            {% empty %}
                <p class="c-calendar__empty">{_ No events 🥺, know something? Mail it to: _} <a href="mailto:events@queer-kalender.nl">events@queer-kalender.nl</a></p>
            {% endfor %}
        {% endwith %}
    </div>
{% endblock %}
