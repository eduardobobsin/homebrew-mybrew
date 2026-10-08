class Mybrew < Formula
  desc "Install Homebrew formulae on Intel Macs, building missing bottles on demand"
  homepage "https://github.com/eduardobobsin/mybrew"
  url "https://github.com/eduardobobsin/mybrew/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "e30b23a54c7d127e99b757d5af6640b0143e66ba7fae26709bf2bb762b71e3d9"
  license "MIT"

  def install
    libexec.install "bin", "scripts"
    bin.write_exec_script libexec/"bin/mybrew"
  end

  test do
    assert_match "mybrew install", shell_output("#{bin}/mybrew --help")
  end
end
