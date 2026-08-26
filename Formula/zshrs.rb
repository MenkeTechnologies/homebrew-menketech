class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.40"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.40/zshrs-v0.12.40-aarch64-apple-darwin.tar.gz"
      sha256 "dd04c2198de9ebc713b2fa133f9dc18ded4003fc0862f49717487dbda8fb1947"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.40/zshrs-v0.12.40-x86_64-apple-darwin.tar.gz"
      sha256 "98a6ad23d8cc47d3660d7189f0546b8f0f99dbd22a94923080e74b7c08cb95c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.40/zshrs-v0.12.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2a941364fff106ac2a9817816a9a008c878e62652e90bb3a90110f584dd7573"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.40/zshrs-v0.12.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9937ca06f7fb50fd09c2b2608c04ba404799f11033176a0feded30c91e913736"
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
