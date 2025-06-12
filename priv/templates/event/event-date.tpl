<div class="c-calendar-item__date">
    <time datetime="{{ id.date_start|date:"c":"UTC" }}">
        {% if id.date_is_all_day %}
            {# All day event #}
            <span>
                {% if full_date %}
                    {{ id.date_start|date:"d-m-Y":"UTC" }} - {{ id.date_end|date:"d-m-Y":"UTC" }}
                {% elseif id.date_start|date:"d-m-F":"UTC" == now|date:"d-m-F":"UTC" %}
                    <span>{_ Today _}</span>
                {% else %}
                    {{ id.date_start|date:"D d":"UTC" }}
                    {# If the same month, only display day else also display month #}
                    {% if id.date_start|date:"m" == id.date_end|date:"m" %}
                        {% if id.date_start|date:"d":"UTC" != id.date_end|date:"d":"UTC" %}
                            - {{ id.date_end|date:"d":"UTC" }}
                        {% endif %}
                    {% else %}
                        - {{ id.date_end|date:"d b":"UTC" }}
                    {% endif %}
                {% endif %}
            </span>
        {% else %}
            {# Event with time #}
            {% if full_date %}
                <span>{{ id.date_start|date:"d-m-Y":"UTC" }}</span>
            {% elseif id.date_start|date:"d-m-F":"UTC" == now|date:"d-m-F":"UTC" %}
                <span>{_ Today _}</span>
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
                {# Else #}
                {% if full_date %}
                    - <span>{{ id.date_end|date:"d-m-Y":"UTC" }}</span>
                {% else %}
                    {% if id.date_start|date:"m" != id.date_end|date:"m" %}
                        {# If date end is in a different month #}
                        - <span>{{ id.date_end|date:"D d b":"UTC" }}</span>
                    {% else %}
                        - <span>{{ id.date_end|date:"D d":"UTC" }}</span>
                    {% endif %}
                {% endif %}

              {{ id.date_end|date:"H:i":"UTC" }}
            {% endif %}
        {% endif %}
    </time>
    
    {% include "event/_share-event.tpl" %}
</div>