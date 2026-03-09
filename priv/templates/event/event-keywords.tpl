{% if id.o.subject or id.ticket_url or id.ticket_link or id.signup_url or id.signup_link or id.summary %}
    {% if r.summary %}
        <dialog id="details-{{ r.id }}" class="c-calendar-item__details">
            <div class="c-calendar-item__details__content">
                <button class="c-calendar-item__details-close -top"><span class="sr-only">Close</span></button>

                <h3>{{ r.title }}</h3>

                {% include "event/event-date.tpl" hide_share_event full_date %}
                {% include "event/event-location.tpl" %}

                <p>{{ r.summary }}</p>

                <button class="c-calendar-item__details-close">Close</button>
            </div>
        </dialog>
    {% endif %}

    <ul class="c-keyword-list">
        {% if r.summary %}
            <li>
                <button class="c-calendar-item__dialog c-keyword-list__item -desc" data-dialog="details-{{ r.id }}">{_ Description _}</button>
            </li>
        {% endif %}

        {% for keyword in id.o.subject %}
            <li>
                <a href="{% url home %}?qhasobject={{ keyword.id }}" class="c-keyword-list__item" title="{_ Filter on _} {{ keyword.title|lower }}">{{ keyword.title }}</a>
            </li>
        {% endfor %}

        {% if id.ticket_url or id.ticket_link  %}
            <li>
                <a href="{{ id.ticket_url|default:(id.ticket_link|sanitize_url) }}"
                   rel="noopener"
                   target="_blank"
                   class="c-keyword-list__item -tickets -icon-external">
                    {_ Tickets _}
                </a>
            </li>
        {% endif %}

        {% if id.signup_url or id.signup_link %}
            <li>
                <a href="{{ id.signup_url|default:(id.signup_link|sanitize_url) }}"
                    rel="noopener"
                    target="_blank"
                    class="c-keyword-list__item -signup">
                    {_ Sign up _}
                </a>
            </li>
        {% endif %}
    </ul>
{% endif %}
