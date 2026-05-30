class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.2"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.2/powerliners-v0.2.2-aarch64-apple-darwin.tar.gz"
    sha256 "7176edf6c1fd59898ef4bd4c71258a110d56d472607b9ef5062350b273d26756"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.2/powerliners-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "be3b9db9428b153e993bf5c16721577b1f9393be6956f4157c4567c19a9b2cb6"
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
