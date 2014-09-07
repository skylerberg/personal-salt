sysctl.conf:
  file.managed:
    - name: /etc/sysctl.conf
    - source: salt://disable_ipv6/files/sysctl.conf

sysctl -p:
  cmd.run:
    - require:
      - file: sysctl.conf
