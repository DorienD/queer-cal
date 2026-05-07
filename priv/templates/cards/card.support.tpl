<article class="c-calendar-item -support -{{ support_type }}">
    {% if support_type == "monthly" %}
        <a href="https://buy.stripe.com/14A7sE7wB0b8aWcd8EdfG01" class="c-btn c-btn-primary -icon-external c-btn-support" style="margin-top:10px;">
            {_ Support monthly _}
        </a>
    {% else %}
        <a href="{{ m.rsc.page_support.page_url }}" class="c-btn c-btn-primary c-btn-support">
            {_ Support Queer Calendar _}
        </a>
    {% endif %}
</article>