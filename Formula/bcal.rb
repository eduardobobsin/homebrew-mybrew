class Bcal < Formula
  desc "Storage conversion and expression calculator"
  homepage "https://github.com/jarun/bcal"
  url "https://github.com/jarun/bcal/archive/refs/tags/v2.6.tar.gz"
  sha256 "bac318405221f2f88d374683549338515b070ca7491497eda2ac9c17bcbb0458"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://mybrew-bottles.s3.us-east-1.amazonaws.com/bottles/sequoia"
    sha256 cellar: :any_skip_relocation, sequoia: "cf8fde1b47ff2076e88d391011c2cb978996cd223a9c331dc3209e695dc6f607"
  end

  on_linux do
    depends_on "readline"
  end

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "9333353817", shell_output("#{bin}/bcal '56 gb / 6 + 4kib * 5 + 4 B'")
  end
end
