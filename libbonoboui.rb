require 'formula'

class Libbonoboui < Formula
  homepage ''
  url 'http://ftp.gnome.org/pub/GNOME/sources/libbonoboui/2.24/libbonoboui-2.24.5.tar.gz'
  sha1 '3b66aa7c185cd445856ab8cf2b527bcd4952cf06'

  depends_on :x11
  depends_on 'pkg-config' => :build
  depends_on 'gettext'
  depends_on 'intltool'
  depends_on 'gnome-common'
  depends_on 'gconf'
  depends_on 'libgnomecanvas'
  depends_on 'libffi'
  depends_on 'libbonobo'
  depends_on 'libgnome'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

end
