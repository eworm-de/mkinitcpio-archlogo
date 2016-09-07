# Makefile for mkinitcpio-archlogo

all:
	@echo "Just run make install..."

install:
	# install install script and unit file
	install -D -m0644 install/archlogo $(DESTDIR)/usr/lib/initcpio/install/archlogo
	install -D -m0644 systemd/archlogo.service $(DESTDIR)/usr/lib/systemd/system/archlogo.service

	# install hook for plain old script based initramfs
	install -D -m0755 hook/archlogo $(DESTDIR)/usr/lib/initcpio/hooks/archlogo

	# install config
	install -D -m0644 etc/archlogo.conf $(DESTDIR)/etc/archlogo.conf

	# install logos
	install -D -m0644 share/archlogo $(DESTDIR)/usr/share/archlogo/archlogo
	install -D -m0644 share/archlogo2 $(DESTDIR)/usr/share/archlogo/archlogo2
	install -D -m0644 share/archlogo3 $(DESTDIR)/usr/share/archlogo/archlogo3

.PHONY: install