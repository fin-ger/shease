PREFIX ?= /usr
VERSION=v0.1.0

.PHONY: check build package clean install uninstall release dev-install dev-uninstall

check:
	@shellcheck -P src -x -oall src/shease src/shease.rc

build: check
	@mkdir -p build/bin build/share/shease
	@cp -a src/shease build/bin
	@cp -a src/shease.rc build/share/shease
	@sed -i \
		-e "s;SHEASE_PREFIX=.*;SHEASE_PREFIX=\"$(PREFIX)\";g" \
		-e "s;SHEASE_VERSION=v0.1.0
		build/bin/shease
	@grep -Pzo '\n(?!__shease__.+).+\(\) \{\n' src/shease.rc | \
		sed '1~2d' | \
		grep -Po '[a-zA-Z0-9_]+' | \
		tr _ - | \
		xargs -I{} ln -f -s shease build/bin/{}

package: build
	@mkdir -p package
	@rm -f package/shease-$(VERSION:v%=%).tgz
	@tar czfC package/shease-$(VERSION:v%=%).tgz build bin share

clean:
	@rm -rf build package

install: package
	@tar xCf "$(PREFIX)" package/shease-$(VERSION:v%=%).tgz --overwrite

uninstall: package
	@tar tf package/shease-$(VERSION:v%=%).tgz | \
		sed "s;^;$(PREFIX)/;g" | \
		./scripts/safe-remove.sh

release:
	@./scripts/release.sh "$(VERSION:v%=%)"

dev-install:
	@$(MAKE) PREFIX="${HOME}/.local" install

dev-uninstall:
	@$(MAKE) PREFIX="${HOME}/.local" uninstall
