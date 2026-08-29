class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.9/arb-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "c96fcd916044b59c249858bfbd238645fb3e9aacda7b4e9684abc3d4428ce9b1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.9/arb-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "c712d0e02a163b8c03c242a3454f00aa9dcd437fb17dfd7b1f57b53c07451b89"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.9/arb-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b94133df4fdb4143576d65e3b4a33a138d18b58f4ae8e6ab6aa7ddaf0b08744"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.9/arb-v0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f9cca88732573f2ec7b8b1efa82f6bc74aedd0502a32623ed5bf41437596974"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.9-x86_64-unknown-linux-musl.tar.gz  sha256: d7b1b47318ee39db78b523785571d946ee19744e7e2880a80a9b4f45fd7cf010
  #   arb-v0.1.9-aarch64-unknown-linux-musl.tar.gz  sha256: 40958d2fe2fa619b82f9cee7dea7bc07cfb9301e69ef0ce6b8f9000084ca54c9
end
