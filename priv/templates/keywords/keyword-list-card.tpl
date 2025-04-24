{% if id.o.subject or id.ticket_link %}    
    <ul class="c-keyword-list">
        {% for r in id.o.subject %}
            <li><span class="c-btn-keyword">{{ r.title }}</span></li> 
        {% endfor %}
        {% if id.ticket_link %}
            <li><span class="c-btn-keyword -tickets">{_ Tickets _}</span></li>
        {% endif %}
    </ul>
{% endif %}