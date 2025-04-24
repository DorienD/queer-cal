<header class="c-header -{{ id.category.id.name }} {% block header_class %}{% endblock %}">
    {% block header_media %}
        {% include "header/_header-media.tpl" %}
    {% endblock %}

    {% block header_content %}{% endblock %}
</header>