{% with ["--flagRed", "--flagPink", "--flagLightBlue", "--flagBrown", "--flagBlack", "--flagOrange", "--flagYellow", "--flagGreen", "--flagBlue", "--flagPurple"] as colors %}
{% with colors|random as theme %}
<!DOCTYPE html>
<html lang="{{ z_language|default:"en"|escape }}" class="environment-{{ m.site.environment }}">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>{#
		#}{% block title %}{#
			#}{% if id and id.name != 'page_home' %}{{ id.title }} | {% endif %}{{ m.site.title }}{#
		#}{% endblock %}{#
	#}</title>
	
    <!--
		Website design & development by:
		Dorien 🖖🌈
		<https://www.doriendrees.nl>

		Proudly powered by: Zotonic, the Erlang CMS 
		<https://www.zotonic.com>
	-->

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="author" content="{{ m.site.title }}" />
	<meta name="view-transition" content="same-origin" />

	<link rel="icon" type="image/png" href="/lib/images/favicon-96x96.png" sizes="96x96" />
	<link rel="icon" type="image/svg+xml" href="/lib/images/favicon.svg" />
	<link rel="shortcut icon" href="/lib/images/favicon.ico" />
	<link rel="apple-touch-icon" sizes="180x180" href="/lib/images/apple-touch-icon.png" />
	<meta name="apple-mobile-web-app-title" content="Queer Cal" />
	<link rel="manifest" href="/lib/images/site.webmanifest" />
	
	<meta name="theme-color" content="
		{% if theme == "--flagRed" %}
			#FF575B
		{% elseif theme == "--flagPink" %}
			#CF54A6
		{% elseif theme == "--flagLightBlue" %}
			#018CD3
		{% elseif theme == "--flagBrown" %}
			#5B3A1B
		{% elseif theme == "--flagBlack" %}
			#000000
		{% elseif theme == "--flagOrange" %}
			#FF4E09
		{% elseif theme == "--flagYellow" %}
			#BF870B
		{% elseif theme == "--flagGreen" %}
			#419711
		{% elseif theme == "--flagBlue" %}
			#018CD3
		{% elseif theme == "--flagPurple" %}
			#884BED
		{% endif %}
	">

	{% all include "_html_head.tpl" %}

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">

	{% block css %}
		{% lib
			"css/style.css"
			minify
		%}
	{% endblock %}

	{% block html_head_extra %}{% endblock %}
</head>
<body class="{% block body_class %}page-{{ id.name }}{% endblock %} {% for cat in id.is_a %}cat-{{ cat }} {% endfor %} color{{ theme }}" style="--theme: var({{ theme }}) " {% block body_attrs %}{% endblock %} data-cotonic-pathname-search="{% cotonic_pathname_search %}">
	<div id="top"></div>
	{% block skip_link %}
		<a href="#main-content" class="sr-only sr-only-focusable skip-link">Skip to main content</a>
	{% endblock %}

	{% block nav %}
        {% include 'nav/nav.tpl' %}
    {% endblock %}

    <main id="main-content">
	    {% block content_area %}
			{% block content %}
		        (This is <code>block main</code>)
		    {% endblock %}	    
	    {% endblock %}
    </main>

    {% block footer %}
        {% include 'footer/footer.tpl' %}
    {% endblock %}

    {% block admin_edit %}
    	{% if m.acl.is_allowed.use.mod_admin or m.acl.is_allowed.insert.event %}
	    	<div class="c-btns-admin">
		        {% if m.acl.is_allowed.insert.event %}
		            <a href="{% url new_event %}" class="c-btn-add-event -bg{{ theme }}">{% include "icons/icon-plus.tpl" color="#242424" %} {_ Add Event _}</a>
		        {% endif %}

		        {% if m.acl.is_allowed.use.mod_admin %}
		            {% if id %}
		                <a href="{% url admin_edit_rsc id=id %}" class="c-btn-admin-edit">{_ Admin edit _}</a>
		            {% else %}
		                <a href="{% url admin %}" class="c-btn-admin-edit">{_ Admin _}</a>
		            {% endif %}
		        {% endif %}
		    </div>
		{% endif %}
    {% endblock %}

    {% include "_js_include.tpl" %}

	{% all include "_html_body.tpl" %}

	{% block _js_include_extra %}{% endblock %}

	{% script %}
</body>
</html>
{% endwith %}
{% endwith %}
