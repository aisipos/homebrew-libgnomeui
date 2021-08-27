require 'formula'

class Etherape < Formula
  homepage 'http://etherape.sourceforge.net/'
  url 'https://newcontinuum.dl.sourceforge.net/project/etherape/etherape/0.9.20/etherape-0.9.20.tar.gz'
  sha256 'f54b10b56397075c98a1f192e2b30817e212581b0929dd0304e15fa8eaf59f96'


  patch :DATA

  depends_on 'pkg-config' => :build
  depends_on 'itstool' => :build
  depends_on 'glib'
  depends_on 'libglade'
  depends_on 'gettext'
  depends_on 'libpcap'
  depends_on 'goocanvas'
  depends_on 'popt'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--disable-scrollkeeper",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "doc"
    system "make", "install"
  end

  def caveats; <<~EOS
    The shared libraries are currently not installed in the right directories. To run:
    DYLD_FALLBACK_LIBRARY_PATH=$(brew --prefix)/lib/libglade/2.0/ etherape
    EOS
  end

end
__END__
diff --git a/src/names/eth_resolv.c b/src/names/eth_resolv.c
index 137985b..194bc5d 100644
--- a/src/names/eth_resolv.c
+++ b/src/names/eth_resolv.c
@@ -27,7 +27,9 @@
 #include <string.h>
 
 #include <net/ethernet.h>
-#include <netinet/ether.h>
+#include <sys/types.h>
+#include <netinet/in_systm.h>
+#include <netinet/in.h>
 
 #include <glib.h>
 
