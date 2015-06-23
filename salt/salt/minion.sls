{% set version = salt['pillar.get']('salt.minion:lookup:version', 'stable') %}
{% set master = salt['pillar.get']('salt.minion:lookup:master', 'localhost') %}

{% if not version == 'stable' %}
include:
  - salt.bootstrap
{% endif %}

salt-minion:
{% if version == 'stable' %}
  pkg.installed
{% else %}
  cmd.run:
    - name: /tmp/install_salt.sh -A localhost -n git {{version}}
# If we are installing a specific version, we can add an unless
{% if version[0] == 'v' %}
    - unless: salt-minion --version | awk '{print $2}' | grep {{version[1:]}}
{% endif %}
{% endif %}
