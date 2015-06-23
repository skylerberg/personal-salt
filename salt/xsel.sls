xsel:
  pkg.installed:
    - unless: command -v pbcopy
