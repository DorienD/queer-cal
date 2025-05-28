{% with id.o.haslocation as location %}
    <address class="c-calendar-item__address">
            {% if location.title|default:id.address_title as loc_title %}
                {% if location.website %}<a href="{{ location.website }}" rel="noopener">{% endif %}{{ loc_title }}{% if location.website %}</a>{% endif %}{% if location.address_street_1|default:id.address_street_1 or location.address_city|default:id.address_city %}, {% endif %}
            {% endif %}
            {% if location.address_street_1|default:id.address_street_1 as loc_street %}
                {{ loc_street }}{% if location.address_city|default:id.address_city %}, {% endif %}
            {% endif %}
            {% if location.address_city|default:id.address_city as loc_city %}
                {{ loc_city }}
            {% endif %}
    </address>
{% endwith %}