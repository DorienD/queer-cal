{% if id.website or id.instagram or id.facebook %}
    <a href="{{ id.website|default:id.instagram|default:id.facebook }}" target="_blank" rel="noopener">
{% endif %}
    {{ id.title }}
{% if id.website or id.instagram or id.facebook %}
    </a>
{% endif %}