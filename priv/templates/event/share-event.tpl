<button popovertarget="share-cal-{{ id.id }}" popovertargetaction="toggle" class="c-share-event-toggle">
    {% include "icons/icon-bookmark.tpl" %} {_ Add to calendar _}
</button>

<div id="share-cal-{{ id.id }}" popover class="c-share-event">
    <ul class="c-share-event__content">
        <li><a href="http://www.google.com/calendar/render?action=TEMPLATE&text={{ id.title|replace:[" ", "+"] }}&dates={{ id.date_start|date:"Ymd" }}T{{ id.date_start|date:"Hi" }}00/{{ id.date_end|date:"Ymd" }}T{{ id.date_end|date:"Hi" }}00&details={{id|summary|replace:[" ", "+"]}}&location={% if id.address_title %}{{ id.address_title|replace:[" ", "+"] }}{% if id.address_street_1 or id.address_city %},&nbsp;{% endif %}{% endif %}{% if id.address_street_1 %}{{ id.address_street_1|replace:[" ", "+"] }}{% if id.address_city %},&nbsp;{% endif %}{% endif %}{% if id.address_city %}{{ id.address_city|replace:[" ", "+"] }}{% endif %}&trp=false&sprop=&sprop=name:" target="_blank" rel="noopener" class="c-btn-share-event" title="{_ Add to Google calendar _}">{% include "icons/icon-google.tpl" color="var(--typographyColor)" %} {_ Add to Google calendar _}</a></li>

        <li><a href="https://outlook.office.com/calendar/0/deeplink/compose?body={{ id|summary|replace:[" ", "+"] }}&enddt={{ id.date_end|date:"Y-m-d" }}T{{ id.date_end|date:"H:i" }}&location={% if id.address_title %}{{ id.address_title|replace:[" ", "+"] }}{% if id.address_street_1 or id.address_city %},&nbsp;{% endif %}{% endif %}{% if id.address_street_1 %}{{ id.address_street_1|replace:[" ", "+"] }}{% if id.address_city %},&nbsp;{% endif %}{% endif %}{% if id.address_city %}{{ id.address_city|replace:[" ", "+"] }}{% endif %}&path=/calendar/action/compose&rru=addevent&startdt={{ id.date_start|date:"Y-m-d" }}T{{ id.date_start|date:"H:i" }}&subject={{ id.title|replace:[" ", "+"] }}" target="_blank" rel="noopener" class="c-btn-share-event" title="{_ Add to Microsoft agenda _}">{% include "icons/icon-microsoft.tpl" color="var(--typographyColor)" %}{_ Add to Microsoft agenda _}</a></li>

        <li><a href="{% url export_rsc id=id type="ics" %}" class="c-btn-share-event" title="{_ Add to iCalendar _}">{% include "icons/icon-apple.tpl" color="var(--typographyColor)" %}{_ Add to iCalendar _}</a></li>
    </ul>
</div>

