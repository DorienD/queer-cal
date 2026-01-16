<table>
    <thead>
        <th>Date</th>
        <th>Time</th>
        <th>Event</th>
        <th>Genre tags</th>
        <th>Venue</th>
    </thead>
    <tbody>
        {% with m.search[{query 
            query_id=id 
            qargs
            id_exclude=m.rsc.administrator.id 
            cat_exclude='meta' 
            cat_exclude='categorization' 
            pagelen=100
            is_findable 
            is_published
            asort='-rsc.is_featured' }] as result %}
        {% for r in result %}
            <tr>
                <td>{{ r.date_start|date:"Y-m-d" }}</td>
                <td>{{ r.date_start|date:"H:i" }}</td>
                <td>{{ r.title }}</td>
                <td>[{% for keyword in r.o.subject %}"{{ keyword.title }}"{%if not forloop.last %}, {% endif %}{% endfor %}]</td>
                <td>
                    {{ r.o.haslocation.title|default:r.address_title }}
                </td>
            </tr>
        {% endfor %}
     {% endwith %}
    </tbody>
</table>