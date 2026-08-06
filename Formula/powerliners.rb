class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.20"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.20/powerliners-v0.2.20-aarch64-apple-darwin.tar.gz"
      sha256 "bd7156abdf2a98fea7fc696f0bb6ad2a620af41369df78efc2ff6c684afcf439"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.20/powerliners-v0.2.20-x86_64-apple-darwin.tar.gz"
      sha256 "68d2d02be377c0a314acab166e9c54f8cb537f06d7a31c87bf864fd12b702db4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.20/powerliners-v0.2.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "004663b8c49ac16dcd36c28930e24300ec029d05175ba6c5182a643d97e599e8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.20/powerliners-v0.2.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "05133d53df73bfd49fc7df35ff0d95941733fb561624d9b59be9cdd8e7be66bb"
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
  #   powerliners-v0.2.20-x86_64-unknown-linux-musl.tar.gz  sha256: 50639737389a03a8358708bf9d89a870ef371a8da10a24ade7964419c1122a10
  #   powerliners-v0.2.20-aarch64-unknown-linux-musl.tar.gz  sha256: 44b7c81e1df33995d19c3d68dc7e3de52443255b78c43e6520ab71493cd05a88

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.20
end
