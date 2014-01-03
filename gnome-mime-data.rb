require 'formula'

class GnomeMimeData < Formula
  homepage ''
  url 'http://ftp.gnome.org/pub/gnome/sources/gnome-mime-data/2.18/gnome-mime-data-2.18.0.tar.gz'
  sha1 '84ff364d6cba72d638b0afea600e0151c42c88e8'

  depends_on :x11
  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'gettext' => :build

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

end
