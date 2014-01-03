require 'formula'

class Libgnomeui < Formula
  homepage ''
  url 'http://ftp.gnome.org/pub/gnome/sources/libgnomeui/2.24/libgnomeui-2.24.5.tar.gz'
  sha1 '404bd8b7a252362c322d5bda3d1ffe731b7e4645'

  depends_on 'pkg-config' => :build
  depends_on :x11 # if your formula requires any X11/XQuartz component
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
