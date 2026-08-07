{% overrules %}

{% block body_class %}t-logon{% endblock %}

{% block admin_edit %}{% endblock %}

{% block content_area %}
    {% if q.zotonic_dispatch == 'logon' and m.acl.user %}
        {% javascript %}
            window.location.replace("{{ m.acl.user.page_url }}");
        {% endjavascript %}
        
        <noscript><p><a href="{{ m.acl.user.page_url }}">{_ Go to your profile _}</a></p></noscript>
    {% else %}
        {% include
            "_logon_config.tpl"
            logon_modal=0
        %}
    {% endif %}
{% endblock %}