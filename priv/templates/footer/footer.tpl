<footer class="c-footer">
    <div class="o-main-container c-footer__grid">
        <div class="c-footer__column c-footer__logo">
            <img src="/lib/images/logo.svg" alt="{{ m.site.title }}" width="100" height="100">
        </div>

        <div class="c-footer__text">
            <h3>{{ m.site.title }}</h3>
            {{ m.rsc.footer_menu.body }}
        </div>

        <ul class="c-footer__socials">
            <li>
                <a href="https://www.linkedin.com/company/queer-amsterdam/" target="_blank" class="c-footer__socials__linkedin">{% include "icons/icon-linkedin.tpl" color="#000" %}<span class="sr-only">Visit our Linkedin</span></a>
            </li>
            <li>
                <a href="https://www.instagram.com/queer_amsterdam/" target="_blank" class="c-footer__socials__instagram">{% include "icons/icon-instagram.tpl" color="#000" %}<span class="sr-only">Check our Instagram</span></a>
            </li>
            <li>
                <a href="https://www.facebook.com/profile.php?id=100093428294079" target="_blank" class="c-footer__socials__facebook">{% include "icons/icon-facebook.tpl" color="#000" %}<span class="sr-only">Check our Facebook</span></a>
            </li>
        </ul>
        
        <form class="c-footer__newsletter" method="POST" action="https://dbe7f4a1.sibforms.com/serve/MUIFABh2FZUsSqordnM14twNdIhdYTF8-6q-gFr4DkWRdx3xSkjvlJ4_8y7UTyvMnwOtEEueIOqigi9skGW2uMOavaUAOCwOFYkPm0P-Y2vxTZuNz7xuCKbHLWmeWpWCRWAggEQkpN0eDlNDICCyGO6hL3KRyZnMEKO3pn-8lMQ-VYlS9ap_qmh02s2_pLr57SkJk_x5g8VwnREV">
            <label for="EMAIL">{_ Newsletter _}</label>
            
            <p>
                <input type="email" id="EMAIL" name="EMAIL" placeholder="{_ E-mail _}" required />
                
                <button class="c-btn" type="submit">{% include "icons/icon-paper-plane.tpl" color="#fff" %}<span class="sr-only">{_ Subscribe _}</span></button>
            </p>

            <input type="hidden" name="locale" value="{{ z_language }}">
            <input type="hidden" name="html_type" value="simple">
        </form>

        {% menu menu_id=m.rsc.footer_menu.id id=id id_prefix="footer-" context=context class="c-footer__nav c-footer__column" %}
    </div>
    <div class="c-footer__bottom">
        <div class="o-main-container">
            &copy; {{ now|date:"Y" }} - {{ m.site.title }}
        </div>
    </div>
</footer>