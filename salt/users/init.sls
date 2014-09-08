{% for user in salt['pillar.get']('users', ['skyler']) %}

{{user}}:
  user.present:
    - password: {{ salt['pillar.get']('users:'+user+':password', 'password') }}

{% endfor %}
