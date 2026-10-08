class Mybrew < Formula
  desc "Install Homebrew formulae on Intel Macs, building missing bottles on demand"
  homepage "https://github.com/eduardobobsin/mybrew"
  url "https://github.com/eduardobobsin/mybrew/archive/refs/tags/v0.7.5.tar.gz"
  sha256 "bcfc63ed1e7a6fcdae3428da273e2f22ead22dd30b1800827e860f4f09321887"
  license "MIT"

  def install
    libexec.install "bin", "scripts"
    bin.write_exec_script libexec/"bin/mybrew"
  end

  test do
    assert_match "mybrew install", shell_output("#{bin}/mybrew --help")
  end
end
