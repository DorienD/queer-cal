<nav id="main-nav" class="c-main-nav" aria-label="{_ Main _}">
    <a href="{% url home %}" class="c-main-nav__logo">
        <span>{{ m.site.title }}</span>
    </a>

    <button type="button" class="c-main-nav__toggle" aria-expanded="false" aria-controls="main-nav-panel" hidden>
        <span class="c-main-nav__toggle__icon" aria-hidden="true"></span>
        <span class="c-main-nav__toggle__label">{_ Menu _}</span>
    </button>

    <div id="main-nav-panel" class="c-main-nav__panel">
        {% menu id=id class="c-main-nav__menu" %}

        {% include "nav/_language-switch.tpl" class="c-main-nav__lang" %}

        <ul class="c-main-nav__user-nav">
            {% if m.acl.user as user %}
                <li>
                    <a href="{{ m.acl.user.page_url }}" class="c-main-nav__user">
                        <span class="c-main-nav__user__icon">{{ user.name_first|default:"P"|truncate:1:"" }}</span> <span>{_ Profile _}</span>
                    </a>
                </li>
                <li>
                    <a href="{% url logoff %}">{_ Log out _}</a>
                </li>
            {% else %}
                <li><a href="{% url logon %}" class="c-main-nav__logon">{_ Login _}</a></li>
            {% endif %}
        </ul>
    </div>
    
</nav>