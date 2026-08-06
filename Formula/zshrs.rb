class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.32"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.32/zshrs-v0.12.32-aarch64-apple-darwin.tar.gz"
      sha256 "78e5cfd5cfdd6b252f6a1c47eadee2c30086f002f51e024bfa7bc24d6d3ba07f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.32/zshrs-v0.12.32-x86_64-apple-darwin.tar.gz"
      sha256 "0053a886c0b52dc01b3d2e90453f73919f0401d39fbd97fff20416e4a7513862"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.32/zshrs-v0.12.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bea1b3f2401c053a7c6a819a62604f19193556551fb0a8c6f65a821a79957d1c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.32/zshrs-v0.12.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b046c009ac069ef21a15e811a8ef42aabd7a2d4e594d7110b6a697e71310dee"
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
