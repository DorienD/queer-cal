<div class="c-calendar__empty">
    {% if q.qhasobject or q.qongoing_date %}
        <p>
            {_ You filtered on _} {% if q.qhasobject %}<strong class="c-keyword-list__item">{{ q.qhasobject.title }}</strong>{% endif %}{% if q.qongoing_date %}{% if q.qhasobject %} and {% endif %}<strong class="c-keyword-list__item">{{ q.qongoing_date|date:"d-m-Y" }}</strong>{% endif %}. 
            {_ But sadly there are no events 🥺, know something? Mail it to: _} <a href="mailto:events@queer-kalender.nl">events@queer-kalender.nl</a>.<br><br> <a href="{% url home %}">{_ Start with a fresh overview of all the events _}</a>
        </p>
    {% else %}
        {% include "cards/_empty-calendar.tpl" %}
    {% endif %}
</div>