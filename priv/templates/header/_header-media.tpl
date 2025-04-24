{% if dep|default:id.o.hasheader.id as dep %}
    <div class="c-header__media{% if dep.is_a.video %} -video{% endif %}">
        {% if dep.is_a.video %}
            {% include "header/_header-video.tpl" %}
            {% image dep mediaclass='page-header' crop crop_center=dep.crop_center %}
        {% else %}
            {% image dep mediaclass='page-header' crop crop_center=dep.crop_center %}
        {% endif %}
    </div>
{% endif %}