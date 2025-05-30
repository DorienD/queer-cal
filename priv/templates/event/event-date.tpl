<div class="c-calendar-item__date">
    <time datetime="{{ id.date_start|date:"c":"UTC" }}">
        {% if id.date_is_all_day %}
            {# All day event #}
            <span>
                {{ id.date_start|date:"D d":"UTC" }}
                {# If the same month, only display day else also display month #}
                {% if id.date_start|date:"m" == id.date_end|date:"m" %}
                    {% if id.date_start|date:"d":"UTC" != id.date_end|date:"d":"UTC" %}
                        - {{ id.date_end|date:"d":"UTC" }}
                    {% endif %}
                {% else %}
                    - {{ id.date_end|date:"d b":"UTC" }}
                {% endif %}
            </span>
        {% else %}
            {# Event with time #}
            <span>{{ id.date_start|date:"D d":"UTC" }}</span>
            
            {{ id.date_start|date:"H:i":"UTC" }}

            {% if id.date_start|date:"H":"UTC" == id.date_end|date:"H":"UTC" %}
                {# Only a start time, don't display end time #}
            {% elseif
                (((id.date_start|add_day)|date:"dm":"UTC" == id.date_end|date:"dm":"UTC") 
                    and id.date_end|date:"H" < 9)
                or
                id.date_end|date:"dm":"UTC" == id.date_start|date:"dm":"UTC" %}
                {# If event ends before next day 9AM only display time #}
                {# If same date only display the end time #}
                - {{ id.date_end|date:"H:i":"UTC" }}
            {% endif %}
        {% endif %}
    </time>
    
    {% include "event/share-event.tpl" %}
</div>