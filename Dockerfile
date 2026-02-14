FROM kicad/kicad:8.0

# Install make and other useful tools
USER root
RUN apt-get update && apt-get install -y make && rm -rf /var/lib/apt/lists/*
USER kicad

WORKDIR /project
