{% extends "page.tpl" %}

{% block body_class %}t-project{% endblock %}

{% block below_body %}
    {% if id.o.depiction|length > 0 %}
        <section id="gallery" class="c-block c-block-gallery">
            {% include "cards/list.tpl" 
                result=id.o.depiction 
                card_template="cards/card.tpl" 
                list_class="c-masonry-list" %}
        </section>
    {% endif %}
{% endblock %}
