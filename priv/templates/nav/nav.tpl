<nav id="main-nav" class="c-side-nav">
    <a href="{% url home %}" class="c-side-nav__logo">
        {% if id.name == "page_home" %}
            <h1>{{ m.site.title }}</h1>
        {% else %}
            <span>{{ m.site.title }}</span>
        {% endif %}
    </a>

    <button id="main-nav-toggle" class="c-nav__toggle"><span class="visually-hidden">Toon/verberg menu</span><i></i></button>
    
    <div class="c-side-nav__menu">
        {% menu class="c-main-nav__list" %}
    </div>
</nav>