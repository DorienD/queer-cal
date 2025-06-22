<article class="c-calendar-item">
    <h3><a href="{{ id.page_url }}">{{ id.title }}</a></h3>
    
    {% include "event/event-location.tpl" id=r %}
    {% include "event/event-keywords.tpl" id=r %}
</article>