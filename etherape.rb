require 'formula'

class Etherape < Formula
  homepage 'http://etherape.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/etherape/etherape/0.9.13/etherape-0.9.13.tar.gz'
  sha256 '2a3d2a28b824ce4797529bb90d19a213d80e70f5b3f0cc5f455379aac31c09f7'


  depends_on 'pkg-config' => :build
  depends_on 'gnome-doc-utils' => :build
  depends_on 'glib'
  depends_on 'libglade'
  depends_on 'gettext'
  depends_on 'libgnomeui'
  depends_on 'libpcap'
  depends_on 'libgnomecanvas'
  #Because of missing libs at runtime
  depends_on 'libgnome'
  depends_on 'libgnomecanvas'


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

  def caveats; <<-EOS.undent
    The shared libraries are currently not installed in the right directories. To run:
    DYLD_FALLBACK_LIBRARY_PATH=$(brew --prefix)/lib/libglade/2.0/ etherape
    EOS
  end

end
