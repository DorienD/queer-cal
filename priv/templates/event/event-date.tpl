{% with 
    id.date_start,
    id.date_end
    as
    date_start,  
    date_end 
%}
<div class="c-calendar-item__date">
    <time datetime="{{ date_start|date:"c" }}">
        {% if id.date_is_all_day %}
            {# All day event #}
            <span>
                {% if full_date %}
                    {{ date_start|date:"d-m-Y" }} - {{ date_end|date:"d-m-Y":"UTC" }}
                {% elseif date_start|date:"d-m-F" == now|date:"d-m-F" %}
                    <span>{_ Today _}</span>
                {% else %}
                    {% if date_start|date:"m" != date_end|date:"m" %}
                        {# Date end in a different month → display month #}
                        {{ date_start|date:"D d b" }}
                    {% else %}
                        {{ date_start|date:"D d" }}
                    {% endif %}
                    
                    {# Same month → only display day else also display month #}
                    {% if date_start|date:"m" == date_end|date:"m" %}
                        {% if date_start|date:"d" != date_end|date:"d" %}
                            - {{ date_end|date:"d":"UTC" }}
                        {% endif %}
                    {% else %}
                        - {{ date_end|date:"d b" }}
                    {% endif %}
                {% endif %}
            </span>
        {% else %}
            {# Event with time #}
            {% if full_date %}
                <span>{{ date_start|date:"d-m-Y" }}</span>
            {% elseif date_start|date:"d-m-F" == now|date:"d-m-F" %}
                <span>{_ Today _}</span>
            {% else %}
                {% if date_start|date:"m" != date_end|date:"m" %}
                    {# If date end is in a different month, display month #}
                    <span>{{ date_start|date:"D d b" }}</span>
                {% else %}
                    <span>{{ date_start|date:"D d" }}</span>
                {% endif %}
            {% endif %}
            
            {{ date_start|date:"H:i" }}

            {% if date_start|date:"H" == date_end|date:"H" %}
                {# Same time → Don't display end time #}
            {% elseif
              ((date_end|date:"dm" == date_start|date:"dm")
                or
                ((date_start|add_day)|date:"dm" == date_end|date:"dm"
                  and date_end|date:"H" < 9))
            %}
                {# End date same day or next day before 9 AM → Only display time #}
                - {{ date_end|date:"H:i" }}
            {% else %}
                {# Else #}
                {% if full_date %}
                    - <span>{{ date_end|date:"d-m-Y" }}</span>
                {% else %}
                    {% if date_start|date:"m" != date_end|date:"m" %}
                        {# Date end in a different month → display month #}
                        - <span>{{ date_end|date:"D d b" }}</span>
                    {% else %}
                        - <span>{{ date_end|date:"D d" }}</span>
                    {% endif %}
                {% endif %}

              {{ date_end|date:"H:i" }}
            {% endif %}
        {% endif %}
    </time>
    
    {% if not hide_share_event %}
        {% include "event/_share-event.tpl" %}
    {% endif %}
</div>
{% endwith %}