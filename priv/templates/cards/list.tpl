<ol class="c-list">
    {% for r in result %}
        <li>
            {% catinclude "cards/card.tpl" r %}
        </li>
    {% endfor %}
</ol>