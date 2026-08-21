class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.6/arb-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "384c73577c60833696ad3de2d6d059ac89e01049cb8b3b0af3611344e196db05"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.6/arb-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "198b39d3e0238f33a815c3db49177a753dba06eca55022b158c34ba57854771d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.6/arb-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6634c8f820b597d4c21efcbbce0970da225d4f00f6f217b6bc483f29ac85322e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.6/arb-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18e9cf7a085d4d5b2510580c47b550db974cf24d77f6bb7f673e0ec4a3a184e2"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.6-x86_64-unknown-linux-musl.tar.gz  sha256: 5382012653bce917d07b106ffff912cfa1b8bbedbf8f48f2dc507dae64d4b019
  #   arb-v0.1.6-aarch64-unknown-linux-musl.tar.gz  sha256: e959bfc6ed1102ce8018b4ad5a40b28a2b3857475c70b2e598bbf1d934cdabca
end
