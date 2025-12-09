document.addEventListener('DOMContentLoaded', function () {
    const toggleButtons = document.querySelectorAll('.c-calendar-item__dialog');
    const filterForm = document.getElementById('j-filters');

    toggleButtons.forEach(button => {
        button.addEventListener('click', () => {
            const dialogId = button.getAttribute('data-dialog');
            const dialog = document.getElementById(dialogId);

            if (dialog && typeof dialog.showModal === 'function') {
                dialog.showModal();

                // Close on outside click
                const closeOnOutsideClick = (event) => {
                    const content = dialog.querySelector('.c-calendar-item__details__content');
                    
                    if (!content.contains(event.target)) {
                        dialog.close();
                        dialog.removeEventListener('click', closeOnOutsideClick);
                    }
                };
          
                dialog.addEventListener('click', closeOnOutsideClick);

                // Close on close button click
                const closeButtons = dialog.querySelectorAll('.c-calendar-item__details-close');

                closeButtons.forEach(closeButton => {
                  closeButton.addEventListener('click', () => {
                    dialog.close();
                  }, { once: true }); // Add once per open
                });
            }
        });
    });

    // Filter calendar

    if(filterForm){
        filterForm.addEventListener('change', function (evt) {
            evt.preventDefault();

            const data = new FormData(this);
            const params = new URLSearchParams();

            for (const [key, value] of data) {
                if (value.trim() !== "") {
                    params.set(key, value);
                }
            }

            const newUrl = `${window.location.pathname}?${params.toString()}`;
            window.location.href = newUrl;
        });
    }

    // Back to top display logic

    const backToTop = document.querySelector('.c-footer__top');
    let lastScroll = 0;
    let ticking = false;
    const threshold = 10;

    function onScroll() {
        const currentScroll = window.pageYOffset;

        if (Math.abs(currentScroll - lastScroll) <= threshold) {
            ticking = false;
            return;
        }

        if (currentScroll > lastScroll) {
            // Scrolling down
            backToTop.classList.add('-hidden');
        } else {
            // Scrolling up
            backToTop.classList.remove('-hidden');
        }

        lastScroll = currentScroll;
        ticking = false;
    }

    window.addEventListener('scroll', () => {
        if (!ticking) {
            window.requestAnimationFrame(onScroll);
            ticking = true;
        }
    });

    // Share event

    document.querySelectorAll('.js-share').forEach(shareLink => {
        if (navigator.share) {
            shareLink.addEventListener('click', function (e) {
                e.preventDefault();

                const title = this.dataset.title || document.title;
                const url = this.dataset.url || this.href;

                navigator.share({ title, url }).catch(err => {
                    console.warn('Share failed:', err);
                    window.location.href = this.href; // fallback to email link
                });
          });
        }
    });
});

if (CSS.supports('color', 'light-dark(black, white)')){
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
}

