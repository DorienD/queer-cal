{% with id.date_start, id.date_end as dtstart, dtend %}
{% if dtstart %}
BEGIN:VEVENT
CREATED:{{ id.created|date:"Ymd\\THis" }}
LAST-MODIFIED:{{ id.modified|date:"Ymd\\THis" }}
UID:{{ id.uri|escape_ical }}{% if id.date_is_all_day %}
DTSTART;VALUE=DATE:{{ dtstart|date:"Ymd" }}
DTEND;VALUE=DATE:{{ dtend|date:"Ymd" }}{% else %}
DTSTART:{{ dtstart|date:"Ymd\\THis" }}
DTEND:{{ dtend|date:"Ymd\\THis" }}{% endif %}
TRANSP:OPAQUE
SUMMARY:{{ id.title|unescape|escape_ical }}
DESCRIPTION:{{ id|summary|striptags|unescape|escape_ical }} \n\n Added by Queer Calendar: {{ id.page_url_abs }}
LOCATION:{% if id.address_title %}{{ id.address_title }}{% endif %}{% if id.address_title %}, {{ id.address_street_1 }}{% endif %}{% if id.address_postcode %}, {{ id.address_postcode }}{% endif %}{% if id.address_city %}, {{ id.address_city }}{% endif %}
URL;VALUE=URI:{{ id.website }}
SEQUENCE:0
END:VEVENT
{% endif %}
{% endwith %}
