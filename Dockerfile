FROM takutakahashi/notion-tpl

WORKDIR /src/
RUN apt update && apt install -y git wget \
 && wget https://github.com/gohugoio/hugo/releases/download/v0.79.1/hugo_0.79.1_Linux-64bit.deb \
 && apt install -y ./hugo_0.79.1_Linux-64bit.deb \
 && rm -f hugo_0.79.1_Linux-64bit.deb
COPY archetypes/ /src/archetypes/
COPY config.yml /src/
COPY entrypoint.sh /src/
ENTRYPOINT ["/src/entrypoint.sh"]