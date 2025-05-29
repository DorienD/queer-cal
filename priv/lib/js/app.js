document.addEventListener('DOMContentLoaded', function () {
    const toggleButtons = document.querySelectorAll('.c-calendar-item__details-toggle');
    const filterBox = document.getElementById('j-filter-keyword');

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
                const closeButton = dialog.querySelector('.c-calendar-item__details-close');
              
                if (closeButton) {
                    closeButton.addEventListener('click', () => {
                        dialog.close();
                    }, { once: true }); // Only add once per open
                }
            }
        });
    });

    if (filterBox) {
        filterBox.addEventListener('change', function () {
            const selectedValue = this.value;
            
            if (selectedValue) {
                window.location.href = "?qhasobject="+selectedValue;
            }
        });
    }
});

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