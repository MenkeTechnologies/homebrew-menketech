class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.4"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.4/powerliners-v0.2.4-aarch64-apple-darwin.tar.gz"
    sha256 "f96a920a8b958acef5d27c7572938c76ff1454c2ab327c3a5b40378922bd4060"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.4/powerliners-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "80799b163feb6a13171157f826a055afb434fd52968adb422899b978c94424bf"
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
