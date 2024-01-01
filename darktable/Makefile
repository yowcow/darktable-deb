PKGVERSION = 4.6.0
PKGRELEASE = 1
UBUNTU_RELEASE = $(shell lsb_release -sr)
PROCESSOR = $(shell uname -p)

ifeq ($(PROCESSOR),x86_64)
ARCH = amd64
else
ARCH = $(PROCESSOR)
endif

SRCDIR = darktable-$(PKGVERSION)
ARTIFACT = yowcow-darktable.$(PKGVERSION)-$(PKGRELEASE).ubuntu-$(UBUNTU_RELEASE).$(ARCH).deb
DESTDIR = /tmp/darktable

all: $(SRCDIR)

darktable-%.tar.xz:
	curl -L "https://github.com/darktable-org/darktable/releases/download/release-$*/darktable-$*.tar.xz" -o $@

darktable-%: darktable-%.tar.xz
	tar Jxfv $<

build: $(ARTIFACT)

%.deb: $(DESTDIR)
	$(MAKE) $(DESTDIR)/DEBIAN/control
	dpkg-deb --build $< $@

$(DESTDIR): $(SRCDIR)
	cd $< \
		&& ./build.sh \
			--prefix /usr \
			--build-type Release \
			-- -DBINARY_PACKAGE_BUILD=ON \
		&& DESTDIR=$(DESTDIR) cmake \
			--build build \
			--target install \
			-- -j16

$(DESTDIR)/DEBIAN/control: DEBIAN/control
	mkdir -p $(dir $@)
	cat $< \
		| sed 's/{{PKGVERSION}}/$(PKGVERSION)/g' \
		| sed 's/{{PKGRELEASE}}/$(PKGRELEASE)/g' \
		| sed 's/{{ARCH}}/$(ARCH)/g' \
		> $@

clean:
	rm -rf $(SRCDIR)

.PHONY: all build clean
