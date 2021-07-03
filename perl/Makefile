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
	App::perlimports \
	Dist::Zilla \
	Dist::Zilla::Plugin::RewriteVersion \
	Dist::Zilla::PluginBundle::Basic
