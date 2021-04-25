INSTALL_DIR = .raku
INSTALL_PATH = ${HOME}/$(INSTALL_DIR)
BUILD_PKGS = wget git build-essential
RAKU_DISTRO = rakudo-moar-2021.04-01-linux-x86_64-gcc
RAKU_TGZ = $(RAKU_DISTRO).tar.gz
RAKU_DL = https://rakudo.org/dl/rakudo/$(RAKU_TGZ)

.PHONY: pkgs
pkgs:
	sudo apt install -y $(BUILD_PKGS)

.PHONY: rm-old
rm-old:
	rm -rf $(INSTALL_PATH)

.PHONY: install
install: pkgs rm-old
	cd /tmp && \
	rm -rf $(RAKU_DISTRO)*
	wget $(RAKU_DL) && \
	tar -xzf $(RAKU_TGZ) && \
	mkdir $(INSTALL_PATH) && \
	mv $(RAKU_DISTRO)/* $(INSTALL_PATH)/. && \
	rm -rf $(RAKU_DISTRO)*

.PHONY: basics
basics:
	zef install Linenoise App::Prove6

.PHONY: uuid
uuid:
	sudo apt install -y libuuid1
	zef install LibUUID

.PHONY: cro
cro:
	sudo apt install -y libssl-dev
	zef install --/test cro
	zef install Cro::HTTP::Test

.PHONY: crypt
crypt:
	sudo apt install -y libgcrypt20 libgcrypt20-dev
	zef install Base64::Native
	zef install Gcrypt
	zef install Crypt::Libcrypt

.PHONY: log
log:
	zef install Log::Async

.PHONY: db
db:
	sudo apt install -y sqlite3 libsqlite3-dev
	zef install DBIish

.PHONY: file
file:	
	zef install File::Directory::Tree

.PHONY: curl
curl:
	sudo apt install -y libcurl4 libcurl4-openssl-dev
	zef install LibCurl

.PHONY: json
json:
	zef install JSON::Fast

.PHONY: libs
libs: basics uuid cro crypt log db file curl json
