# Makefile for mkinitcpio-archlogo

VERSION=0.3.0

all:
	@echo "Just run make install..."

.PHONY: install
install:
	# install unit file
	install -D -m0644 systemd/archlogo.service $(DESTDIR)/usr/lib/systemd/system/archlogo.service

	# install install-script and hook for plain old script based initramfs
	install -D -m0644 install/archlogo $(DESTDIR)/usr/lib/initcpio/install/archlogo
	install -D -m0755 hook/archlogo $(DESTDIR)/usr/lib/initcpio/hooks/archlogo

	# install config
	install -D -m0644 etc/archlogo.conf $(DESTDIR)/etc/archlogo.conf

	# install logos
	install -D -m0644 share/archlogo $(DESTDIR)/usr/share/archlogo/archlogo
	install -D -m0644 share/archlogo2 $(DESTDIR)/usr/share/archlogo/archlogo2
	install -D -m0644 share/archlogo3 $(DESTDIR)/usr/share/archlogo/archlogo3

release:
	git archive --format=tar.xz --prefix=mkinitcpio-archlogo-$(VERSION)/ $(VERSION) > mkinitcpio-archlogo-$(VERSION).tar.xz
	gpg --armor --detach-sign --comment mkinitcpio-archlogo-$(VERSION).tar.xz mkinitcpio-archlogo-$(VERSION).tar.xz
	git notes --ref=refs/notes/signatures/tar add -C $$(git archive --format=tar --prefix=mkinitcpio-archlogo-$(VERSION)/ $(VERSION) | gpg --armor --detach-sign --comment mkinitcpio-archlogo-$(VERSION).tar | git hash-object -w --stdin) $(VERSION)
