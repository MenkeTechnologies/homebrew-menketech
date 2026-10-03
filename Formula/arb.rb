class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.21/arb-v0.1.21-aarch64-apple-darwin.tar.gz"
      sha256 "7480bf3cffc0de63cf521b497ec382021d0df9e21fc3be9a3be09009dfb52973"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.21/arb-v0.1.21-x86_64-apple-darwin.tar.gz"
      sha256 "707655542e8f94152b3fa04db0e2a0f2b2755f6fce25e928ac932d276e599867"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.21/arb-v0.1.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e5351e390c21be8360e9c090eaee8f300268c08c08e7cf781dbd2552c8fdf87"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.21/arb-v0.1.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e8e590a2f1721c3f15f5ab3db715dc62e107972514f475cf726015e50f9e46ec"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.21-x86_64-unknown-linux-musl.tar.gz  sha256: 3c2955011ae55091bebe7c3e8dba3a990f9a2ab5ba7dbd0bc3190fee152242f8
  #   arb-v0.1.21-aarch64-unknown-linux-musl.tar.gz  sha256: 1a7ded9c856d0da439eebab2daab4a7103fb10ffa32c72058e4fc5f3c0ac8071
end
