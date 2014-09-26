{% set version = salt['pillar.get']('salt.master:lookup:version', 'stable') %}

{% if not version == 'stable' %}
include:
  - salt.bootstrap
{% endif %}

salt-master:
{% if version == 'stable' %}
  pkg.latest
{% else %}
  cmd.run:
    - name: /tmp/install_salt.sh -M -N -n git {{version}}
{% if not version == 'develop' %}
    - unless: salt-master --version | awk '{print $2}' | grep {{version[1:]}}
{% endif %}
{% endif %}
