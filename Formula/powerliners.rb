class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.30"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.30/powerliners-v0.2.30-aarch64-apple-darwin.tar.gz"
      sha256 "2f85e4c8bc60f0c23f2943dd80e293ea9ffb3e1d7e35aeb22828ae2d9d20ba40"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.30/powerliners-v0.2.30-x86_64-apple-darwin.tar.gz"
      sha256 "4b20138b98bf36f68f8520b4835e94f70a72d436341db56fec9bf5c71815aa29"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.30/powerliners-v0.2.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27c5464a09c5a5ed81354c9232797e277f88488d4ee598f2baba2d00a7816963"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.30/powerliners-v0.2.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e916f015cc3a76a175011d8cce303c011b252fab48798787b465df40cf5046a9"
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
  #   powerliners-v0.2.30-x86_64-unknown-linux-musl.tar.gz  sha256: 6ed3cab7e2fca0b2a382bab72ed50944d09561e752a0a6f447062b814b079fa0
  #   powerliners-v0.2.30-aarch64-unknown-linux-musl.tar.gz  sha256: 97e17f6685835d31eda6ef3c17584fc096fe5d50ce8aa812431a62225db0676e

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.30
end
