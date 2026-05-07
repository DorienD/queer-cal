{% extends "page.tpl" %}

{% block between_body %}
    <div class="c-support">
        <article class="c-card-support">
            <div class="c-card-support__amount">
              € 5 - €... <small>{_ one-time _}</small>
            </div>

            <p>{_ A one-time contribution. Every euro helps keep the calendar running _}</p>

            <a href="https://donate.stripe.com/eVq28k3gl4rofcsgkQdfG00" class="c-btn c-btn-primary -icon-external c-cover-link">{_ Support once _}</a>
        </article>

        <article class="c-card-support -monthly">
            <div class="c-card-support__amount">
              € 3,50 <small>/ {_ month _}</small>
            </div>

            <p>{_ Become a recurring supporter and help the calendar grow every month _}</p>

            <a href="https://buy.stripe.com/14A7sE7wB0b8aWcd8EdfG01" class="c-btn c-btn-primary -icon-external c-cover-link">{_ Support monthly _}</a>
        </article>
    </div>
{% endblock %}