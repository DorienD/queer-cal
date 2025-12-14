{% if m.server_storage.skip_ticket_warning == true %}
    <a href="{{ id.ticket_link }}"
       rel="noopener"
       target="_blank"
       class="c-keyword-list__item -tickets -icon-external">
        {_ Tickets _}
    </a>
{% else %}
    <button class="c-calendar-item__dialog -toggle c-keyword-list__item -tickets"
            data-dialog="tickets-{{ r.id }}">
        {_ Tickets _}
    </button>

    <dialog id="tickets-{{ r.id }}" class="c-calendar-item__details">
        <div class="c-calendar-item__details__content">
            <button class="c-calendar-item__details-close -top">
              <span class="sr-only">Close</span>
            </button>

            {% with m.rsc.page_ticket_disclaimer as page %}
                <h2>{{ page.title }}</h2>
                
                {{ page.body }}

                {% wire id="ticket_disclaimer" type="submit" postback={set_skip_ticket_warning ticket_url=id.ticket_link} delegate="queercal_ticket_warning" %}

                <form id="ticket_disclaimer" method="post" action="postback">
                    <label class="c-custom-checkbox">
                        <input type="checkbox" id="is_hide_disclaimer" name="is_hide_disclaimer">
                        {_ Hide this disclaimer for a while _}
                    </label>

                    <button class="c-btn c-btn-tickets -icon-external">
                        {_ Proceed to external ticket sale _}
                    </button>
                </form>
            {% endwith %}
        </div>
    </dialog>
{% endif %}