class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.22"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.22/zshrs-v0.12.22-aarch64-apple-darwin.tar.gz"
      sha256 "0cffa2fe30093c7816301fec4eddae85dc7c2f1daefd7866d9a44489b644899e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.22/zshrs-v0.12.22-x86_64-apple-darwin.tar.gz"
      sha256 "d95b170f5e3b4321b52f13f576fe22fa6af9936cb8c646ab51b85662f3dac46b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.22/zshrs-v0.12.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a43e310d2b9156612455b9dbda36893243926bfecadd02f13b1a4dcbef8bde0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.22/zshrs-v0.12.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "159c843ef97566dbc21c31c67e7b5da3c707800dc7ba6e4587615839c2bb704d"
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
