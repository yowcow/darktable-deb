PKGVERSION = 4.4.2
PKGRELEASE = 3
UBUNTU_RELEASE = $(shell lsb_release -sr)
PROCESSOR = $(shell uname -p)

ifeq ($(PROCESSOR),x86_64)
ARCH = amd64
else
ARCH = $(PROCESSOR)
endif

SOURCE = darktable-$(PKGVERSION)
ARTIFACT = yowcow-darktable.$(PKGVERSION)-$(PKGRELEASE).ubuntu-$(UBUNTU_RELEASE).$(ARCH).deb
DESTDIR = /tmp/darktable

all: $(SOURCE)

darktable-%.tar.xz:
	curl -L "https://github.com/darktable-org/darktable/releases/download/release-$*/darktable-$*.tar.xz" -o $@

darktable-%: darktable-%.tar.xz
	tar Jxfv $<

build: $(ARTIFACT)

%.deb: $(DESTDIR)
	$(MAKE) $(DESTDIR)/DEBIAN/control
	dpkg-deb --build $< $@

$(DESTDIR): $(SOURCE)
	cd $< \
		&& ./build.sh \
			--prefix /usr \
			--build-type Release \
		&& DESTDIR=$(DESTDIR) cmake --build build --target install -- -j16

$(DESTDIR)/DEBIAN/control: DEBIAN/control
	mkdir -p $(dir $@)
	cat $< \
		| sed 's/{{PKGVERSION}}/$(PKGVERSION)/g' \
		| sed 's/{{PKGRELEASE}}/$(PKGRELEASE)/g' \
		| sed 's/{{ARCH}}/$(ARCH)/g' \
		> $@

clean:
	rm -rf $(SOURCE)

.PHONY: all build clean
