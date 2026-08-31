{% extends "page.tpl" %}

{% block body_class %}t-faq{% endblock %}

{% block base_add_event %}{% endblock %}

{% block between_body %}
    {% for faqs in id.o.haspart %}
        {% if faqs.is_a.collection %}
            <section class="c-faq-collection">
                <h2>{{ faqs.title }}</h2>

                {% for r in faqs.o.haspart %}
                    <details class="c-faq__question">
                        <summary>{{ r.title }}</summary>
                        {{ r.body }}
                    </details>
                {% endfor %}
            </section>
        {% else %}
            <details class="c-faq__question">
                <summary>{{ faqs.title }}</summary>
                {{ faqs.body }}
            </details>
        {% endif %}
    {% endfor %}
{% endblock %}
