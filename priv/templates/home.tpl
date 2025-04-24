{% extends "base.tpl" %}

{% block body_class %}t-text{% endblock %}

{% block content %}
    <h1>{{ id.title }}</h1>
    
    {% if id.summary %}
        <p>{{ id.summary }}</p>
    {% endif %}


    {% with m.search.query::%{
        cat: "event"
        qargs: true
        is_findable: true
    }
    as result %}
    <ol class="c-calendar">
        {% for r in result %}
            {% if result[forloop.counter -1].id.date_start|date:"m" != r.date_start|date:"m" %}
                <li>
                    <h2 class="c-calendar__divider">{{ r.date_start|date:"F" }}</h2>
                </li>
            {% endif %}
            <li>
                <article class="c-calendar-item">
                    <h3>
                        {% if r.website or r.instagram or r.facebook %}
                            <a href="{{ r.website|default:r.instagram|default:r.facebook }}" target="_blank" rel="noopener">
                        {% endif %}
                            
                            {{ r.title }}
                        {% if r.website or r.instagram or r.facebook %}
                            </a>
                        {% endif %}
                    </h3>
                    
                    <time datetime="{{ r.date_start|date:"c":"UTC" }}">
                        {{ r.date_start|date:"d F Y H:i":"UTC" }} 
                        -
                        {% if
                            (((r.date_start|add_day)|date:"dm":"UTC" == r.date_end|date:"dm":"UTC") 
                                and r.date_end|date:"H" < 9)
                            or
                            r.date_end|date:"dm":"UTC" == r.date_start|date:"dm":"UTC" %}
                            {# If event ends before next day 9AM only show time #}
                            {# If same date only show the end time #}
                            {{ r.date_end|date:"H:i":"UTC" }}
                        {% else %}
                            {{ r.date_end|date:"d F Y H:i":"UTC" }}
                        {% endif %}                        
                    </time>

                    {% with r.o.haslocation as location %}
                        <address class="c-calendar-item__address">
                                {% if location.title|default:r.address_title as loc_title %}
                                    {{ loc_title }}{% if location.address_street_1|default:r.address_street_1 or location.address_city|default:r.address_city %}, {% endif %}
                                {% endif %}
                                {% if location.address_street_1|default:r.address_street_1 as loc_street %}
                                    {{ loc_street }}{% if location.address_city|default:r.address_city %}, {% endif %}
                                {% endif %}
                                {% if location.address_city|default:r.address_city as loc_city %}
                                    {{ loc_city }}
                                {% endif %}
                        </address>
                    {% endwith %}
                    
                    {% if r.o.subject or r.tickets %}
                        <ul class="c-keyword-list">
                            {% for k in r.o.subject %}
                                <li>{{ k.title }}</li>
                            {% endfor %}
                            
                            {% if r.tickets %}
                                <li><a href="{{ r.tickets }}">Tickets</a></li>
                            {% endif %}
                        </ul>
                    {% endif %}
                </article>
            </li>
        {% endfor %}
    </ol>
    {% endwith %}
{% endblock %}
