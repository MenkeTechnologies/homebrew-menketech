class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.8/arb-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "1691cd697dde296d9ba6e5d57a26df4da7ad4fb3912591f360c3334390f01116"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.8/arb-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "6461ea982d70f3b40e9f8abf37cf37c84d60301c2c8263a4763e9bdb59d8a0dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.8/arb-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19dea3c19191650eec044a433728ff3e92304bd1077151bf66e3c9e3b2db5479"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.8/arb-v0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc7d3e1d259adcee6e7156eb0913ded82e109c881d477c61cfc9d738836d430b"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.8-x86_64-unknown-linux-musl.tar.gz  sha256: b33eca9cbd054f7a0bda2b4a676ef4b43a3b19d862d7caa9a0032e4bc9002104
  #   arb-v0.1.8-aarch64-unknown-linux-musl.tar.gz  sha256: 2dadefbd84bf6c8e3173cd9318c9840b21d74d575eb69c1a31b7dd40f8c3cd43
end
