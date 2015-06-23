telnet:
  pkg.installed:
    - unless: command -v telnet
