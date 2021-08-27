require 'formula'

class GnomeMimeData < Formula
  homepage ''
  url 'http://ftp.gnome.org/pub/gnome/sources/gnome-mime-data/2.18/gnome-mime-data-2.18.0.tar.gz'
  sha256 '86638a38d5e1d05687ee36ddfecab106dc127b120194a55aca0d3ed289a21037'

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
