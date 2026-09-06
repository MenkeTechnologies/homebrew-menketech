class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.31"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.31/powerliners-v0.2.31-aarch64-apple-darwin.tar.gz"
      sha256 "d1bf522947954a5eb9fee7ecb6721cdf5b9a71d1ad7b7dbf7d26cf262f72f65b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.31/powerliners-v0.2.31-x86_64-apple-darwin.tar.gz"
      sha256 "8efae720ca89bac19082d4a13641d31efa3cb4a5b48fbb9e77286ee9f16c4c0b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.31/powerliners-v0.2.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d121348c106e9cc8eb9a0a9001d8705b50dba2d417be84f27bdea931f32b53c0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.31/powerliners-v0.2.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e726679f40cb9b2bf5a0669853ee1c59fa0a3308248232f71c9372e520867ef"
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
  #   powerliners-v0.2.31-x86_64-unknown-linux-musl.tar.gz  sha256: 8c9702e0076b1697a308aa788c6cad2bc92b7739c25763004cc21f1a5b596e17
  #   powerliners-v0.2.31-aarch64-unknown-linux-musl.tar.gz  sha256: 34632eb9ef0cee998400a5147fc5589f8a0e19c7a07d6a51cc39c2c4d2891b41

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.31
end
