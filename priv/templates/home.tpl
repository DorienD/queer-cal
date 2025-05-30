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
        <div class="c-filters">
            <p class="c-filters__months">
                Go to: 
                <a href="#{{ (now|date:"F")|slugify }}">{{ now|date:"F" }}</a>
                <a href="#{{ (now|add_month|date:"F")|slugify }}">{{ now|add_month|date:"F" }}</a>
                <a href="#{{ (now|add_month:3|date:"F")|slugify }}">{{ now|add_month:3|date:"F" }}</a>
                <a href="#{{ (now|add_month:4|date:"F")|slugify }}">{{ now|add_month:4|date:"F" }}</a>
            </p>

            <form action="/" class="c-filters__keywords">
                <select id="j-filter-keyword" name="qhasobject">
                    <option value=" ">{_ Filter on a keyword _}</option>
                    {% for r in  m.search.query::%{
                        cat: "keyword",
                        sort: "rsc.pivot_title",
                        is_findable: true,
                        pagelen: 1000000
                    }%}
                        <option value="{{ r.id }}" {% if q.qhasobject == r.id %}selected{% endif  %}>{{ r.title }}</option>
                    {% endfor %}
                </select>
                <button type="submit" id="j-filter-submit" class="c-btn c-btn-filter-submit">{_ Apply filter _}</button>
            </form>
        </div>
        {% for r in result %}
            {% if result[forloop.counter -1].id.date_start|date:"m" != r.date_start|date:"m" %}
                {% if forloop.counter != 1 %}
                    </ol>
                {% endif %}

                <ol class="c-calendar">
                    <li>
                        <h2 id="{{ (r.date_start|date:"F")|slugify }}" class="c-calendar__divider">{{ r.date_start|date:"F" }}</h2>
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
                        </article>
                    </li>
                {% if forloop.last %}
                </ol>
                {% endif %}
        {% empty %}
            {_ No events 🥺, know something? Mail it to: _} <a href="mailto:events@queer-kalender.nl">events@queer-kalender.nl</a>
        {% endfor %}
    {% endwith %}

    {% javascript %}
        
    {% endjavascript %}
{% endblock %}
