class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.7/zshrs-v0.13.7-aarch64-apple-darwin.tar.gz"
      sha256 "b9038e899ef8f2114816674e3f22fc207bc321a94400b34da183eef4c44d8a03"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.7/zshrs-v0.13.7-x86_64-apple-darwin.tar.gz"
      sha256 "cacb45df2da3bb1b27feb564db7cc6e1d8252c2055e2c4542e519b95f9173ba2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.7/zshrs-v0.13.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9cb2f049decb7ba75711eea4d3a0623dbd8af4baf2d10f49ade8bdeb53f87387"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.7/zshrs-v0.13.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85e361f1a4395d8d226fa17a05e1683a95ff070fffe687fe588e0723d5fcec17"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.13.7-x86_64-unknown-linux-musl.tar.gz  sha256: 04b60f396b18d0e46c61cc432eba0530e9a5154cd97386d06ce641d31ec484c4
  #   zshrs-v0.13.7-aarch64-unknown-linux-musl.tar.gz  sha256: d62c148a2f4390337c4a9d27d98c094d226459e63f9f2df22e4501992159f6da
end
