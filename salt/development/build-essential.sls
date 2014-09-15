build-essential:
  pkg.installed

# TODO(skyler) Add group install to salt pkg state so that this works
#Development Tools:
#  pkg.group_install

# NOTE(skyler) This is a workaround that works for group install currently
#Development Libraries:
#  module.run:
#    - name: pkt.group_install
#    - m_name: Development Libraries
