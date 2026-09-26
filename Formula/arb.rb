class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.18/arb-v0.1.18-aarch64-apple-darwin.tar.gz"
      sha256 "fb0dedde03bc0522c53954bb6d0a273f7e9d6d9706751b403dab86dea32bac7b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.18/arb-v0.1.18-x86_64-apple-darwin.tar.gz"
      sha256 "4ce89730735d04156882b8b20631d66061cdd35b846f1b16110ea4378a9cc681"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.18/arb-v0.1.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d256c93d9821dd4366d3b204b4965b6ece5ecb4c060e3e66bc058ebc6e61387"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.18/arb-v0.1.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c8adedbb48bb9c3c80292a22ff3059d35e122fe099a8bf33fbb51bc2c14f429f"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.18-x86_64-unknown-linux-musl.tar.gz  sha256: 32f5a3d617bda49b7514ae67210decdbbdf21d85d1cb62ac751c24b4a436755b
  #   arb-v0.1.18-aarch64-unknown-linux-musl.tar.gz  sha256: 4bfbf271f0b4354a861ae59105a741b7e259a784e466bdfba9e36533a7088e5d
end
