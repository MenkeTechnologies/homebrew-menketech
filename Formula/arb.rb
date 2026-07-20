class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.0.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.8/arb-v0.0.8-aarch64-apple-darwin.tar.gz"
      sha256 "c086f85c9ef4d8a6592397adcd0ccebeca32c1b4a67ca054f8c9a568052bd791"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.8/arb-v0.0.8-x86_64-apple-darwin.tar.gz"
      sha256 "d6a856bfd6c21e7b99c4b2cfea72083da9f70e7c2a897e4bd5ef4cebf9feee65"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.8/arb-v0.0.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0bf1e3e5d68da555f1f7f30ac1611896dd04471351c8aef70dc0b418f5966d2e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.8/arb-v0.0.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c446e1c36bb8c947afd12d42ecc4ede766191b5a903a1bf6658cf01e8628342e"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.0.8-x86_64-unknown-linux-musl.tar.gz  sha256: 6be1cf5ff249bc3378aa4dd67b4c534bd759b256b08f6553f217ba7c6b20e37f
  #   arb-v0.0.8-aarch64-unknown-linux-musl.tar.gz  sha256: e5c1015f1b156e3eccc16ccdd76eb493efc6ef90f3e8d5c8ee932b128d3da8b2
end
