{% if id.website %}
    <a href="{{ id.website|sanitize_url }}" target="_blank" rel="noopener">
{% endif %}
    {{ id.title }}
{% if id.website %}
    </a>
{% endif %}
