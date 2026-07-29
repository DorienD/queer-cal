<ol class="c-list">
    {% for r in result %}
        <li{% if r.is_featured %} class="-featured"{% endif %}>
            {% catinclude "cards/card.tpl" r %}
        </li>
    {% endfor %}
</ol>