# Remember to update the url and hash occassionally
install_salt.sh:
  file.managed:
    - name: /tmp/install_salt.sh
    - source: https://raw.githubusercontent.com/saltstack/salt-bootstrap/e6f9aec40712d8b529183fc03507fbdec6e5d0a6/bootstrap-salt.sh
    - source_hash: md5 = 2743d7e5e1b6da0fbbbaff329a17d7f9
    - mode: 700
    - user: root
    - group: root
