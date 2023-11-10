PHONY: pkgs
pkgs:
	sudo pacman -S \
	ca-certificates \
	openssl \
	postgresql-libs \
	sqlite \
	libgit2

PHONY: libs
libs:
	cpanm -n \
	App::Ack \
	App::perlimports \
	Cpanel::JSON::XS \
	CryptX \
	Crypt::Argon2 \
	Crypt::JWT \
	Crypt::Random \
	DateTime \
	DBD::Pg \
	DBD::SQLite \
	DBI \
	Dist::Zilla \
	Dist::Zilla::Plugin::GitHub::Meta \
	Dist::Zilla::Plugin::Git::Contributors \
	Dist::Zilla::Plugin::RewriteVersion \
	Dist::Zilla::PluginBundle::Basic \
	File::Slurp \
	Git::Raw \
	IO::Socket::Socks \
	IO::Socket::SSL \
	List::AllUtils \
	Mojolicious \
	Mojo::Log::JSON \
	Mojo::Pg \
	Mojo::SQLite \
	Perl::Critic \
	Perl::Critic::TooMuchCode \
	Perl::Critic::StricterSubs \
	Perl::Critic::Community \
	Perl::Critic::Bangs \
	Perl::Tidy \
	Perl::Tidy::Sweetened \
	Pod::Perldoc \
	Scalar::Util \
	strictures \
	Syntax::Keyword::Try \
	Test::Kwalitee \
	Test2::Harness \
	Test2::Suite
