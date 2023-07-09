#!/bin/sh

/tmp/yq -i '(.scrape_configs[]|select(.job_name == "cloudalm").http_sd_configs[].url)|="$SAPMON_URL/instances.json"' "/etc/prometheus/prometheus.yml"

/bin/prometheus \
    --config.file=/etc/prometheus/prometheus.yml \
    --storage.tsdb.path=/prometheus \
    --web.console.libraries=/usr/share/prometheus/console_libraries \
    --web.console.templates=/usr/share/prometheus/consoles

