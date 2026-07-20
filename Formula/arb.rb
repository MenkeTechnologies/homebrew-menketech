class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.0.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.7/arb-v0.0.7-aarch64-apple-darwin.tar.gz"
      sha256 "adfe40481d43cc43bab0bcee09cc6364945575bc748468582400746d057d097c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.7/arb-v0.0.7-x86_64-apple-darwin.tar.gz"
      sha256 "9aec10ad7ca90e9c02dcd86f5fe93431c9f78325d970fd8e5a4cc399b71a0f17"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.7/arb-v0.0.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "05b42b471664daa0c41c8ef9e0e6681fb77a8a0aecb3350e33080abf580ec738"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.7/arb-v0.0.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6d4a37a372988fe85057b885b475e77ede6abce408ce41a16d2f5fa22a77688"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.0.7-x86_64-unknown-linux-musl.tar.gz  sha256: add06ebed8bbf80da39a8fd2cc8fcd618e1e217848525e96c1386b352d5e020d
  #   arb-v0.0.7-aarch64-unknown-linux-musl.tar.gz  sha256: 9a3dfb5bb2e22549dc136ec0afe31af087636144f7e038f16d136ad21ed5e411
end
