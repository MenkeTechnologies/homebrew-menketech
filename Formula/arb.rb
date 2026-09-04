class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.16/arb-v0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "2c5c2d7230158eaef6dcc34fdc76235480df7ce6b3d6ed2832f5697fc3f9632b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.16/arb-v0.1.16-x86_64-apple-darwin.tar.gz"
      sha256 "f1d645174c2cec9e009b321c3a86d371b51f108cc4fdd8103366992659aef6ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.16/arb-v0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f8d981e16dc0dc0fb479ade8fddf872d3575e1fadb23167ab4305c488398339"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.16/arb-v0.1.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "77f9f42fc6668f1ff58134cd813a4ebba029af1fc067468d3afd47303fd41510"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.16-x86_64-unknown-linux-musl.tar.gz  sha256: fafb87daa349bd03e8667a3cf2f0a23e532c908ab8c63e5d59ea369bf7c12560
  #   arb-v0.1.16-aarch64-unknown-linux-musl.tar.gz  sha256: 671a0cc704bcfde857ff8833051644fddd6c63775013ea334c8417035e90381d
end
