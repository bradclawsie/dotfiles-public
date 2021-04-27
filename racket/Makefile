RACKET_INSTALLER = racket-8.0-x86_64-linux-cs.sh

.PHONY: rm-old
rm-old:
	rm -rf ${HOME}/racket && rm -rf ${HOME}/.local

.PHONY: install
install: rm-old
	sudo apt -y install wget && \
	cd /tmp && \
	wget https://download.racket-lang.org/releases/8.0/installers/$(RACKET_INSTALLER) && \
	sh ./$(RACKET_INSTALLER) --unix-style --create-dir --dest ${HOME}/racket && \
	rm $(RACKET_INSTALLER) && \
	raco setup

.PHONY: libs
libs:
	sudo apt install -y sqlite3 libsqlite3-dev argon2 libargon2-dev libedit2 libedit-dev make && \
	raco pkg install --skip-installed --auto review  && \
	raco pkg install --skip-installed --auto libuuid && \
	raco pkg install --skip-installed --auto crypto && \
	raco pkg install --skip-installed --auto sha && \
	raco setup


