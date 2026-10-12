class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.33"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.33/zshrs-v0.13.33-aarch64-apple-darwin.tar.gz"
      sha256 "615b055bfa536ee4f8f05a3f1e918fa873e3ab73bafa675a3035575321689da1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.33/zshrs-v0.13.33-x86_64-apple-darwin.tar.gz"
      sha256 "220de8dc3c7e654de6222d75c97826a03fb43025375d178f40de7bc1eee76ba2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.33/zshrs-v0.13.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "308b35f878e735d349282d7633a1c10fcd1adf4ec23e2d2e8dd5944fbd099931"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.33/zshrs-v0.13.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "07a2894e46bc79b1345746cd6b398d1bde5640b1a76ace51d7ea4e2062eb4a68"
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
  #   zshrs-v0.13.33-x86_64-unknown-linux-musl.tar.gz  sha256: 75a42fd4adf915a33b01484ca26cc1448bfe8616341edbc10d7290d18affa769
end
