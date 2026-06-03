class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.15/powerliners-v0.2.15-aarch64-apple-darwin.tar.gz"
      sha256 "eff12bdf92f747bd32d815e7b5d3f49c5a8d1f8fdf6767ffd37069433bb62939"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.15/powerliners-v0.2.15-x86_64-apple-darwin.tar.gz"
      sha256 "b8e841cabfb2f1894eadea7a5d254325ec2edfa8666d805ce5e917b4983aaa28"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.15/powerliners-v0.2.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2080d30b6e8beea57cb7a50612433d5df5984849d5837c9c93efd6c6814f29c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.15/powerliners-v0.2.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "87f1ca019f40fadcf73761ed49fc188b900b8050943feb3df8ee0bebb21ebe7a"
    end
  end

  def install
    bin.install "powerline"
    bin.install "powerline-daemon"
    bin.install "powerline-config"
    bin.install "powerline-render"
    bin.install "powerline-lint"
  end

  test do
    assert_match "ext is required", shell_output("#{bin}/powerline-render 2>&1", 2)
  end

  # Static musl tarballs also published at this release:
  #   powerliners-v0.2.15-x86_64-unknown-linux-musl.tar.gz  sha256: 393ab84fcab947dc814e673fc52e6eee319659944e84a10e0eb69086f973444b
  #   powerliners-v0.2.15-aarch64-unknown-linux-musl.tar.gz  sha256: de804521544f0f5d267390c1e545f50c0b01f58a7730cb83d6da37ddc5591e65

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.15
end
