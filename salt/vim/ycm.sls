include:
  - make
  - cmake
  - vim.config

{% for user in salt['pillar.get']('dotfiles:users', ['skyler']) %}

install YouCompleteMe:
  cmd.run:
    - name: |
        cd ~/.vim/bundle/YouCompleteMe
        make install
        ./install
    - require:
      - pkg: make
      - pkg: cmake
      - git: download YouCompleteMe for skyler
    - user: {{ user }}
    - unless: test -x ~/.vim/bundle/YouCompleteMe/install

{% endfor %}
