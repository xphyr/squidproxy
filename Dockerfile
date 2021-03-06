FROM centos:8
LABEL description="Containerized squid proxy for uCPE deployment."
RUN mkdir -p /var/log/squid && mkdir -p /var/spool/squid && mkdir -p /var/lib/squid
RUN chgrp -R 0 /var/log/squid && chmod -R g=u /var/log/squid
RUN chgrp -R 0 /var/spool/squid && chmod -R g=u /var/spool/squid
RUN chgrp -R 0 /var/lib/squid && chmod -R g=u /var/lib/squid
RUN chgrp -R 0 /var/run && chmod -R g=u /var/run
RUN dnf install -y squid && dnf clean all
COPY squid.conf /etc/squid/squid.conf
RUN touch /var/lib/squid/bad-sites.acl
RUN chgrp -R 0 /etc/squid
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh
RUN chmod 775 /var/spool/squid
EXPOSE 3128/tcp
WORKDIR /var/spool/squid
ENTRYPOINT ["/sbin/entrypoint.sh"]