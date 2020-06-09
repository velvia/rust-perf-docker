# Docker container for running perf and flamegraph
# To execute and mount local Rust source:
# docker build -t rust-perf .
# docker run -it --privileged -v ~/src/rust:/src rust-perf bash
FROM rust:latest

RUN apt-get update && apt-get install -y linux-perf
RUN cargo install flamegraph

# Add additional perf privileges
RUN echo "kernel.perf_event_paranoid = -1" >>/etc/sysctl.conf
