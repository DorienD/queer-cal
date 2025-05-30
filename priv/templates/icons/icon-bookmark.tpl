{% with color|default:"#000000" as color %}
{% with color2|default:"#ffffff" as color2 %}
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 384 512" class="icon-bookmark"{% if width %} width="{{ width }}"{% endif %}{% if height %} height="{{ height }}"{% endif %}>
  <path fill="#{{ color2 }}" class="icon-bookmark__fill" d="M47 35h301v429L194 344 47 464V35Z"/>
  <path fill="{{ color }}" class="icon-bookmark__stroke" d="M0 48C0 21.5 21.5 0 48 0v441.4l130.1-92.9c8.3-6 19.6-6 27.9 0l130 92.9V48H48V0h288c26.5 0 48 21.5 48 48v440c0 9-5 17.2-13 21.3-8 4.1-17.6 3.4-24.9-1.8L192 397.5l-154.1 110c-7.3 5.2-16.9 5.9-24.9 1.8C5 505.2 0 497 0 488V48Z"/>
</svg>
{% endwith %}
{% endwith %}