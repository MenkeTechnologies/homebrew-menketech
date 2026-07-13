class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.17/powerliners-v0.2.17-aarch64-apple-darwin.tar.gz"
      sha256 "9c37035f8a414231d9481ac7331c62e45d710acb3c7adb4398864bf2f365a9ef"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.17/powerliners-v0.2.17-x86_64-apple-darwin.tar.gz"
      sha256 "eaf54b2e346df33e317b6660a23c9ac43c9ae861d5f20b58f10d73b6658f7f53"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.17/powerliners-v0.2.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c8e96337ac9aa5b25da895d9396ac34de5a22b4e62fd7cc4f52acc422a246b1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.17/powerliners-v0.2.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b6446b4afcf34b35626e16fd0186d651d6fcd75365cbcac9051a8d9049d3cd58"
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
  #   powerliners-v0.2.17-x86_64-unknown-linux-musl.tar.gz  sha256: d63fdd7b90bfaf0e5b0f7072e99bbee6ce35430544a86ce13ec0dc49f3e8e84b
  #   powerliners-v0.2.17-aarch64-unknown-linux-musl.tar.gz  sha256: 3cdae29bcc7dd31fdd8b22274e84db4838ec4a6b9ef3c8e5d302cc423c8e58c2

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.17
end
