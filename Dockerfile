FROM debian:stable-slim

RUN sed -i 's/^Components: main$/Components: main contrib non-free non-free-firmware/' /etc/apt/sources.list.d/debian.sources

RUN apt-get update && apt-get install -y --no-install-recommends \
    unrar \
    p7zip-full \
    cksfv \
    findutils \
    file \
    && rm -rf /var/lib/apt/lists/*

COPY unrarall /usr/local/bin/unrarall
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /usr/local/bin/unrarall /entrypoint.sh

# Directory to watch for rar files
VOLUME ["/input"]

# Interval between runs in seconds (default: 300)
ENV DELAY=300

# Clean mode passed to unrarall as --clean=<value> (e.g. "none", "rar", "all")
# Controls what files unrarall will delete after extraction succeeds.
ENV CLEANMODE="all"

# Extra args passed to unrarall (e.g. "--force")
ENV UNRARALL_ARGS=""

ENTRYPOINT ["/entrypoint.sh"]
