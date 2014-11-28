{% from "xmodmap/map.jinja" import xmodmap with context %}

include:
  - xmodmap

reload xmodmap:
  cmd.wait:
    - name: xmodmap /etc/X11/Xmodmap
    - require:
      - pkg: {{ xmodmap['name'] }}
      - sls: xmodmap

/etc/X11/Xmodmap:
  file.managed:
    - source: salt://xmodmap/files/Xmodmap
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - cmd: reload xmodmap
