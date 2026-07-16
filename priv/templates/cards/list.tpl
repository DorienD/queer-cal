<ol class="c-list">
    {% for r in result %}
        <li{% if r.is_featured %} class="-featured"{% endif %}>
            {% catinclude "cards/card.tpl" r %}
        </li>
    {% empty %}
        {% if id.is_a.person %}
            <a href="{% url new_event %}" class="c-btn">{_ Publish your first event _}</a>
        {% endif %}
    {% endfor %}
</ol>