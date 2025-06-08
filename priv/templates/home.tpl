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
            {% if result %}
                <p class="c-filters__months">
                    Go to: 
                    {% for r in result %}
                        {% if result[forloop.counter -1].id.date_start|date:"m" != r.date_start|date:"m" %}
                            <a href="#{{ r.date_start|date:"F"|slugify }}">{{ r.date_start|date:"F" }}</a>
                        {% endif %}
                    {% endfor %}
                </p>
            {% endif %}

            <form action="/" class="c-filters__keywords">
                {% if q.qhasobject %}
                    <label for="j-filter-keyword">{_ You've filtered on _}</label>
                {% else %}
                    <label for="j-filter-keyword" class="sr-only">{_ Filter _}</label>
                {% endif %}
                <div class="c-filters__keywords__list">
                    <select id="j-filter-keyword" name="qhasobject">
                        {% if q.qhasobject %}
                            <option value=" ">{_ Remove filter _}</option>
                        {% else %}
                            <option value=" ">{_ Filter on a keyword _}</option>
                        {% endif %}
                        {% for r in  m.search.query::%{
                            cat: "keyword",
                            sort: "rsc.pivot_title",
                            is_findable: true,
                            pagelen: 1000000
                        }%}
                            <option value="{{ r.id }}" {% if q.qhasobject == r.id %}selected{% endif  %}>{{ r.title }}</option>
                        {% endfor %}
                    </select>
                </div>
                <button type="submit" id="j-filter-submit" class="c-btn c-btn-filter-submit">{_ Apply filter _}</button>
                {% if q.qhasobject %}
                    <a href="{% url home %}" class="c-filters__keywords__remove c-btn-square">{% include "icons/icon-plus.tpl" color="var(--typographyColor)" %}<span>{_ reset _}</span></a>
                {% endif %}
            </form>
        </div>
        {% for r in result %}
            {% if result[forloop.counter -1].id.date_start|date:"m" != r.date_start|date:"m" %}
                {% if forloop.counter != 1 %}
                    </ol>
                {% endif %}

                <ol class="c-calendar">
                    <li class="c-calendar__divider">
                        <h2 id="{{ (r.date_start|date:"F")|slugify }}">{{ r.date_start|date:"F" }}</h2>

                        <a href="#{{ (r.date_start|add_month|date:"F")|slugify }}" class="c-calendar__divider__next">{_ Next month _}</a>
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
            <p class="c-calendar__empty">{_ No events 🥺, know something? Mail it to: _} <a href="mailto:events@queer-kalender.nl">events@queer-kalender.nl</a></p>
        {% endfor %}
    {% endwith %}

    {% javascript %}
        
    {% endjavascript %}
{% endblock %}
