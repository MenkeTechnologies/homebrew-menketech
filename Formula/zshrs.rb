class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.37"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.37/zshrs-v0.13.37-aarch64-apple-darwin.tar.gz"
      sha256 "742aa628963d9770f01b1bc5eb80efec23b35b65c94257bfa4baa0b3886662b5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.37/zshrs-v0.13.37-x86_64-apple-darwin.tar.gz"
      sha256 "533c605c60ee8b3795e816fbffd2346ece3b07139d56e3f05b84843d3b947f99"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.37/zshrs-v0.13.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f310548c134f16b7e7ba64159080f3066b09108d571ebfcace71d4aa1b5b5ef"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.37/zshrs-v0.13.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d6c54bc64d675e815895b62ac32802620bf65f4103ea17182bff4b07fc38dc3"
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
  #   zshrs-v0.13.37-x86_64-unknown-linux-musl.tar.gz  sha256: 08eb53c2d33e8fdbabb06bd68c7d1d67c146f7dd822e8b6b442f442c03ddeff9
end
