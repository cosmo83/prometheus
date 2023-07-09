FROM prom/prometheus
RUN wget -qO /tmp/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
RUN chmod +x /tmp/yq
COPY prometheus.yml /etc/prometheus/prometheus.yml
COPY entrypoint.sh /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]

