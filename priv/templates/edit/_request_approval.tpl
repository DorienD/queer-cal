{% if not id.is_published %}
    <div class="widget c-widget-approval">
        <div class="widget-content">
            <h4>{_ Request for publication _}</h4>
            
            {% if not id.is_request_publication %}
                <p>{% trans 'We will review your {cat} and publish or contact you if needed.' cat=m.rsc.event.title|lower %}</p>

                {% button class="c-btn c-btn-primary" text=_"Request publication"
                    action={script script="$('#save_stay').click();"}
                    action={confirm
                            text=_"Are you sure you want to send it in for publication?"
                            ok=_"Send in for publication"
                            postback={request_publication rsc_id=id}
                            delegate=`queercal`
                        }
                %}
            {% else %}
                {_ Your request is pending _}
            {% endif %}
        </div>
        <br>
    </div>
{% else %}
    {% include "edit/_publication.tpl" %}
{% endif %}