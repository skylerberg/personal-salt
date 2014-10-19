include:
  - git
  - vim

{% for user in salt['pillar.get']('dotfiles:users', ['skyler']) %}
{% set home = salt['user.info'](user).home %}

.bashrc {{ user }}:
  file.managed:
    - name: {{home}}/.bashrc
    - source: salt://dotfiles/files/.bashrc
    - user: {{ user }}
    - group: {{ user }}

.tmux.conf {{ user }}:
  file.managed:
    - name: {{home}}/.tmux.conf
    - source: salt://dotfiles/files/.tmux.conf
    - user: {{ user }}
    - group: {{ user }}

.inputrc {{ user }}:
  file.managed:
    - name: {{home}}/.inputrc
    - source: salt://dotfiles/files/.inputrc
    - user: {{ user }}
    - group: {{ user }}

.vimrc {{ user }}:
  file.managed:
    - name: {{home}}/.vimrc
    - source: salt://dotfiles/files/.vimrc
    - user: {{ user }}
    - group: {{ user }}

.gitconfig {{ user }}:
  file.managed:
    - name: {{home}}/.gitconfig
    - source: salt://dotfiles/files/.gitconfig
    - user: {{ user }}
    - group: {{ user }}

vundle {{ user }}:
  git.latest:
    - name: https://github.com/gmarik/Vundle.vim.git
    - target: {{home}}/.vim/bundle/Vundle.vim
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - pkg: git

install plugins vundel {{ user }}:
  cmd.run:
    - name: vim +PluginInstall +qall 
    - user: {{ user }}
    - require:
      - sls: vim
      - file: .vimrc {{ user }}
      - git: vundle {{ user }}
{% endfor %}
