require 'formula'

class Mupen64plusVideoGlide64mk2 < Formula
  homepage 'http://code.google.com/p/mupen64plus'
  url 'https://bitbucket.org/richard42/mupen64plus-video-glide64mk2/downloads/mupen64plus-video-glide64mk2-src-2.0.tar.gz'
  sha1 '4ee837d711fb5698d9cdbb7eb0204e8fb86d110e'

  depends_on 'pkg-config' => :build
  depends_on :libpng
  depends_on 'sdl'
  depends_on 'boost'
  depends_on 'mupen64plus'

  def install
    cd "projects/unix" do
      system "make", "all", "PREFIX=#{prefix}", "C_INCLUDE_PATH=/usr/local/include", "CPLUS_INCLUDE_PATH=/usr/local/include", "V=1"
      cp "mupen64plus-video-glide64mk2.dylib", "/usr/local/lib/mupen64plus/"
    end

    cp "data/Glide64mk2.ini", "/usr/local/share/mupen64plus/"
  end
end
