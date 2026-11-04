class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.59"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.59/zshrs-v0.13.59-aarch64-apple-darwin.tar.gz"
      sha256 "5f91c804e51fb64c4850389b6931d4a575081b5ae4a3b689a17b6d33016b54a8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.59/zshrs-v0.13.59-x86_64-apple-darwin.tar.gz"
      sha256 "4608e9c55e5a65ba653167a1696ad2e40a21f0b0456d4eeb98ba3e8ac2c7d4f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.59/zshrs-v0.13.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9abb3e89fe89964418878519e11a6e0b2183dd190d2eeab9e1840775936a21aa"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.59/zshrs-v0.13.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e3ab29703a803ef77bca18393db036e096074cedc135358ebc7816dca5a020b3"
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
  #   zshrs-v0.13.59-x86_64-unknown-linux-musl.tar.gz  sha256: 17851ba22d340f3d8afcb011995ce9d07f31ce7263f2e159661f02248cf011e5
end
