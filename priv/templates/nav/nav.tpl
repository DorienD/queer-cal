<nav id="main-nav" class="c-main-nav" aria-label="{_ Main _}">
    {% if id.name != "page_home" %}
        <a href="{% url home %}" class="c-main-nav__logo">
            <span>{{ m.site.title }}</span>
        </a>
    {% endif %}
    
    {% menu id=id class="c-main-nav__menu" %}

    {% include "nav/_language-switch.tpl" class="c-main-nav__lang" %}
</nav>