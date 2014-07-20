require 'formula'

class Libbonobo < Formula
  homepage ''
  url 'http://ftp.gnome.org/pub/GNOME/sources/libbonobo/2.32/libbonobo-2.32.1.tar.gz'
  sha1 'adc153233271d355f214846d981f91a923a45c0e'

  depends_on 'pkg-config' => :build
  depends_on 'gettext'
  depends_on 'intltool'
  depends_on 'libxml2'
  depends_on 'libiconv'
  depends_on 'd-bus'
  depends_on 'glib'
  depends_on 'orbit'
  depends_on 'popt'

  def patches
    #See http://trac.macports.org/browser/trunk/dports/gnome/libbonobo/Portfile
    DATA
  end


  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

end

__END__
--- a/activation-server/Makefile.in
+++ b/activation-server/Makefile.in
@@ -341,6 +341,5 @@
 	$(SERVER_CFLAGS)			\
 	$(WARN_CFLAGS)				\
 	-DSERVER_CONFDIR=\"$(sysconfdir)\"	\
-	-DG_DISABLE_DEPRECATED			\
 	-DG_LOG_DOMAIN=\"Bonobo-Activation-Server\" \
 	$(NULL)
--- a/configure
+++ b/configure
@@ -794,7 +794,6 @@
 GETTEXT_PACKAGE
 DATADIRNAME
 ALL_LINGUAS
-INTLTOOL_PERL
 GMSGFMT
 MSGFMT
 MSGMERGE
@@ -13818,7 +13753,7 @@ fi
 
 
 if test "$enable_maintainer_mode" = "yes"; then
-	DISABLE_DEPRECATED_CFLAGS="-DG_DISABLE_DEPRECATED -DG_DISABLE_SINGLE_INCLUDES"
+	DISABLE_DEPRECATED_CFLAGS="-DG_DISABLE_SINGLE_INCLUDES"
 
 fi


