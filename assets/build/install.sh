#!/bin/bash
set -e

# configure supervisord to start syslog-ng
cat > /etc/supervisor/conf.d/syslog-ng.conf <<EOF
[program:syslog-ng]
priority=20
command=service syslog-ng start
autostart=true
autorestart=true
stopsignal=QUIT
EOF

# configure supervisord to start postfix
cat > /etc/supervisor/conf.d/postfix.conf <<EOF
[program:postfix]
priority=10
command=service postfix start
autostart=true
autorestart=true
stopsignal=QUIT
EOF

