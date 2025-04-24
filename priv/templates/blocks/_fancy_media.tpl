{% if dep.is_a.video %}
    <div class="c-block__image-container -video">
        {% if autoplay %}
            {% include "header/_header-video.tpl" %}
        {% else %}
            {% if dep.medium.video_embed_id %}
                {% media id crop crop_center=dep.crop_center %}
            {% else %}
                <div class="embed-responsive" style="padding-top: 56.25%">
                    {% media id crop crop_center=dep.crop_center %}
                </div>
            {% endif %}
        {% endif %}
    </div>
{% else %} 
    {% if crop %}
        {% if large %}
            {% media id mediaclass="body-media-large" crop_center=dep.crop_center %}
        {% elseif full %}
            {% media id mediaclass="media-block-full" crop_center=dep.crop_center %}
        {% else %}
            {% media id mediaclass="body-media-large" crop_center=dep.crop_center %} 
        {% endif %}
        <span class="sr-only">{_ Enlarge media _}</span>
    {% else %}
        {% if large %}
            {% media id mediaclass="body-media-large" %} <span class="sr-only">{_ Enlarge media _}</span>
        {% elseif full %}
            {% media id mediaclass="media-block-full" %}
        {% else %}
            {% media id mediaclass="body-media-large" %} <span class="sr-only">{_ Enlarge media _}</span>
        {% endif %}
    {% endif %}
{% endif %}