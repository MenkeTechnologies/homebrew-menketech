class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.23"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.23/zshrs-v0.13.23-aarch64-apple-darwin.tar.gz"
      sha256 "0dbbea3aeb960426bfff1d219518a5b3cb062d9aff6e9421ec213d2b48990a11"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.23/zshrs-v0.13.23-x86_64-apple-darwin.tar.gz"
      sha256 "6af9f8430e941317d255171aed26a960ae3786c1e3725db7ae482c44974bae56"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.23/zshrs-v0.13.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f00f2a6f5b2f45df9a050a8d4b7a974203ae8267a975a6834d8420eab8b4cde3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.23/zshrs-v0.13.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "231e64d1e25f8ff7e349b4e617e55bbba6e9c56919297501d41347563f86127d"
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
  #   zshrs-v0.13.23-x86_64-unknown-linux-musl.tar.gz  sha256: 4077ce4eb382f2683a773af96f93540851b22ef04416726b51502a7e868be4cc
end
