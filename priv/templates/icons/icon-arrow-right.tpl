{% with color|default:"#ffffff" as color %}
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 512 512" {% if width %} width="{{ width }}"{% endif %}{% if height %} height="{{ height }}"{% endif %} fill="{{ color }}">
  <path d="M502.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-128-128c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l73.4 73.4H32c-17.7 0-32 14.3-32 32s14.3 32 32 32h370.7l-73.4 73.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l128-128v-.1Z"/>
</svg>
{% endwith %}