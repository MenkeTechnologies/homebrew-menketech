class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.23"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.23/arb-v0.1.23-aarch64-apple-darwin.tar.gz"
      sha256 "a8ab78b549012986f89b68eea64c1b520fe9e6b96d1f3c1309d6d0b4cc37d238"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.23/arb-v0.1.23-x86_64-apple-darwin.tar.gz"
      sha256 "45b327664d81f2b807be602c1b81eb3b8438b14703bd7266b0b5920f1c99d574"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.23/arb-v0.1.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da9101faf6d0efe74faecbc3d94a9b55ca1bf9d7e57283b18ef97e93437ba9c7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.23/arb-v0.1.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aefe584aa02d4df18e69b81fba7fc880a23c84e4b7f6266d5139561056ad85ce"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.23-x86_64-unknown-linux-musl.tar.gz  sha256: b4d2ed55d8fe6ed5c2d4ede5b7c54cf2dd11d648645e61493c6e493d5aeebca1
  #   arb-v0.1.23-aarch64-unknown-linux-musl.tar.gz  sha256: 90ac922b149312c781e4ab9ea25ebf0dd3df5a3482617c72da80e784f9d57364
end
