<nav id="main-nav" class="c-main-nav" aria-label="{_ Main _}">
    {% if id.name != "page_home" %}
        <a href="{% url home %}" class="c-main-nav__logo">
            <span>{{ m.site.title }}</span>
        </a>
    {% endif %}
    
    {% menu id=id class="c-main-nav__menu" %}

    {% include "nav/_language-switch.tpl" class="c-main-nav__lang" %}

    {% if m.acl.user as user %}
        <a href="{{ m.acl.user.page_url }}" class="c-main-nav__user">
            <span class="c-main-nav__user__icon">{{ user.name_first|truncate:1:"" }}</span> <span>{_ Profile _}</span>
        </a>
    {% endif %}
</nav>