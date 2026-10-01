class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.69"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.69/zshrs-v0.12.69-aarch64-apple-darwin.tar.gz"
      sha256 "c53b73e731a1ebd41ccdbd1ecee114f1e8f55fdb234e60107fdf7b510dff1ea8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.69/zshrs-v0.12.69-x86_64-apple-darwin.tar.gz"
      sha256 "dd9947bcfc989c6247ea232eb9f6a90effc9abe4dcb939efb51fe6c79150967b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.69/zshrs-v0.12.69-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd36aafe40a61554a1151d89f07d0bd54e126d76e511232858cbaa360a58f7f8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.69/zshrs-v0.12.69-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e99be16d901ccff6b80244529bd9483e231f3fa65c69fbc60162adb84756768a"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.12.69-x86_64-unknown-linux-musl.tar.gz  sha256: 47efe1de91393e5a764bdc4741e79a5e961d8e657ab839cb1eed549f0db809c6
  #   zshrs-v0.12.69-aarch64-unknown-linux-musl.tar.gz  sha256: cd6c1129ae7a8b04b3a87bd55e8bb68b20f081d6b53b3c083811aec54be90bb6
end
