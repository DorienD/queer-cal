<div class="c-block c-block-text-media {% if blk.alignment %} -align-{{ blk.alignment }}{% endif %} -{{ blk.bg_color|default:"white" }}">
    <div class="o-grid o-main-container">
        {% if blk.rsc_id as dep %}
            <div class="c-block__media">
                {% if blk.rsc_auto_play %}
                    <div class="c-block__image-container">
                        {% include "blocks/_fancy_media.tpl" id=dep autoplay=blk.rsc_auto_play %}
                    </div>
                {% else %}
                    {% include "blocks/_fancy_media.tpl" id=dep %}
                {% endif %}
            </div>
        {% endif %}

        <div class="c-block__text body-text">
            {% if blk.title %}
                <h2 class="c-block-title">{{ blk.title }}</h2>
            {% endif %}

            <div class="body-text">{{ blk.body }}</div>

            {% if blk.rsc_link_id %}
                <a href="{{ blk.rsc_link_id.page_url }}" class="c-btn c-btn-primary">{{ blk.btn_text|default:_"Read more" }}</a>
            {% endif %}
        </div>
</div>
</div>