<time datetime="{{ id.date_start|date:"c":"UTC" }}" class="c-calendar-item__date">
    {% if id.date_is_all_day %}
        <span>
            {{ id.date_start|date:"D d":"UTC" }}
            {# Als dezelfde maand dan toon alleen dag anders toon ook maand #}
            {% if id.date_start|date:"m" == id.date_end|date:"m" %}
                {% if id.date_start|date:"d":"UTC" != id.date_end|date:"d":"UTC" %}
                    - {{ id.date_end|date:"d":"UTC" }}
                {% endif %}
            {% else %}
                - {{ id.date_end|date:"d b":"UTC" }}
            {% endif %}
        </span>
    {% else %}
        <span>{{ id.date_start|date:"D d":"UTC" }}</span>
        
        {{ id.date_start|date:"H:i":"UTC" }}

        {% if id.date_start|date:"H":"UTC" == id.date_end|date:"H":"UTC" %}
            {# Only a start time, don't show end time #}
        {% elseif
            (((id.date_start|add_day)|date:"dm":"UTC" == id.date_end|date:"dm":"UTC") 
                and id.date_end|date:"H" < 9)
            or
            id.date_end|date:"dm":"UTC" == id.date_start|date:"dm":"UTC" %}
            {# If event ends before next day 9AM only show time #}
            {# If same date only show the end time #}
            - {{ id.date_end|date:"H:i":"UTC" }}
        {% endif %}
    {% endif %}
    
    {% include "event/share-event.tpl" %}

</time>