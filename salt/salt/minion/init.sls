salt-minion:
  pkg.installed

10-master.conf:
  file.managed:
    - name: /etc/salt/minion.d/10-master.conf
    - source: salt://salt/minion/files/10-master.conf
    - makedirs: True
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: salt-minion

