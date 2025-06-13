{% if result %}
    <ol class="c-calendar">
        <li class="c-calendar__divider">
            <h2 id="{{ (result[1].date_start|date:"F")|slugify }}">{{ result[1].date_start|date:"F" }}</h2>

            <a href="#{{ (result[1].date_start|add_month|date:"F")|slugify }}" class="c-calendar__divider__next">{_ Next month _}</a>
        </li>
    {% for r in result %}
        <li>
            {% catinclude "cards/card.tpl" r %}
        </li>
    {% endfor %}
    </ol>
{% else %}
    <p class="c-calendar__empty">{_ No events 🥺, know something? Mail it to: _} <a href="mailto:events@queer-kalender.nl">events@queer-kalender.nl</a></p>
{% endif %}