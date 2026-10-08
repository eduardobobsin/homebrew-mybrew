class Mybrew < Formula
  desc "Install Homebrew formulae on Intel Macs, building missing bottles on demand"
  homepage "https://github.com/eduardobobsin/mybrew"
  url "https://github.com/eduardobobsin/mybrew/archive/refs/tags/v0.7.8.tar.gz"
  sha256 "0d5c1c1b212ca0a656879cb74155f056c956dda2f067365baa01587f6a6e174f"
  license "MIT"

  def install
    libexec.install "bin", "scripts"
    bin.write_exec_script libexec/"bin/mybrew"
  end

  test do
    assert_match "mybrew install", shell_output("#{bin}/mybrew --help")
  end
end
