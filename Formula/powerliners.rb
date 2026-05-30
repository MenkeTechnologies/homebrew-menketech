class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.0"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.0/powerliners-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "b91743cc3d3528d7a29452b790722786cb52f52bd38426fe578c3527042c3d8a"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.0/powerliners-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2016ca54243c5baed5a7208d31f20b0948c3942911763f51ac3be7aa9aa5e609"
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
