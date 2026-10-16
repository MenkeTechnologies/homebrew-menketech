class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.47"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.47/zshrs-v0.13.47-aarch64-apple-darwin.tar.gz"
      sha256 "b73424bdaa1235e70462bd3b153d1a0cbda1e051e3bc2a3492445385d5747730"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.47/zshrs-v0.13.47-x86_64-apple-darwin.tar.gz"
      sha256 "e1019c1e43fbb7671374de20c508003674ddc1f6da1c72942dcf479eb7841bcd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.47/zshrs-v0.13.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9eefd7bec71834aef38c7287378972b9ae5c82b51a3bbf48f400e57b8fca410a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.47/zshrs-v0.13.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d096d6ceb486b9d80e3d83b9182dfa9999b18466fae4bcd92147d7ae0dc7a114"
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
  #   zshrs-v0.13.47-x86_64-unknown-linux-musl.tar.gz  sha256: 1d41277be38610d6c766911022f16443a65cead480901d157165031b87e9e614
end
