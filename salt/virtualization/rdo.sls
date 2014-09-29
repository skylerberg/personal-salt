include:
  - networking.openssh.server

rdo-release:
  pkg.installed:
    - sources: 
      - rdo-release: https://rdo.fedorapeople.org/rdo-release.rpm

openstack-packstack:
  pkg.installed:
    - require:
      - pkg: rdo-release

# TODO(skyler) Add unless
packstack --allinone:
  cmd.run:
    - require:
      - pkg: openstack-packstack
      - service: openssh-server
