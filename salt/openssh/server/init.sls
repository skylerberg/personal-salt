{% from "openssh/server/map.jinja" import server with context %}

openssh-server:
  pkg:
    - installed
  service:
    - name: {{ server.sshd }}
    - running
    - enable: True
