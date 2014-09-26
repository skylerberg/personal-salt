{% set version = salt['pillar.get']('salt.minion:lookup:version', 'stable') %}
{% set master = salt['pillar.get']('salt.minion:lookup:master', 'localhost') %}

{% if not version == 'stable' %}
include:
  - salt.bootstrap
{% endif %}

salt-minion:
{% if version == 'stable' %}
  pkg.latest
{% else %}
  cmd.run:
    - name: /tmp/install_salt.sh -A localhost -n git {{version}}
{% if not version == 'develop' %}
    - unless: salt-minion --version | awk '{print $2}' | grep {{version[1:]}}
{% endif %}
{% endif %}
