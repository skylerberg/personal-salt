include:
  - xmodmap

reload xmodmap:
  cmd.wait:
    - name: xmodmap - < /etc/X11/Xmodmap
    - require:
      - sls: xmodmap

/etc/X11/Xmodmap:
  file.managed:
    - source: salt://xmodmap/files/Xmodmap
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - cmd: reload xmodmap
