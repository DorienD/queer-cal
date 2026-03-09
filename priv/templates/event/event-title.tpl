{% if id.website %}
    <a href="{{ id.website }}" target="_blank" rel="noopener">
{% endif %}
    {{ id.title }}
{% if id.website %}
    </a>
{% endif %}