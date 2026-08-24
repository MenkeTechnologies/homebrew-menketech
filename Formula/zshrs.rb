class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.38"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.38/zshrs-v0.12.38-aarch64-apple-darwin.tar.gz"
      sha256 "d1b70e4d2d2da83229a42885383fb21ead045604856b7b77771e1afe1b462e5e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.38/zshrs-v0.12.38-x86_64-apple-darwin.tar.gz"
      sha256 "a24c61839b4733e35e64f0f2078bbceca48f1f5703c1c20c58621d25b2abc2dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.38/zshrs-v0.12.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "679c696e52e5b5404af84206a7daa03910e5962f0658ddea0f1dc97587f1a12f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.38/zshrs-v0.12.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4bda480b1f2240ace65fd3e2a6844b87336f490697ed2a777b935f45b1d3fc60"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end
end
