class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.18/powerliners-v0.2.18-aarch64-apple-darwin.tar.gz"
      sha256 "855acf8b6b9e5d43a042595dcc1c3de9f878a127e42a83e4f8787230b708f8f3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.18/powerliners-v0.2.18-x86_64-apple-darwin.tar.gz"
      sha256 "f9b96399f8e12a9e3aa23bff964a3e27fefa304f90416d70d6df33c88badb70c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.18/powerliners-v0.2.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f874de4556a2370a322bb637c40dc7db48f8783acca2c4f769d0499e7d081ebb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.18/powerliners-v0.2.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0cb90b4c3cb94b7d14444a657f0f1ddf5b41eacc99b667bfb0fc9b5c5e8d4ae9"
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
  #   powerliners-v0.2.18-x86_64-unknown-linux-musl.tar.gz  sha256: 0e72cd96ae3734e98377a0e0d79fa467445f00f429c2ccf660824f35e4fc8e7d
  #   powerliners-v0.2.18-aarch64-unknown-linux-musl.tar.gz  sha256: cb67f86f96808534d1aa65560b0d97be65cd14e48fd65b8a475354e996a52cf1

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.18
end
