FROM registry.access.redhat.com/ubi8:8.0

LABEL version="1.0" \
      description="Simple reverse proxy frontend"

RUN yum install -y --disableplugin=subscription-manager --nodocs \
    nginx nginx-mod-http-perl \
    && yum clean all

RUN touch /run/nginx.pid \
    && chgrp -R 0 /var/log/nginx /run/nginx.pid \
    && chmod -R g+rwx /var/log/nginx /run/nginx.pid

EXPOSE 8080

USER 1001

CMD nginx -g "daemon off;"