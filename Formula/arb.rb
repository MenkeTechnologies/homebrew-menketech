class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.22"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.22/arb-v0.1.22-aarch64-apple-darwin.tar.gz"
      sha256 "196b1606ee2fd73eb6f871a7add509a5ed26c12e7501cbd5bb5a5b6f356f45ae"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.22/arb-v0.1.22-x86_64-apple-darwin.tar.gz"
      sha256 "3307fbad07b2a364d8b34545db5df83bba742327e3d4e694e31733af33ae0018"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.22/arb-v0.1.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69d885a7010a0dcd076c1d5a16b193b4f181277d7669bcaed3e4e4fd87c0972b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.22/arb-v0.1.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93b12a526d3f34dcac31689e89352f268035bf16ec422674b7c2532b59e44f08"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.22-x86_64-unknown-linux-musl.tar.gz  sha256: 50b2dda095c3051fd3b3a99f4e440303a06648758b2200536521a25eae983e30
  #   arb-v0.1.22-aarch64-unknown-linux-musl.tar.gz  sha256: f4aa97d8aa21f1096c9ae1886fad720c8158de2f98f927a3f4a08eaa75cc67b1
end
