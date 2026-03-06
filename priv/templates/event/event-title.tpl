{% if id.website and id.website|sanitize_url != "#script-removed" %}
    <a href="{{ id.website }}" target="_blank" rel="noopener">
{% endif %}
    {{ id.title }}
{% if id.website and id.website|sanitize_url != "#script-removed" %}
    </a>
{% endif %}