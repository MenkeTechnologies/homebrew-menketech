class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.76"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.76/zshrs-v0.13.76-aarch64-apple-darwin.tar.gz"
      sha256 "50fdf7692ea894e5b461b30f8150c1e8a9fc26f6e5128ae016f1e512059b789d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.76/zshrs-v0.13.76-x86_64-apple-darwin.tar.gz"
      sha256 "e87cb21d814591cea7c298de6d2d2ab191f78af20eefab3dd1fc32514977aa0d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.76/zshrs-v0.13.76-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4cffd0f3f7a570b8c735e074f7d96762cd990e94724dfa25cd57fb663d89b1b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.76/zshrs-v0.13.76-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5224a94cb99b2adf9ee8705781d04f1162ef88f3b73fc1db6fae7e20fba42cdf"
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
  #   zshrs-v0.13.76-x86_64-unknown-linux-musl.tar.gz  sha256: 48b3b51d556fe7698ee81ee2493812c4da87b2108652e0e6ca0384c668e02b1d
end
