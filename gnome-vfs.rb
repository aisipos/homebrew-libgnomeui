require 'formula'

class GnomeVfs < Formula
  homepage ''
  url 'http://ftp.gnome.org/pub/gnome/sources/gnome-vfs/2.24/gnome-vfs-2.24.4.tar.gz'
  sha256 '2eb84be8d260e3c4f13b68e820acf4100e97956f6953067a99119fa8d88c5c00'

  def patches
    #From https://trac.macports.org/browser/trunk/dports/gnome/gnome-vfs/files/enable-deprecated.diff
    DATA
  end

  depends_on :x11 
  depends_on 'pkg-config' => :build
  depends_on 'gettext' => :build
  depends_on 'intltool' => :build
  depends_on 'glib'
  depends_on 'gconf'
  depends_on 'gnome-mime-data'
  depends_on 'openssl'

  def install

    ENV.append 'LDFLAGS', '-lresolv'
    system "./configure", "--enable-ipv6",
	                "--disable-howl",
	                "--disable-avahi",
	                "--with-openssl-libs=#{Formula.factory('openssl').opt_prefix}/lib",
	                "--with-openssl-includes=#{Formula.factory('openssl').opt_prefix}/include",
	                "--disable-gnutls",
	                "--disable-fam",
	                "ac_cv_func_open64=no",
	                "ac_cv_func_posix_fadvise=no",
	                "ac_cv_path_KRB5_CONFIG=none",
                     "--prefix=#{prefix}"
    system "make", "install" 
  end

  def post_install
    system "GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` gconftool-2 --makefile-install-rule #{prefix}/etc/gconf/schemas/*.schemas"
  end
end

__END__
--- a/daemon/Makefile.in
+++ b/daemon/Makefile.in
@@ -337,7 +337,6 @@
 	-D_LARGEFILE64_SOURCE                   \
 	-D_POSIX_PTHREAD_SEMANTICS		\
 	-D_REENTRANT				\
-	-DG_DISABLE_DEPRECATED			\
 	-DGNOME_VFS_PREFIX=\"$(prefix)\"	\
 	-DGNOME_VFS_DATADIR=\"$(datadir)\"	\
 	-DGNOME_VFS_LIBDIR=\"$(libdir)\"	\
--- a/libgnomevfs/Makefile.in
+++ b/libgnomevfs/Makefile.in
@@ -430,7 +430,6 @@
 	-D_LARGEFILE64_SOURCE                   \
 	-D_POSIX_PTHREAD_SEMANTICS		\
 	-D_REENTRANT				\
-	-DG_DISABLE_DEPRECATED			\
 	-DGNOME_VFS_PREFIX=\"$(prefix)\"	\
 	-DGNOME_VFS_BINDIR=\"$(bindir)\"	\
 	-DGNOME_VFS_DATADIR=\"$(datadir)\"	\
--- a/modules/Makefile.in
+++ b/modules/Makefile.in
@@ -468,7 +468,6 @@
 	-D_POSIX_PTHREAD_SEMANTICS		\
 	-D_REENTRANT				\
 	-DSSH_PROGRAM=\"$(SSH_PROGRAM)\"	\
-	-DG_DISABLE_DEPRECATED			\
 	-DGNOME_VFS_PREFIX=\"$(prefix)\"	\
 	-DGNOME_VFS_DATADIR=\"$(datadir)\"	\
 	-DGNOME_VFS_LIBDIR=\"$(libdir)\"	\
--- a/programs/Makefile.in
+++ b/programs/Makefile.in
@@ -344,8 +344,7 @@
 	-I$(top_srcdir)				\
 	-I$(top_builddir)			\
 	$(TEST_CFLAGS)				\
-	$(VFS_CFLAGS)				\
-	-DG_DISABLE_DEPRECATED
+	$(VFS_CFLAGS)

 libraries = \
 	$(top_builddir)/libgnomevfs/libgnomevfs-2.la	\
--- a/test/Makefile.in
+++ b/test/Makefile.in
@@ -471,7 +471,6 @@
 	-I$(top_builddir)/libgnomevfs           \
 	$(TEST_CFLAGS)				\
 	$(VFS_CFLAGS)				\
-	-DG_DISABLE_DEPRECATED			\
 	-DMODULES_PATH=\"$(libdir)/vfs/modules\"


