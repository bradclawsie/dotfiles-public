set -gx POSTGRES_APP_URL postgres://grokloc:grokloc@localhost:5432/app
set -gx REPOSITORY_BASE /tmp
set -gx CGO_ENABLED 1
set -gx PERL5LIB $HOME/repos/bradclawsie/grokloc-perl5/lib
set -gx HELIX_RUNTIME "$HOME/repos/helix/runtime"
