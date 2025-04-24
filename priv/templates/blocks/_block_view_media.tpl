<div class="c-block c-block-media o-grid -grid-small-gap{% if blk.rsc_id and blk.rsc2_id %} o-min-container -double{% endif %}{% if blk.rsc_id and not blk.rsc2_id %} -{{ blk.height }}{% endif %}">
    {% if blk.rsc_id as dep %}
        <div class="c-block__media">
            {% if not blk.rsc2_id %}
                {% if blk.height == "height-100" %}
                    {% include "blocks/_fancy_media.tpl" id=dep crop full autoplay=blk.rsc_auto_play %}
                {% else %}
                    {% include "blocks/_fancy_media.tpl" id=dep crop large autoplay=blk.rsc_auto_play %}
                {% endif %}
            {% else %}
                {% include "blocks/_fancy_media.tpl" id=dep crop autoplay=blk.rsc_auto_play %}
            {% endif %}
        </div>
    {% endif %}
    {% if blk.rsc2_id as dep %}
        <div class="c-block__media">
            {% include "blocks/_fancy_media.tpl" id=dep crop autoplay=blk.rsc2_auto_play %}
        </div>
    {% endif %}
</div>