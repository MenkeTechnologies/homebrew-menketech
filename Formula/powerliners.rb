class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.13/powerliners-v0.2.13-aarch64-apple-darwin.tar.gz"
      sha256 "b15d7a10e690228db2336f97c368a8ccbeeafd257d7409acefffeba00dfaf196"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.13/powerliners-v0.2.13-x86_64-apple-darwin.tar.gz"
      sha256 "693b6de4c99cee8983099e4c53bc5b1691a56f9bae1a36bb43c701be4ad0be99"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.13/powerliners-v0.2.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b1d5c288a9c6c19449a3a876fb532f3ef456158dc79a7398beb1efe02238aac"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.13/powerliners-v0.2.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c81f93f1b72e00eb79d505a3508532c60416a6f93f53f8ca485a0407f99c8bd"
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
  #   powerliners-v0.2.13-x86_64-unknown-linux-musl.tar.gz  sha256: 24dbb4f222345739ea075bd37ab0cfd883eb75b882eb2f8fa23eea24d826da14
  #   powerliners-v0.2.13-aarch64-unknown-linux-musl.tar.gz  sha256: f7aa93691f66cef79cc84daf8438d115cb12a50c43e12c8d19a9cdd28d5af4b8

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.13
end
