{% with id.o.haslocation as location %}
<button popovertarget="share-cal-{{ id.id }}" popovertargetaction="toggle" class="c-share-event-toggle">
    {% include "icons/icon-bookmark.tpl" %} {_ Add to calendar _}
</button>

<div id="share-cal-{{ id.id }}" popover class="c-share-event">
    <ul class="c-share-event__content">
        <li><a href="http://www.google.com/calendar/render?action=TEMPLATE&text={{ id.title|replace:[" ", "+"] }}&dates={% if id.date_is_all_day %}{{ id.date_start|date:"Ymd" }}/{{ id.date_end|date:"Ymd" }}{% else %}{{ id.date_start|date:"Ymd" }}T{{ id.date_start|date:"Hi" }}/{{ id.date_end|date:"Ymd" }}T{{ id.date_end|date:"Hi" }}{% endif %}&details={{id|summary|replace:[" ", "+"]|striptags}}{% if id.website %}+-+{_ More info_}:+{{ id.website }}{% endif %}+-+Added+by+Queer+Calendar:+{{ id.page_url_abs }}&location={% if location.title|default:id.address_title as loc_title %}{{ loc_title|replace:[" ", "+"] }}{% if location.address_street_1|default:id.address_street_1 or location.address_city|default:id.address_city %},{% endif %}{% endif %}{% if location.address_street_1|default:id.address_street_1 %}{{ location.address_street_1|default:id.address_street_1|replace:[" ", "+"] }}{% if location.address_city|default:id.address_city %},{% endif %}{% endif %}{% if location.address_city|default:id.address_city %}{{ location.address_city|default:id.address_city|replace:[" ", "+"] }}{% endif %}&trp=false&sprop=&sprop=name:" target="_blank" rel="noopener" class="c-btn-share-event" title="{_ Add to Google calendar _}">{% include "icons/icon-google.tpl" color="var(--typographyColor)" %} {_ Add to Google calendar _}</a></li>
        <li><a href="https://outlook.office.com/calendar/0/deeplink/compose?body={{ id|summary|replace:[" ", "+"]|striptags }}{% if id.website %}+-+{_ More info_}:+{{ id.website }}{% endif %}+-+Added+by+Queer+Calendar:+{{ id.page_url_abs }}&enddt={% if id.date_is_all_day %}{{ id.date_end|date:"Y-m-d" }}{% else %}{{ id.date_end|date:"Y-m-d" }}T{{ id.date_end|date:"H:i" }}{% endif %}&location={% if location.title|default:id.address_title as loc_title %}{{ loc_title|replace:[" ", "+"] }}{% if location.address_street_1|default:id.address_street_1 or location.address_city|default:id.address_city %},{% endif %}{% endif %}{% if location.address_street_1|default:id.address_street_1 %}{{ location.address_street_1|default:id.address_street_1|replace:[" ", "+"] }}{% if location.address_city|default:id.address_city %},{% endif %}{% endif %}{% if location.address_city|default:id.address_city %}{{ location.address_city|default:id.address_city|replace:[" ", "+"] }}{% endif %}&path=/calendar/action/compose&rru=addevent&startdt={% if id.date_is_all_day %}{{ id.date_start|date:"Y-m-d" }}{% else %}{{ id.date_start|date:"Y-m-d" }}T{{ id.date_start|date:"H:i" }}{% endif %}&subject={{ id.title|replace:[" ", "+"] }}" target="_blank" rel="noopener" class="c-btn-share-event" title="{_ Add to Microsoft agenda _}">{% include "icons/icon-microsoft.tpl" color="var(--typographyColor)" %}{_ Add to Microsoft agenda _}</a></li>

        <li><a href="{% url export_rsc id=id type="ics" %}" class="c-btn-share-event" title="{_ Add to iCalendar _}">{% include "icons/icon-apple.tpl" color="var(--typographyColor)" %}{_ Add to iCalendar _}</a></li>

        <li class="c-share-event__divider">
            <a href="{{ id.page_url }}"
                class="c-btn-share-event js-share"
                data-title="{{ id.title }}"
                data-url="{{ id.page_url }}">
                {% include "icons/icon-paper-plane.tpl" color="var(--typographyColor)" %} {_ Share this event _}
            </a>
        </li>
    </ul>
</div>
{% endwith %}
