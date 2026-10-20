class Mybrew < Formula
  desc "Install Homebrew formulae on Intel Macs, building missing bottles on demand"
  homepage "https://github.com/eduardobobsin/mybrew"
  url "https://github.com/eduardobobsin/mybrew/archive/refs/tags/v0.8.3.tar.gz"
  sha256 "99c73e71a161c87fe46e915bdd6ecb8d58666b554cf0ad28a417d85fe1d159a0"
  license "MIT"

  def install
    libexec.install "bin", "scripts"
    bin.write_exec_script libexec/"bin/mybrew"
  end

  test do
    assert_match "mybrew install", shell_output("#{bin}/mybrew --help")
  end
end
