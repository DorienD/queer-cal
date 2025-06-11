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