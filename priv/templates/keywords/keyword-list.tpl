{% if id.o.subject %}
    <ul class="c-keyword-list">
        {% for r in id.o.subject %}
            <li><span class="c-btn-keyword">{{ r.title }}</span></li> 
        {% endfor %}
    </ul>
{% endif %}