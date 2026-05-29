class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — single static binary, sub-millisecond render"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.0.6"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.0.6/powerliners-v0.0.6-aarch64-apple-darwin.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.0.6/powerliners-v0.0.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end
  end

  def install
  bin.install "powerliners"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/powerliners --version 2>&1", 0..2)
  end
end
