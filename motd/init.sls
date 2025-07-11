{% set motd_text = salt['pillar.get']('motd_content', '') %}
{% if not motd_text %}
{% set motd_text = salt['cp.get_file_str']('salt://motd/files/default') %}
{% endif %}

/etc/motd:
  file.managed:
    - contents: {{ motd_text | yaml_encode }}
