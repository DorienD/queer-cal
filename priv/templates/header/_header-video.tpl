<div class="bg-video">
    {% if dep.medium.video_embed_service == "youtube" %}
        <iframe class="bg-video__iframe" src="https://www.youtube.com/embed/{{ dep.medium.video_embed_id }}?controls=0&showinfo=0&rel=0&autoplay=1&loop=1&mute=1&playlist={{ dep.medium.video_embed_id }}" allow="autoplay, allow-presentation" allowfullscreen title="{{ dep.title }}"></iframe>
    {% elseif dep.medium.video_embed_service == "vimeo" %}
        <iframe class="bg-video__iframe" src="https://player.vimeo.com/video/{{ dep.medium.video_embed_id }}?autoplay=1&loop=1&autopause=0&muted=1" width="640" height="360" allow="autoplay; fullscreen, allow-presentation" allowfullscreen title="{{ dep.title }}"></iframe>
    {% else %}
        {% cache 3600 now %}
            <video poster="{% image_url dep mediaclass="page-header" %}" playsinline autoplay loop muted>
                <source src="/media/inline/{{ dep.medium.filename }}" type="video/mp4">
            </video>
        {% endcache %}
    {% endif %}
</div>
