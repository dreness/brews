# For reasons unknown, the Homebrew project didn't want this one when
# Lars submitted it.  Their priviledge, but I find it useful.

# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Xplot < Formula
  desc "xplot"
  homepage "http://www.xplot.org"
  url "http://www.xplot.org/xplot/xplot-0.90.7.1.tar.gz"
  sha256 "01ceac45540f2d01e6ffe368cc0e950f4bb7fe1d235efde5349a09199e662240"
  depends_on "cmake" => :build
  depends_on "autoconf" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "autoconf ; autoupdate"
    system "./configure", "--disable-debug",
                          "--disable-silent-rules",
                          "--x-includes=/opt/X11/include",
                          "--x-libraries=/opt/X11/lib",
                          "--prefix=#{prefix}"
    system "make"
    system "make install" # if this fails, try separate make/make install steps
  end
end
