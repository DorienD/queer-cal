{% if id.is_visible %}
{% with id.o.hasheader.id|default:id.depiction.id as dep %}
    <a href="{% image_url dep width="1800" %}" class="c-card  -{{ id.category.name }} {% if not id.is_published %}-not-published{% endif %}" data-fancybox="gallery" data-caption="{{ dep.summary }}">
        {% if dep %}
            <div class="c-card__image -masonry{% if not dep %} -fallback{% endif %}">
                {% image dep width="600" %}
            </div>
        {% endif %}
    </a>
{% endwith %}
{% endif %}