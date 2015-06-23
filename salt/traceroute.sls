traceroute:
{% if grains["os_family"] != "MacOS" %}
  pkg.installed
{% else %}
  pkg.installed:
    - unless: "true"
{% endif %}
