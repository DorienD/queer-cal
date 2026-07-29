<footer class="c-footer">
    <form id="appearance" class="c-footer__mode">
        {_ Appearance: _}
        <label for="light"><input type="radio" value="light" name="color-scheme" id="light">light</label>
        <label for="dark"><input type="radio" value="dark" name="color-scheme" id="dark">dark</label>
        <label for="system"><input type="radio" value="system" name="color-scheme" id="system">system</label>
    </form>
    <nav aria-label="{_ Footer navigation _}">
        <ul class="c-footer__nav">
            <li>
                <a href="{{ m.rsc.signup_tos.page_url }}">{{ m.rsc.signup_tos.short_title|default:m.rsc.signup_tos.title }}</a>
            </li>
            <li>
                <a href="{{ m.rsc.signup_privacy.page_url }}">{{ m.rsc.signup_privacy.short_title|default:m.rsc.signup_privacy.title }}</a>
            </li>
            <li>
                <a href="{{ m.rsc.page_faq.page_url }}">{{ m.rsc.page_faq.short_title|default:m.rsc.page_faq.title }}</a>
            </li>
            <li>
                <a href="{{ m.rsc.page_disclaimer.page_url }}">{{ m.rsc.page_disclaimer.title }}</a>
            </li>
            <li>
                <a href="https://github.com/DorienD/queer-cal" rel="noopener" class="c-footer__github">Github</a>
            </li>
            <li>
                <a href="#top" class="c-footer__top">{% include "icons/icon-caret-left.tpl" width="16" height="16" %} <span>{_ Back to top _}</span></a>
            </li>
        </ul>
    </nav>
</footer>