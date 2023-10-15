DEBIAN_FRONTEND=nointeractive

apt-get update \
    && apt-get install -yq \
        curl \
        git \
        lsb-release \
    && apt-get install -yq \
        build-essential \
        clang \
        cmake \
        desktop-file-utils \
        intltool \
        libcurl4-gnutls-dev \
        libexiv2-dev \
        libglib2.0-dev \
        libgtk-3-dev \
        libimage-exiftool-perl \
        libimath-dev \
        libjpeg-dev \
        libjson-glib-dev \
        liblcms2-dev \
        liblensfun-dev \
        libpugixml-dev \
        librsvg2-dev \
        libsqlite3-dev \
        libxml2-dev \
        libxml2-utils \
        libzstd-dev \
        python3-imath \
        python3-jsonschema \
        xsltproc \
        zlib1g-dev \
    && apt-get install -yq \
        iso-codes \
        libavif-dev \
        libcolord-dev \
        libcolord-gtk-dev \
        libcups2-dev \
        libgmic-dev \
        libgphoto2-dev \
        libgraphicsmagick1-dev \
        libheif-dev \
        libjxl-dev \
        liblua5.4-dev \
        libopenexr-dev \
        libopenjp2-7-dev \
        libosmgpsmap-1.0-dev \
        libsdl2-dev \
        libsecret-1-dev \
        libtiff5-dev \
        libwebp-dev \
    && echo OK
