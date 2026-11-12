class Mybrew < Formula
  desc "Install Homebrew formulae on Intel Macs, building missing bottles on demand"
  homepage "https://github.com/eduardobobsin/mybrew"
  url "https://github.com/eduardobobsin/mybrew/archive/refs/tags/v0.8.6.tar.gz"
  sha256 "e307e7566fb4d47ccdc7ce22dba5178f17fffb6507fc8be81c9b4917b9a5fd56"
  license "MIT"

  def install
    libexec.install "bin", "scripts"
    bin.write_exec_script libexec/"bin/mybrew"
  end

  test do
    assert_match "mybrew install", shell_output("#{bin}/mybrew --help")
  end
end
