class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.8"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.8/powerliners-v0.2.8-aarch64-apple-darwin.tar.gz"
    sha256 "741c41660870459d3943134b2d9cc809dc5ac105fd5709bd1e393f9fe14d7795"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.8/powerliners-v0.2.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9dfd1349709b198b7550e5abb244b591d35aff3fd34810cace89f7ff6f299a5d"
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
