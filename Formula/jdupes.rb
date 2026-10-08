class Jdupes < Formula
  desc "Duplicate file finder and an enhanced fork of 'fdupes'"
  homepage "https://codeberg.org/jbruchon/jdupes"
  url "https://codeberg.org/jbruchon/jdupes/archive/v1.31.2.tar.gz"
  sha256 "a003ba9c57f2fbfc30f5af5a886b12423e0a0eba008429a48506d0c31a807c17"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://mybrew-bottles.s3.us-east-1.amazonaws.com/bottles/sequoia"
    sha256 cellar: :any, sequoia: "a392a95b02889b7cff7d483124fe0fea3d791dbf9e7c90a7dcace729da1c7db4"
  end

  depends_on "libjodycode"

  def install
    system "make", "ENABLE_DEDUPE=1"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    touch "a"
    touch "b"
    (testpath/"c").write("unique file")
    dupes = shell_output("#{bin}/jdupes --zero-match .").strip.split("\n").map { |f| File.basename(f) }.sort
    assert_equal ["a", "b"], dupes
  end
end
