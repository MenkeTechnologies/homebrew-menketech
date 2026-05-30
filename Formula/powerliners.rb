class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.1"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.1/powerliners-v0.2.1-aarch64-apple-darwin.tar.gz"
    sha256 "89b4a0e0ae1d9193b5fe49b50cd80ee9786bbba2a73955d5608e5fa5983ab0b6"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.1/powerliners-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "23bfaac4d9a3c90c1ce34133b8826bafff64e3acf1b276b08a87bd6cc74687c0"
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
