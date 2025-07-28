<footer class="c-footer">
    <form id="appearance" class="c-footer__mode">
        {_ Appearance: _}
        <label for="light"><input type="radio" value="light" name="color-scheme" id="light">light</label>
        <label for="dark"><input type="radio" value="dark" name="color-scheme" id="dark">dark</label>
        <label for="system"><input type="radio" value="system" name="color-scheme" id="system">system</label>
    </form>
    <a href="{{ m.rsc.page_disclaimer.page_url }}">{{ m.rsc.page_disclaimer.title }}</a>
    <a href="https://github.com/DorienD/queer-cal" class="c-footer__github">Github</a>
    <a href="#top" class="c-footer__top">{% include "icons/icon-caret-left.tpl" width="16" height="16" %} <span>{_ Back to top _}</span></a>
</footer>