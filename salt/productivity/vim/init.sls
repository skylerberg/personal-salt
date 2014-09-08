{% from "productivity/vim/map.jinja" import vim with context %}

{{ vim['name'] }}:
  {% if 'conflict' in vim %}
  pkg.installed:
    - require:
      - pkg: {{ vim['conflict'] }}
  {% else %}
  pkg.installed
  {% endif %}

{% if 'conflict' in vim %}
{{ vim['conflict'] }}:
  pkg.removed
{% endif %}
