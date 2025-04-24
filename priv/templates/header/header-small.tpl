<header class="c-header -small {{ extraClasses }} {% block header_class %}{% endblock %}">
    {% block header_media %}
        {% if id.o.hasheader.id as header %}
            {% include "header/_header-media.tpl" %}
        {% else %}
            <div class="o-main-container">
                <h1>
                    {% if id.website %}
                        <a href="{{ id.website }}" target="_blank" rel="noopener">{{ id.title }} {% include "icons/icon-arrow-right.tpl" color="#000000" %}</a>
                    {% else %}
                        {{ id.title }}
                    {% endif %}
                </h1>
            </div>
        {% endif %}
    {% endblock %}
</header>