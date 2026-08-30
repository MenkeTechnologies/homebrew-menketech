class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.47"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.47/zshrs-v0.12.47-aarch64-apple-darwin.tar.gz"
      sha256 "d6caddfa41b9d0a555edf41ad96eda15c6439b256a3d792034733b8dfa62995e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.47/zshrs-v0.12.47-x86_64-apple-darwin.tar.gz"
      sha256 "87985e9240b251d45527260b4ab82fa1d1cd0023d840504492810da4adb3d978"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.47/zshrs-v0.12.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8e840c6b5549313cbf53f0093b475d29dbe17e6915365086d73ec23d33393ad"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.47/zshrs-v0.12.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb76a3f243a88e3fb897de6f9d5098ed03933e9b1bd40d5b067d6cb8f0353789"
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
  #   zshrs-v0.12.47-x86_64-unknown-linux-musl.tar.gz  sha256: 6690dfa0af0be13dde3bcc34d87f84891d4917a667783037d48e23c755f12bb6
  #   zshrs-v0.12.47-aarch64-unknown-linux-musl.tar.gz  sha256: 349b6687b46da9d939413d25f77445ef4fe00b4d5ce89624114f7bbd6fdc0081
end
