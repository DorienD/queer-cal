{% if id.o.subject or id.ticket_link or id.signup_link %}
    <ul class="c-keyword-list">
        {% for keyword in id.o.subject %}
            <li>
                {% if keyword.summary %}
                    <button popovertarget="keyword-explan-{{ #keyword }}" popovertargetaction="toggle" class="c-keyword-list__item">
                        {{ keyword.title }}
                    </button>

                    <div id="keyword-explan-{{ #keyword }}" popover="auto" class="c-keyword-explan">
                        {{ keyword.summary }}
                    </div>
                {% else %}
                    <span class="c-keyword-list__item">{{ keyword.title }}</span>
                {% endif %}
            </li>
        {% endfor %}

        {% if id.ticket_link %}
            <li><a href="{{ id.ticket_link }}" class="c-keyword-list__item -tickets">{_ Tickets _}</a></li>
        {% endif %}
        {% if id.signup_link %}
            <li><a href="{{ id.signup_link }}" class="c-keyword-list__item -signup">{_ Sign up _}</a></li>
        {% endif %}
    </ul>
{% endif %}