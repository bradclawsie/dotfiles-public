sudo apt-get -y install \
    cpanminus \
    libtest2-suite-perl \
    libterm-readline-gnu-perl \
    liblist-allutils-perl \
    libsyntax-keyword-try-perl \
    libperl-critic-perl \
    perltidy \
    libdata-uuid-perl \
    libmultidimensional-perl \
    libindirect-perl \
    libbareword-filehandles-perl \
    libcpanel-json-xs-perl \
    libev-perl \
    libio-socket-socks-perl \
    libio-socket-ssl-perl \
    libmojolicious-perl \
    libdbi-perl \
    libdbd-sqlite3 \
    libdbd-sqlite3-perl \
    libtest-mock-redis-perl \
    libcryptx-perl \
    libcrypt-jwt-perl \
    libmojo-sqlite-perl \
    libgit-raw-perl \
    libarchive-tar-wrapper-perl \
    libsoftware-license-perl \
    libtype-tiny-perl \
    libtype-tiny-xs-perl \
    libmoo-perl \
    libdist-zilla-perl \
    ca-certificates \
    build-essential
cpanm -n Mojo::Redis Test2::Harness Perl::Critic::TooMuchCode Dist::Zilla::Plugin::RewriteVersion Dist::Zilla::PluginBundle::Basic Mojolicious Crypt::Argon2
