<div class="c-block c-block-text o-main-container {% if blk.body and blk.body_right %}-double{% endif %}">
    {% if blk.title %}
        <h2>{{ blk.title }}</h2>
    {% endif %}
    <div class="o-grid">
        {% if blk.body %}
            <div class="c-block__column body-text">
                {{ blk.body }}
            </div>
        {% endif %}
        {% if blk.body_right %}
            <div class="c-block__column body-text">
                {{ blk.body_right }}
            </div>
        {% endif %}
    </div>
</div>