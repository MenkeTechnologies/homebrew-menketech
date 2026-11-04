class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.60"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.60/zshrs-v0.13.60-aarch64-apple-darwin.tar.gz"
      sha256 "071659d606a04b9c6635bf63a20abc9a3991d9253223290a0509806f31913f39"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.60/zshrs-v0.13.60-x86_64-apple-darwin.tar.gz"
      sha256 "e2106f9f4d47b32ca35b3c7a171cdc1f9dbb8055da3d106653cf641b6c9ba411"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.60/zshrs-v0.13.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce7d2beaed5b4374fe9f0fba6d4511d48124ffcd9cd120e20d5982d2689e457e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.60/zshrs-v0.13.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22e94bbbf3c3b6f8a09227437f0ddb4eac8780de29967810ee8ff71ef0b51dd1"
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
  #   zshrs-v0.13.60-x86_64-unknown-linux-musl.tar.gz  sha256: 5722fa1e8cb547e2fd6513aa0d8aabaa8b4a64d760052d3363295a33cf074011
end
