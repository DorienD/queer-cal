{% if (id.o.subject or id.ticket_link or id.signup_link or id.summary) and id.o.subject %}
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

        {% if id.ticket_link %}
            <li>
                <button class="c-calendar-item__dialog -toggle c-keyword-list__item -tickets" data-dialog="tickets-{{ r.id }}">{_ Tickets _}</button>
                
                <dialog id="tickets-{{ r.id }}" class="c-calendar-item__details">
                    <div class="c-calendar-item__details__content">
                        <button class="c-calendar-item__details-close -top"><span class="sr-only">Close</span></button>
                        {% with m.rsc.page_ticket_disclaimer as page %}
                            <h2>{{ page.title }}</h2>
                            
                            {{ page.body }}
                            
                            <a href="{{ id.ticket_link }}" class="c-btn c-btn-primary -icon-external">{_ Proceed to external ticket sale _}</a>
                        {% endwith %}
                    </div>
                </dialog>
            </li>

        {% endif %}
        {% if id.signup_link %}
            <li><a href="{{ id.signup_link }}" class="c-keyword-list__item -signup">{_ Sign up _}</a></li>
        {% endif %}
    </ul>
{% endif %}