class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.11/powerliners-v0.2.11-aarch64-apple-darwin.tar.gz"
      sha256 "cbe1fe934135c412fc85697ffd13e55192d69696e215e4a9d9b56d13754095f1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.11/powerliners-v0.2.11-x86_64-apple-darwin.tar.gz"
      sha256 "5973a432c52ab5c6eb579963774f3bc34ab96c67697a2fb5ffc950d62221ec5d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.11/powerliners-v0.2.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3172b757234151c17b43390b8f260334229f924f0cf536d808d746b8b78bf85d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.11/powerliners-v0.2.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45f963773ec8e4475c884cd471f621859a34bb53c2e7fe4d6d224c4aabd8c132"
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
  #   powerliners-v0.2.11-x86_64-unknown-linux-musl.tar.gz  sha256: 9ae865689c4485db21207ddcc39a2fd04194d360bc33db4a2c84c14a77bf9a13
  #   powerliners-v0.2.11-aarch64-unknown-linux-musl.tar.gz  sha256: 95423d066c348aaa89433dd59a9558175302902e024ba400415c4c5f8fd8590e

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.11
end
