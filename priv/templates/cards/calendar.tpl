{% if result %}
    <ol class="c-calendar">
        {% for r in result %}
            <li {% if r.is_featured %}class="-featured"{% endif %}>
                {% catinclude "cards/card.tpl" r %}
            </li>
        {% endfor %}
    </ol>
{% else %}
    {% include "cards/_empty-calendar.tpl" %}
{% endif %}