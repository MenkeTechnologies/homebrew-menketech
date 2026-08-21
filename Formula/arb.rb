class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.7/arb-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "93b5830fe87b99d881ee5e49c9007a388dc6316b596e5dcb4160aaabffadb468"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.7/arb-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "ed536ee018f732a02b79503e51ee3a556360c576510740ac6766a4809900bf86"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.7/arb-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac508bf021d93d3be4c9694d331f77e59ee94202a440e45bb13ae91ce72d4c6d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.7/arb-v0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f3189b2cdb687869cbf04cf98cc773ae69c8db900eb95377700c41fcbe6dbb8"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.7-x86_64-unknown-linux-musl.tar.gz  sha256: c56b5d5d60b5bc9d2d9501c09c0675492a1e90fbcfe8401f522251844c6b2877
  #   arb-v0.1.7-aarch64-unknown-linux-musl.tar.gz  sha256: ac24407b5b833e279f3ba4591f39213c36df0286532d4707bffe25a1f7e7998c
end
