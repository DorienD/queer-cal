{% include "_js_include_jquery.tpl" %}

{% lib
    "cotonic/cotonic.js"
    "js/apps/zotonic-wired.js"
    "js/apps/z.widgetmanager.js"
    minify
%}

{% block _js_include_extra %}{% endblock %}

<script type="text/javascript" nonce="{{ m.req.csp_nonce }}">
    $(function()
    {
        $.widgetManager();
    });
</script>

{% worker name="auth" src="js/zotonic.auth.worker.js" args=%{  auth: m.authentication.status  } %}