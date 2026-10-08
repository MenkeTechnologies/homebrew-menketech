class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.14/zshrs-v0.13.14-aarch64-apple-darwin.tar.gz"
      sha256 "586435f04875646e1b927e2a34001801864a544efa4bd4898509c84464152532"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.14/zshrs-v0.13.14-x86_64-apple-darwin.tar.gz"
      sha256 "b4979bc7ee468b79decc43de53211f905c9537ad6b7d83db2145ecc0a3d3cfdf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.14/zshrs-v0.13.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07a19999e68ed1be4ae8220537c0e0b171c17640ddec0eb858361a27c4e3beea"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.14/zshrs-v0.13.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5bc1c0e8259e7380ec15f2a5ba5ea50464d3d73b8d7fa528673cf6861f0f5b2"
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
  #   zshrs-v0.13.14-x86_64-unknown-linux-musl.tar.gz  sha256: e0624a1b69304dfb36f0b9292179b280a3786b8622c6e4362af1f41ca42ce020
  #   zshrs-v0.13.14-aarch64-unknown-linux-musl.tar.gz  sha256: 8de78d16f14821baf515a28b9b48a615e2d706d4387adc3f75e6679627b66324
end
