class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.0.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.5/arb-v0.0.5-aarch64-apple-darwin.tar.gz"
      sha256 "f4ff2a74b381e97deb0c0033e54ff5b7951fdaca8fce109adcc4faf4285eb63f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.5/arb-v0.0.5-x86_64-apple-darwin.tar.gz"
      sha256 "302c842731f61a2eb16bae2ee895233deeb8a1b18f09ba2342f758909b56c5f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.5/arb-v0.0.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "abd41eb3635636d7083942e9646c296c8a1a484e6c05ec6c0d57c1b261e0dea8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.5/arb-v0.0.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "efcbf525fdd8a6c4f092d0fe970fa8ff0390919c28749d7fabefe3c9eb8b2ecf"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.0.5-x86_64-unknown-linux-musl.tar.gz  sha256: b8ab036aefde24372a01e0180d710b71a30f8a38ea58cb07147c6ad8522cd2e0
  #   arb-v0.0.5-aarch64-unknown-linux-musl.tar.gz  sha256: c8f7218827d01dab841f6e5d507a3ecd18b502762fcb41936494da323e422f69
end
