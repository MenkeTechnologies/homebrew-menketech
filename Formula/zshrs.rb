class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.29"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.29/zshrs-v0.13.29-aarch64-apple-darwin.tar.gz"
      sha256 "e970fe174ba3740db6d23ed37e81335005d54eae69e2a8395225148d8576c52a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.29/zshrs-v0.13.29-x86_64-apple-darwin.tar.gz"
      sha256 "0ea7188b19195199d6c509d16902304f43788504c5625629aeed109c84545394"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.29/zshrs-v0.13.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3472ced2107614581690e6402fea092dc6d0591dc638827cd6c649b5e6aec07b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.29/zshrs-v0.13.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ce6bb4e0908ea8c79dc2d24b535a573308b91aaae862ac2be4f23276ad90604"
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
  #   zshrs-v0.13.29-x86_64-unknown-linux-musl.tar.gz  sha256: aed41892a0a8f98d33a588907896ef3547b7c24dde9b5b0508ab209b624ce9c0
end
