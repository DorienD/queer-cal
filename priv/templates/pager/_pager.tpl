<ul class="c-pagination">
    <li {% if not prev_url %}class="disabled"{% endif %}><a href="{{ prev_url }}"><span class="sr-only">{_ Previous page _}</span></a></li>
    {% for nr, url in pages %}
        {% if nr %}
            <li {% if nr == page %}class="active"{% endif %}><a href="{{ url }}">{{ nr }}</a></li>
        {% else %}
            <li><a href="{{ url }}">…</a></li>
        {% endif %}
    {% endfor %}
    <li {% if not next_url %}class="disabled"{% endif %}><a href="{{ next_url }}"><span class="sr-only">{_ Next page _}</span></a></li>
</ul>
