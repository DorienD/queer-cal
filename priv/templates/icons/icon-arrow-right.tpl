{% with color|default:"#ffffff" as color %}
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 448 438" {% if width %}width="{{ width }}"{% endif %}{% if height %}height="{{ height }}"{% endif %} class="i-arrow-right">
  <path fill="{{ color }}" d="m190.45 29.9 22.2-22.2c9.4-9.4 24.6-9.4 33.9 0L440.95 202c9.4 9.4 9.4 24.6 0 33.9l-194.4 194.4c-9.4 9.4-24.6 9.4-33.9 0l-22.2-22.2c-9.5-9.5-9.3-25 .4-34.3L311.35 259H23.95c-13.3 0-24-10.7-24-24v-32c0-13.3 10.7-24 24-24h287.4L190.85 64.2c-9.8-9.3-10-24.8-.4-34.3Z"/>
</svg>
{% endwith %}
