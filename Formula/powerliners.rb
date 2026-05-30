class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.3"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.3/powerliners-v0.2.3-aarch64-apple-darwin.tar.gz"
    sha256 "2cfb5546e2632b755a6501c862fa38ff415794480f0daf09b6bc1f2acecb9460"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.3/powerliners-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "56b2a961c9a5c205503f9924b37240493396cc955379319df0b553ed99f1cc0b"
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
