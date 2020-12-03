FROM centos:8
LABEL description="Containerized squid proxy for uCPE deployment."
RUN mkdir -p /var/log/squid && mkdir -p /var/spool/squid
RUN chgrp -R 0 /var/log/squid && chmod -R g=u /var/log/squid
RUN chgrp -R 0 /var/spool/squid && chmod -R g=u /var/spool/squid
RUN chgrp -R 0 /var/run && chmod -R g=u /var/run
RUN dnf install -y squid && dnf clean all
RUN chgrp -R 0 /etc/squid
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh
EXPOSE 3128/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]