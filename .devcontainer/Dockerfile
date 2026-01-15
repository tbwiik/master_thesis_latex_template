# Use official TeX Live image - includes full TeX Live distribution
# See: https://hub.docker.com/r/texlive/texlive
FROM texlive/texlive:latest

# Install pygments for minted package syntax highlighting
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3-pygments \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8
