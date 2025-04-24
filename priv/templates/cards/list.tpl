{% with card_template|default:"cards/card.tpl" as card_template %}
    {# <div class="c-masonry-list">
        <div class="gutter-sizer"></div>
        {% for r in result %}
            {% catinclude card_template r aspectRatio=aspectRatio %}
        {% empty %}
            {_ No results _}
        {% endfor %}
    </div> #}
    <div class="{{ list_class|default:"o-grid o-main-container" }} {{ extraClasses }}">
        {% if list_class == "c-masonry-list" %}
            <div class="gutter-sizer"></div>
        {% endif %}
        {% for r in result %}
            {% catinclude card_template r aspectRatio=aspectRatio %}
        {% endfor %}
    </div>
{% endwith %}