{% set version = salt['pillar.get']('salt.master:lookup:version', 'stable') %}

{% if not version == 'stable' %}
include:
  - salt.bootstrap
{% endif %}

salt-master:
{% if version == 'stable' %}
  pkg.installed
{% else %}
  cmd.run:
    - name: /tmp/install_salt.sh -M -N -n git {{version}}
# If we are installing a specific version, we can add an unless
{% if version[0] == 'v' %}
    - unless: salt-master --version | awk '{print $2}' | grep {{version[1:]}}
{% endif %}
{% endif %}
