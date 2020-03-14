FROM debian:buster-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl bzip2 ca-certificates && \
    curl -o /tmp/fah.tar.bz2 https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1-64bit-release.tar.bz2 && \
    tar --wildcards --to-stdout -xvf /tmp/fah.tar.bz2 "*/FAHClient" >> /bin/FAHClient && \
    tar --wildcards --to-stdout -xvf /tmp/fah.tar.bz2 "*/FAHCoreWrapper" >> /bin/FAHCoreWrapper && \
    chmod u+x /bin/FAHClient && \
    chmod u+x /bin/FAHCoreWrapper && \
    rm /tmp/fah.tar.bz2 && \
    apt-get remove -y curl bzip2 && \
    apt-get autoremove -y && \
    rm -rf /var/logs


ENV USER Anonymous
ENV TEAM 0
ENV PASSKEY ""
ENV POWER full
ENV GPU false 
# needs driver and opencl support

EXPOSE 7396

ENTRYPOINT ["sh", "-c", "FAHClient --allow=0/0:7396 --web-allow=0/0:7396 --user=$USER --team=$TEAM --passkey=$PASSKEY --power=$POWER --gpu=$GPU"]
