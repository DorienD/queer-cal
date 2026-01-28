<div class="c-filters">
    {% if result %}
        <p class="c-filters__months">
            Go to: 
            
            {% for r in result %}
                {% if result[forloop.counter -1].id.date_start|date:"m" != r.date_start|date:"m" %}
                    <a href="#{{ r.date_start|date:"F"|slugify }}">{{ r.date_start|date:"F" }}</a>
                {% endif %}
            {% endfor %}
        </p>
    {% endif %}

    <form action="/" id="j-filters" class="c-filters__options">
        {% if q.qhasobject or q.qongoing_date %}
            <label for="j-filter-keyword">{_ You've filtered on _}</label>
        {% else %}
            <label for="j-filter-keyword" class="sr-only">{_ Filter _}</label>
        {% endif %}

        <div class="c-filters__date">
            <label for="j-filter-date">{_ Date _}</label>
            
            <input type="date" id="j-filter-date" name="qongoing_date" min="{{ now|date:"Y-m-d" }}" value="{{ q.qongoing_date }}">
        </div>
        
        <div class="c-filters__keywords">
            <label for="j-filter-keyword">{_ Keyword _}</label>
            <div class="c-custom-select">
                <select id="j-filter-keyword" name="qhasobject">
                    {% if q.qhasobject %}
                        <option value=" ">{_ Remove filter _}</option>
                    {% else %}
                        <option value=" ">{_ Filter on a keyword _}</option>
                    {% endif %}

                    {% for r in m.search.query::%{
                        cat: "keyword",
                        is_findable: true,
                        pagelen: 200}|sort:['title', 'asc']
                    %}
                        <option value="{{ r.id }}" {% if q.qhasobject == r.id %}selected{% endif  %}>{{ r.title }}</option>
                    {% endfor %}
                </select>
            </div>
        </div>
        
        <button type="submit" id="j-filter-submit" class="c-btn c-btn-filter-submit">{_ Apply filter _}</button>
        
        {% if q.qhasobject or q.qongoing_date %}
            <a href="{% url home %}" class="c-filters__remove c-btn-square">{% include "icons/icon-plus.tpl" color="var(--typographyColor)" %}<span>{_ reset _}</span></a>
        {% endif %}
    </form>
</div>