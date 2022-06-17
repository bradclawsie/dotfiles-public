.PHONY: brew-pkgs
brew-pkgs:
	sudo apt install -y \
	perlbrew \
	ca-certificates \
	libssl1.1 \
	libssl-dev \
	zlib1g-dev \
	libreadline-dev \
	libreadline8 \
	readline-common \
	sqlite3 \
	libsqlite3-0 \
	libsqlite3-dev \
	libgit2-dev

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
	Perl::Critic::StricterSubs \
	Perl::Critic::Community \
	Perl::Critic::Bangs \
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
	Dist::Zilla::PluginBundle::Basic \
	Test::Kwalitee \
	Dist::Zilla::Plugin::GitHub::Meta \
	Dist::Zilla::Plugin::Git::Contributors \
	Git::Raw \
	Future::AsyncAwait \
	Perl::LanguageServer \
	Syntax::Keyword::Try \
	File::Slurp \
	Minion \
	Minion::Backend::SQLite \
	Log::Log4perl \
	Log::Log4perl::Layout::JSON \
	Scalar::Util \
	Net::SSLeay \
	MooseX::Extended
