require 'formula'

class Libgnome < Formula
  homepage ''
  url 'http://ftp.gnome.org/pub/GNOME/sources/libgnome/2.32/libgnome-2.32.1.tar.gz'
  sha256 'b9ef58e22708e5ada10757fdb384161b750555d65936103e3191511967d79c17'

  def patches
    #From https://trac.macports.org/browser/trunk/dports/gnome/gnome-vfs/files/enable-deprecated.diff
    DATA
  end

  depends_on :x11
  depends_on 'intltool' => :build
  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'gconf'
  depends_on 'gnome-vfs'
  depends_on 'libbonobo'
  depends_on 'libcanberra'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

end


__END__
--- a/libgnome/Makefile.in
+++ b/libgnome/Makefile.in
@@ -311,7 +311,6 @@
 	-I$(srcdir)/..						\
 	$(WARN_CFLAGS)						\
 	$(LIBGNOME_CFLAGS)					\
-	-DG_DISABLE_DEPRECATED					\
 	-DLIBGNOME_PREFIX=\""$(prefix)"\"			\
 	-DLIBGNOME_LIBDIR=\""$(libdir)"\"			\
 	-DLIBGNOME_DATADIR=\""$(datadir)"\"			\
