class Zcolorizer < Formula
  desc "Real-time log colorizer (ccze/pygments port) with customizable regex rules"
  homepage "https://github.com/MenkeTechnologies/zcolorizer"
  license "MIT"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.1/zcolorizer-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "d7f2f0c8842165024d5d4221687a34167f94ae3dda5f42bf7d02f7065f7e1f6e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.1/zcolorizer-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "5bb97fafdf7066e5ea89b9c3ae1596f41fcfb94f9b7500317d32619b7e1c100e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.1/zcolorizer-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b4bb55cb6f606c1ae0ac1400772c79ce3bf32d00d794a2e9363c72d9ab0cba8c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.1/zcolorizer-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "274e095aa46ff9239602b2c5426457e57aa95ae0834b6455cfc9814e70d7af23"
    end
  end

  def install
    bin.install "zcolorizer"
  end

  test do
    assert_match "zcolorizer", shell_output("#{bin}/zcolorizer --version")
  end

  # Static musl tarballs also published at this release:
  #   zcolorizer-v0.2.1-x86_64-unknown-linux-musl.tar.gz  sha256: c6657fab8a2d93c99316c9054407eb810397ce68c8cd07e62287a360fbcb6a89
  #   zcolorizer-v0.2.1-aarch64-unknown-linux-musl.tar.gz  sha256: df93ab5fe487898824112a2b1d86718cc7fc608247a60e1ecce3c5387d12f4b6
end
