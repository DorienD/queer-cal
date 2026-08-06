{% if not m.acl.user %}
    <div class="z-logon-box__new-account">
        <h3 class="z-logon-title">{_ No account yet? _}</h3>
        <a href="{% url signup p=page %}" id="go_to_signup" class="c-btn c-btn-secondary">{_ Create a new account _}</a>
    </div>
{% endif %}
