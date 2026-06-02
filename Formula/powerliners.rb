class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.14/powerliners-v0.2.14-aarch64-apple-darwin.tar.gz"
      sha256 "0dcea7fca4e4bea4e6b8391d51ff3906796906d8e591cf85e01de2ced5cd3892"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.14/powerliners-v0.2.14-x86_64-apple-darwin.tar.gz"
      sha256 "0379d6a6f205b93106137d952f0c2306670efd7fde8989933468f1a58f88e1fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.14/powerliners-v0.2.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c24cf412f06b50af9276feb39a2b82449399913288dc4e33c89ab36e94e0dd8f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.14/powerliners-v0.2.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cde51576c333c92c620bdb1681cfeb6db9aaa759eff563102c9ba59872192e51"
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
  #   powerliners-v0.2.14-x86_64-unknown-linux-musl.tar.gz  sha256: e5c5e7d895df0741eb2c6d0d911a71d20d949fe59a8a29110f56835d437320dc
  #   powerliners-v0.2.14-aarch64-unknown-linux-musl.tar.gz  sha256: 5aa54c0c3a6382e9ea6b797aad274d6a59582c6de2f85860e627908f52487d5b

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.14
end
