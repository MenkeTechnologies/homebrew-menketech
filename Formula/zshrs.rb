class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.45"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.45/zshrs-v0.12.45-aarch64-apple-darwin.tar.gz"
      sha256 "0842f82e2663e3398b506b1dfc4ea06b82239aca2902d3e8db27ffde8686bf1e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.45/zshrs-v0.12.45-x86_64-apple-darwin.tar.gz"
      sha256 "3c61fd6f58d8d49384008cdfa244861718d03ef57accf6acb5d1611c398f6a4b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.45/zshrs-v0.12.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e2aecda510ae39110724875397afab888e1a8b291808f8743f2e1ca6e67e2fc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.45/zshrs-v0.12.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da84111b77764c40bf7d89ccd3bede4b2812550eba2338ffb2fff734392774c4"
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
  #   zshrs-v0.12.45-x86_64-unknown-linux-musl.tar.gz  sha256: 4e0b14405d7fdd0713f06ee594155e9b434dd8eb32adba8f50b6c9501935187c
  #   zshrs-v0.12.45-aarch64-unknown-linux-musl.tar.gz  sha256: fa0c64c9778b6073f65b0b4258984743c87f8a1d161a7b4427b662f6903fabe0
end
