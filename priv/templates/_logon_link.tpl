{% if not m.acl.user %}
    <div class="z-logon-box__new-account">
        <h2 class="z-logon-title">{_ Create an account _}</h2>

        <p>{_ To keep the calendar spam-free and trustworthy, we ask you to create an account before adding events. All we need is your email and a password. Your data stays on European servers and is never shared or sold. _}</p>

        <a href="{% url signup p=page %}" id="go_to_signup" class="c-btn c-btn-secondary">{_ Create a new account _}</a>
    </div>
{% endif %}
