FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y vim curl socat netcat-openbsd \
  iproute2 dnsutils iptables nftables apache2 \
  tcpdump iperf && \
  rm -rf /var/lib/apt/lists/* 

ARG BPFTRACE_VERSION="v0.21.2"
RUN curl -L  https://github.com/bpftrace/bpftrace/releases/download/${BPFTRACE_VERSION}/bpftrace -o /usr/local/bin/bpftrace \
  && chmod +x /usr/local/bin/bpftrace

ARG PWRU_VERSION="v1.0.8"
RUN curl -L https://github.com/cilium/pwru/releases/download/${PWRU_VERSION}/pwru-linux-amd64.tar.gz | tar -zx -C /usr/local/bin \
&& chmod +x /usr/local/bin/pwru

RUN curl -L http://ftp.de.debian.org/debian/pool/non-free/n/netperf/netperf_2.7.0-0.1_amd64.deb -o netperf.deb && \
  dpkg -i ./netperf.deb && rm netperf.deb

ENTRYPOINT [ "/usr/bin/netserver", "-D" ]