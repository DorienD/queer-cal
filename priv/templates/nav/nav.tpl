<nav id="main-nav" class="c-main-nav">
    {% if id.name != "page_home" %}
        <a href="{% url home %}" class="c-main-nav__logo">
            <span>{{ m.site.title }}</span>
        </a>
    {% endif %}
    
    {% menu class="c-main-nav__menu" %}
</nav>