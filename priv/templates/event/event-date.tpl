<time datetime="{{ id.date_start|date:"c":"UTC" }}">
    <span>{{ id.date_start|date:"D d":"UTC" }}</span>
    
    {{ id.date_start|date:"H:i":"UTC" }}

    {% if
        (((id.date_start|add_day)|date:"dm":"UTC" == id.date_end|date:"dm":"UTC") 
            and id.date_end|date:"H" < 9)
        or
        id.date_end|date:"dm":"UTC" == id.date_start|date:"dm":"UTC" %}
        {# If event ends before next day 9AM only show time #}
        {# If same date only show the end time #}
        - {{ id.date_end|date:"H:i":"UTC" }}
    {% endif %}
    
    {% include "event/share-cal.tpl" %}
</time>