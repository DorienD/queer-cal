{% include "_js_include_jquery.tpl" %}

{% lib
    "cotonic/cotonic.js"
    "js/apps/zotonic-wired.js"
    "js/apps/z.widgetmanager.js"
    "bootstrap/js/bootstrap.min.js"
    "js/modules/z.live.js"
    "js/modules/z.notice.js"
    "js/modules/z.tooltip.js"
    "js/modules/z.dialog.js"
    "js/modules/livevalidation-1.3.js"
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