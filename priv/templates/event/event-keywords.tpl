{% if id.o.subject or id.tickets %}
    <ul class="c-keyword-list">
        {% for keyword in id.o.subject %}
            <li>{{ keyword.title }}</li>
        {% endfor %}

        {% if id.tickets %}
            <li><a href="{{ id.tickets }}">Tickets</a></li>
        {% endif %}
    </ul>
{% endif %}