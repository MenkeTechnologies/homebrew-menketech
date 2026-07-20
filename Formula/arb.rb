class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.0.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.9/arb-v0.0.9-aarch64-apple-darwin.tar.gz"
      sha256 "b5d73e2219cce4a30b7dc3a543a748d991ae3391e59d8e2be5cbbec1a75c5337"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.9/arb-v0.0.9-x86_64-apple-darwin.tar.gz"
      sha256 "5dc10095b9513cbb48275cf6b2a3d955a4a36ef306dc8f00a5871e50239ec914"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.9/arb-v0.0.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "675bb1528d6d85c516e705bd111ea24bb79e66cd1525ad857512dcc63dea7dd0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.9/arb-v0.0.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa34718fa6aaa9109ee242d99028d644799ab05bf93e9d588114ebaa4c6cf70b"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.0.9-x86_64-unknown-linux-musl.tar.gz  sha256: f96c7e2099df2f4a119b8d76ac51eacf1d3e2f95cdd1caea2ef7a4e9dbb7cb89
  #   arb-v0.0.9-aarch64-unknown-linux-musl.tar.gz  sha256: 7de7305765b805d0d107524f537976cf7f75930e0cb7fd34a4a46d618a8a4e33
end
