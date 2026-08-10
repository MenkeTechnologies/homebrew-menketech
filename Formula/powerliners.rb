class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.21/powerliners-v0.2.21-aarch64-apple-darwin.tar.gz"
      sha256 "355a03731e4a82103702ba0bd82fc775c789fd44c3a64aa0da9d83990cdad99e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.21/powerliners-v0.2.21-x86_64-apple-darwin.tar.gz"
      sha256 "a1c0372b5ad1cf3dd8472f3bb4470ac8f9b30dfa373bff5f02748fef5d51f166"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.21/powerliners-v0.2.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fee09fae59730297b371ac9bd155018bfcd099cc53a85918386cf42731a3a1f9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.21/powerliners-v0.2.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15ed9a84e8b688f84f760d3628f3f5ddb774ed3e2e6a2948293ef25bc24c9313"
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

  # Static musl tarballs also published at this release:
  #   powerliners-v0.2.21-x86_64-unknown-linux-musl.tar.gz  sha256: 88b74d41e7da1bcab1173a50dfb0498e81f495884c3b141f339e3ac588cf4df9
  #   powerliners-v0.2.21-aarch64-unknown-linux-musl.tar.gz  sha256: 5d7da6022191cbc7f090047b20d1872466393e4ecbfdabca91909a191255b67b

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.21
end
