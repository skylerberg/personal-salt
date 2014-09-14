rdo-release:
  pkg.installed:
    - sources: 
      - rdo-release: https://rdo.fedorapeople.org/rdo-release.rpm

openstack-packstack:
  pkg.installed:
    - require:
      - pkg: rdo-release

permissive:
  selinux.mode

# TODO(skyler) Add unless
packstack --allinone:
  cmd.run:
    - require:
      - selinux: permissive
