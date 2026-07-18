class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.0.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.2/arb-v0.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "34426cc1e78fbb2a7ff3a81d71a93913f20006a7593044eaf9863281bda3c9a0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.2/arb-v0.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "392237b41e47e96a2fbf4150fcb914d3376b6deb26a2c214db89b0bf968e60fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.2/arb-v0.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85422160c62e9b766f1aa63fcafb96c37a38385ea20f60c79f7b303ee0e9f22f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.2/arb-v0.0.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91af7946a6cec1b78f358ef402b2487e310d45b06f1c9882c0b96c3090237781"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.0.2-x86_64-unknown-linux-musl.tar.gz  sha256: bdd5b9d3193c9c0d4f67560e5a30d67475c5c063e10adf373b60540da8fc98c8
  #   arb-v0.0.2-aarch64-unknown-linux-musl.tar.gz  sha256: 0f92c8d41a5f0a3bc9347a16b312c196b7221eca1629678c1813976cc3fa8a26
end
