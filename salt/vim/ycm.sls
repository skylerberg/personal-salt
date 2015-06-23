include:
  - make
  - cmake
  - vim.config

{% for user in salt['pillar.get']('dotfiles:users', [{'username': 'skyler'}]) %}
{% set username = user['username'] %}

install YouCompleteMe:
  cmd.run:
    - name: |
        cd ~/.vim/bundle/YouCompleteMe
        git submodule update --init --recursive
        make install
        ./install
    - require:
      - pkg: make
      - pkg: cmake
      - git: download YouCompleteMe for {{ username }}
    - user: {{ username }}
    - unless: test -x ~/.vim/bundle/YouCompleteMe/install

{% endfor %}
