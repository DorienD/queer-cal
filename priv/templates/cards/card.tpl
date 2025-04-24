{% if id.is_visible %}
{% with id.o.hasheader.id|default:id.depiction.id as dep %}
    <div class="c-card -{{ id.category.name }} {% if not id.is_published %}-not-published{% endif %}">
        {% if dep %}
            <div class="c-card__image{% if not dep %} -fallback{% endif %}">
                {% image dep mediaclass="card-image" crop_center=dep.crop_center %}
            </div>
        {% endif %}

        <div class="c-card__content">
            {% block card_title %}
                <h2 class="title-card">
                    <a href="{{ id.page_url }}" class="c-btn-cover">
                        {{ id.title }}
                    </a>
                </h2>
            {% endblock %}
        </div>
    </div>
{% endwith %}
{% endif %}