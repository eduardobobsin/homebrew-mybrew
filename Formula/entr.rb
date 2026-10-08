class Entr < Formula
  desc "Run arbitrary commands when files change"
  homepage "https://eradman.com/entrproject/"
  url "https://eradman.com/entrproject/code/entr-5.9.tar.gz"
  sha256 "0ef2ce7db728167844a91904944cd07c7ccc6fd3041b849cad861224d106a845"
  license "ISC"
  head "https://github.com/eradman/entr.git", branch: "master"

  livecheck do
    url "https://eradman.com/entrproject/code/"
    regex(/href=.*?entr[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    root_url "https://mybrew-bottles.s3.us-east-1.amazonaws.com/bottles/sequoia"
    sha256 cellar: :any_skip_relocation, sequoia: "cdff312012143c7fa5837a3222dc9d3207e855a2be173c13d3101101d95bbe92"
  end

  deny_network_access!

  def install
    ENV["PREFIX"] = prefix
    ENV["MANPREFIX"] = man
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    touch testpath/"test.1"
    fork do
      sleep 2
      touch testpath/"test.2"
    end

    assert_equal "New File", pipe_output("#{bin}/entr -n -p -d echo 'New File'", testpath.to_s).strip
  end
end
