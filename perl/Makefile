.PHONY: pkgs
pkgs:
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
	build-essential \
	libdevel-repl-perl

.PHONY: libs
libs: pkgs
	cpanm -n Mojo::Redis Test2::Harness Perl::Critic::TooMuchCode Dist::Zilla::Plugin::RewriteVersion Dist::Zilla::PluginBundle::Basic Mojolicious Crypt::Argon2 Object::Pad Perl::Tidy::Sweetened App::Ack

.PHONY: brew-pkgs
brew-pkgs:
	sudo apt install -y \
	perlbrew \
	ca-certificates \
	libssl1.1 \
	libssl-dev \
	zlib1g-dev \
	libreadline-dev \
	libreadline7 \
	readline-common \
	sqlite3 \
	libsqlite3-0 \
	libsqlite3-dev

export PERL_MM_USE_DEFAULT=1

PHONY: brew
brew: brew-pkgs
	perlbrew init && \
	perlbrew install perl-5.34.0 && \
	cpan install App::cpanminus

PHONY: brew-libs
brew-libs:
	cpanm -n \
	Term::ReadLine::Gnu \
	Mojolicious \
	Test2::Suite \
	Test2::Harness \
	Object::Pad \
	Perl::Tidy \
	Perl::Critic \
	Perl::Critic::TooMuchCode \
	Perl::Tidy::Sweetened \
	List::AllUtils \
	multidimensional \
	indirect \
	bareword::filehandles \
	DBI \
	Devel::REPL \
	Crypt::Argon2 \
	DBD::SQLite \
	Mojo::SQLite \
	Cpanel::JSON::XS \
	CryptX \
	Crypt::JWT \
	EV \
	IO::Socket::Socks \
	IO::Socket::SSL \
	strictures \
	App::Ack \
	Data::Dumper \
	Sub::Info \
	List::SomeUtils \
	List::UtilsBy \
	List::MoreUtils \
	App::perlimports

