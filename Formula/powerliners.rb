class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.16/powerliners-v0.2.16-aarch64-apple-darwin.tar.gz"
      sha256 "5f53876a8472769044679e548da652b50be1221433086bfc955cb265f0eb8247"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.16/powerliners-v0.2.16-x86_64-apple-darwin.tar.gz"
      sha256 "58a692059c09f0a349389b679c6029335ba77b64e07b1b5fca8ba0258206879d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.16/powerliners-v0.2.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "846f9dcbbb7688985c1b3e91997296b3a736f5ac7baa7c9d596cbecf70d68b0d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.16/powerliners-v0.2.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d7bcbcb57a0566a68e7e5d976bc357c6f596aa82ef2ee5ec15fec4bad3805617"
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
  #   powerliners-v0.2.16-x86_64-unknown-linux-musl.tar.gz  sha256: 33bd8296f60796578eb3cd7eae48176275e79bba77fb1faed91a5561971716dc
  #   powerliners-v0.2.16-aarch64-unknown-linux-musl.tar.gz  sha256: d8c0a94d7fe9828ae87da24bd726dec32ea6e3390cf9ed1a2bd06eed1c8d5e07

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.16
end
