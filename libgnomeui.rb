require 'formula'

class Libgnomeui < Formula
  homepage ''
  url 'http://ftp.gnome.org/pub/gnome/sources/libgnomeui/2.24/libgnomeui-2.24.5.tar.gz'
  sha256 '0a7ae41bf6161eabd52a4a845d1941b29d595a422bd3b7275ab1db0c7a3de9cb'

  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'glib'
  depends_on 'libxml2'
  depends_on 'libgnomecanvas'
  depends_on 'gconf'
  depends_on 'libpng'
  depends_on 'gnome-vfs'
  depends_on 'gnome-keyring'
  depends_on 'libbonoboui'
  depends_on 'libgnome'


  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make"
    system "make install"
  end

end
