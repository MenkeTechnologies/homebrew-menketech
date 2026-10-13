class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.40"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.40/zshrs-v0.13.40-aarch64-apple-darwin.tar.gz"
      sha256 "3317cb4533248bf8869a5a2519166f6405c78173d25b3629234d184e83ae8814"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.40/zshrs-v0.13.40-x86_64-apple-darwin.tar.gz"
      sha256 "bb0a2ae29ea80224894dcf4426f7337b41946e572b3b82ce9efec8c00cfe2afa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.40/zshrs-v0.13.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "382bc1c5fdaea162981eb7944a20fd78a7baecc55643848a2947941cdddaa0cc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.40/zshrs-v0.13.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac9ea685f351f7600ad32051a9c689cf3259f7e8ba5e3de91ecab779c69c98ca"
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
  #   zshrs-v0.13.40-x86_64-unknown-linux-musl.tar.gz  sha256: 671d51a3e324419593eedaa1e0802e25b1606350c9925ef0c199bec4056befb4
end
