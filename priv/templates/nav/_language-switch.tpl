{% if m.translation.language_list_enabled as list %}
{% if list|length > 1 %}
    <ul class="{{ class }}">
        {% for code,lang in list %}
            <li>
                <a href="{{ id.page_url with z_language = code }}" {% if z_language == code %}class="is-active"{% endif %}>
                    {{ code }}
                </a>
            </li>
        {% endfor %}
    </ul>
{% endif %}
{% endif %}
