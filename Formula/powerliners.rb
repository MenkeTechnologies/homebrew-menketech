class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.1.1"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.1.1/powerliners-v0.1.1-aarch64-apple-darwin.tar.gz"
    sha256 "134d2e6e20cc88c5f5dccd15a56b59702693f70bd2895f84122de90f2ce54dd0"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.1.1/powerliners-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "59122c0c4f6f96c43e30c4b3ad2f5c2598871d15a8859ec368a27f2420498367"
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
end
