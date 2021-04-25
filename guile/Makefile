INSTALL_DIR = guile
INSTALL_PATH = ${HOME}/$(INSTALL_DIR)
GUILE_DISTRO = guile-3.0.5
GUILE_TGZ = $(GUILE_DISTRO).tar.gz
GUILE_DL = ftp://ftp.gnu.org/gnu/guile/$(GUILE_TGZ)
JSON_DISTRO = guile-json-4.5.2
CURL_VERSION = 0.9
CURL_DISTRO = guile-curl-$(CURL_VERSION)

.PHONY: pkgs
pkgs:
	sudo apt install -y libssl-dev openssl libreadline-dev libreadline8 build-essential pkg-config ca-certificates wget libgc-dev libffi-dev libgmp-dev libunistring-dev libltdl-dev

.PHONY: rm-old
rm-old:
	rm -rf $(INSTALL_PATH)

.PHONY: install
install: pkgs rm-old
install:
	cd /tmp && \
	rm -rf $(GUILE_DISTRO)* && \
	wget $(GUILE_DL) && \
	tar -xzf $(GUILE_TGZ) && \
	cd $(GUILE_DISTRO) && \
	./configure --prefix=$(INSTALL_PATH) && \
	make install && \
	cd /tmp && \
	rm -rf $(GUILE_DISTRO)*

.PHONY: json
json:
	cd /tmp && \
	rm -rf $(JSON_DISTRO)* && \
	wget https://download.savannah.gnu.org/releases/guile-json/$(JSON_DISTRO).tar.gz && \
	tar -xzf $(JSON_DISTRO).tar.gz && \
	cd $(JSON_DISTRO) && \
	./configure --prefix=$(INSTALL_PATH) --libdir=$(INSTALL_PATH)/lib && \
	make install && \
	cd /tmp && \
	rm -rf $(JSON_DISTRO)*

# https://github.com/spk121/guile-curl
.PHONY: curl
curl:
	sudo apt install -y libcurl4 libcurl4-openssl-dev gettext texinfo && \
	cd /tmp && \
	rm -rf $(CURL_DISTRO) && \
	wget https://github.com/spk121/guile-curl/archive/refs/tags/v$(CURL_VERSION).tar.gz && \
	tar -xzf v$(CURL_VERSION).tar.gz && \
	cd $(CURL_DISTRO) && \
	./bootstrap && \
	./configure --prefix=$(INSTALL_PATH) --libdir=$(INSTALL_PATH)/lib && \
	make install && \
	cd /tmp && \
	rm -rf v$(CURL_VERSION)* && \
	rm -rf $(CURL_DISTRO)*

.PHONY: libs
libs: json curl

