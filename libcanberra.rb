require 'formula'

class Libcanberra < Formula
  homepage ''
  url 'http://0pointer.de/lennart/projects/libcanberra/libcanberra-0.30.tar.xz'
  sha1 'fd4c16e341ffc456d688ed3462930d17ca6f6c20'

  def patches
    #
    DATA
  end

  depends_on 'pkg-config' => :build
  depends_on 'gettext'
  depends_on 'intltool'
  depends_on 'libvorbis'

  def install

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--disable-alsa",
	                      "--disable-gtk-doc",
	                      "--disable-oss",
	                      "--disable-lynx",
	                      #"--disable-null",
	                      "--disable-pulse",
	                      "--disable-silent-rules",
	                      "--disable-tdb",
	                      "--disable-udev",
	                      "--disable-gtk",
	                      "--disable-gtk3"

    system "make", "install"
  end

end


__END__
--- a/doc/Makefile.in
+++ b/doc/Makefile.in
@@ -484,7 +484,7 @@
 
 
 @USE_LYNX_TRUE@README: README.html
-@USE_LYNX_TRUE@	$(AM_V_GEN)lynx --dump $^ | sed 's,file://localhost/.*/doc/README.html,README,' > $@
+@USE_LYNX_TRUE@	$(AM_V_GEN)lynx --dump $^ | LC_CTYPE=C sed 's,file://localhost/.*/doc/README.html,README,' > $@
 
 tidy: README.html
 	tidy -qe < README.html ; true
--- a/configure
+++ b/configure
@@ -3358,12 +3358,6 @@
 _ACEOF
 
 
-if type -p stow > /dev/null && test -d /usr/local/stow ; then
-        { $as_echo "$as_me:${as_lineno-$LINENO}: *** Found /usr/local/stow: default install prefix set to /usr/local/stow/${PACKAGE_NAME}-${PACKAGE_VERSION} ***" >&5
-$as_echo "$as_me: *** Found /usr/local/stow: default install prefix set to /usr/local/stow/${PACKAGE_NAME}-${PACKAGE_VERSION} ***" >&6;}
-        ac_default_prefix="/usr/local/stow/${PACKAGE_NAME}-${PACKAGE_VERSION}"
-fi
-
 #### Checks for programs. ####
 
 
@@ -6460,9 +6454,7 @@
 
 
 
-  for flag in \
-        -Wl,--as-needed \
-        -Wl,--gc-sections; do
+  for flag in ; do
 
   { $as_echo "$as_me:${as_lineno-$LINENO}: checking if $CC supports flag $flag in envvar LDFLAGS" >&5
 $as_echo_n "checking if $CC supports flag $flag in envvar LDFLAGS... " >&6; }
