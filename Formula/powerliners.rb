class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.7"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.7/powerliners-v0.2.7-aarch64-apple-darwin.tar.gz"
    sha256 "840cf8c4b53e56475ac22525f7e20a220d0dcf8df1765cbda0cf9ee60a7a0834"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.7/powerliners-v0.2.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0c181b445efa9d9d57133edf88509f78924605ebaaa344d495849223ec429917"
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
