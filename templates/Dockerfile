FROM logstash:{{logstash_version}}

# Install plugins
{% for plugin in logstash_plugins %}
RUN logstash-plugin install --version {{ plugin.version }} {{ plugin.name }}
{% endfor %}

CMD ["-f", "/etc/logstash.conf"]
