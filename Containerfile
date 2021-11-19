FROM docker.io/rockylinux/rockylinux:8.5

# SPP repo, contains ssacli and hponcfg
COPY hpe-spp.repo /etc/yum.repos.d/
# SUM repo, contains smartupdate
COPY hpe-sum.repo /etc/yum.repos.d/

# install smartupdate, hponcfg and ssacli (and openssl, required by hponcfg)
RUN dnf install -y \
            sum \
            hponcfg \
            ssacli \
            openssl \
 && dnf clean all \
 && rm -rf /var/cache/yum \
           /yum.repos.d/hpe-spp.repo \
           /yum.repos.d/hpe-sum.repo

# FWPP repo, contains firmware packages
COPY hpe-fwpp.repo /etc/yum.repos.d/

# upgrade script
COPY --chmod=0755 upgrade-firmware.sh /

# copy entrypoint and make it executable
COPY --chmod=0755 entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
