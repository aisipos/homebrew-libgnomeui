require 'formula'

class Libbonoboui < Formula
  homepage ''
  url 'http://ftp.gnome.org/pub/GNOME/sources/libbonoboui/2.24/libbonoboui-2.24.5.tar.gz'
  sha256 '2792973184106abe805109ac9b5f750f4015347af077e22cf50001f3f51aa829'

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
