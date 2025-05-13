<footer class="c-footer">
    <form id="appearance" class="c-footer__mode">
        {_ Appearance: _}
        <label hidden for="light"><input type="radio" value="light" name="color-scheme" id="light">light</label>
        <label hidden for="dark"><input type="radio" value="dark" name="color-scheme" id="dark">dark</label>
        <label hidden for="system"><input type="radio" value="system" name="color-scheme" id="system">system</label>
    </form>
    <a href="#top" class="c-btn-top"><span>{_ Back to top _}</span></a>
</footer>

{% javascript %}
    setLocalStorage();

    document.getElementById("appearance").addEventListener('change', function(){
        setLocalStorage();
    });

    function setLocalStorage(){
        if(localStorage.getItem("appearance")) {
            document.getElementById(localStorage.getItem("appearance")).checked;
        } else {
            localStorage.setItem("appearance", "system");
        }

        if(document.querySelector('input[name="color-scheme"]:checked')) {
            localStorage.setItem("appearance", document.querySelector('input[name="color-scheme"]:checked').value);
        }

        document.getElementById(localStorage.getItem("appearance")).checked = true;
    } 
{% endjavascript %}