<div class="c-calendar-item__date">
    <time datetime="{{ id.date_start|date:"c":"UTC" }}">
        {% if id.date_is_all_day %}
            {# All day event #}
            <span>
                {% if details_page %}
                    {{ id.date_start|date:"D d F":"UTC" }}
                {% else %}
                    {{ id.date_start|date:"D d":"UTC" }}
                {% endif %}
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
            {% if details_page %}
                <span>{{ id.date_start|date:"D d F":"UTC" }}</span>
            {% else %}
                <span>{{ id.date_start|date:"D d":"UTC" }}</span>
            {% endif %}
            
            {{ id.date_start|date:"H:i":"UTC" }}

            {% if id.date_start|date:"H":"UTC" == id.date_end|date:"H":"UTC" %}
                {# Same time → Don't display end time #}
            {% elseif
              ((id.date_end|date:"dm":"UTC" == id.date_start|date:"dm":"UTC")
                or
                ((id.date_start|add_day)|date:"dm":"UTC" == id.date_end|date:"dm":"UTC"
                  and id.date_end|date:"H" < 9))
            %}
                {# End date same day or next day before 9 AM → Only display time #}
                - {{ id.date_end|date:"H:i":"UTC" }}
            {% else %}
                {# Else  #}
                {% if details_page %}
                    - <span>{{ id.date_end|date:"D d F":"UTC" }}</span>
                {% else %}
                    - <span>{{ id.date_end|date:"D d":"UTC" }}</span>
                {% endif %}

              {{ id.date_end|date:"H:i":"UTC" }}
            {% endif %}
        {% endif %}
    </time>
    
    {% include "event/share-event.tpl" %}
</div>