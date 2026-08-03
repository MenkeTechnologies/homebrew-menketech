class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.4/arb-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "0b1e62ba2b5a1649bed1f5e40f27f61d3826cfd2c84aa6da0ff20d53e148a35e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.4/arb-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "eec9814d0eb25e4f4e7a8d8077e47750a8560ad375ab46e05e4bb53a53e983f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.4/arb-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f783177e553f293bd70210fba9729eb87733360e3cf6774d07e64109e6ae81f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.4/arb-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "675d45fd3e76c971fa0d89191e9311a1739c45974856d80b5e5a94a898600238"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.4-x86_64-unknown-linux-musl.tar.gz  sha256: 7bb746b9ffb1a3dab3be5dbfc1cfee696a8b8550ffc664b6617a0e232dec04bd
  #   arb-v0.1.4-aarch64-unknown-linux-musl.tar.gz  sha256: a3972bdf920b25f80f4cc2e9d2ab93cdac482f2e7a78ba8aa891894014c312f6
end
