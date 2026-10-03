class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.1/zshrs-v0.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "4e099a25024097e6cdadd80d9e1428a3d61cba3fc9895f64203d11ace029a5ef"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.1/zshrs-v0.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "6e30047c1d1c868bb795c3a7817ea0b866316bb2daafef85e379b37a60d8ffc2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.1/zshrs-v0.13.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3a1218e9cfb7d06f2e6bbf8323a0f92f117d7f1a4e5f4966239c205855b0365"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.1/zshrs-v0.13.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "edae6d9b2d1542c8db73b72780777dac35d8cededd984311860fab64e589ec37"
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
  #   zshrs-v0.13.1-x86_64-unknown-linux-musl.tar.gz  sha256: 72101f6d03c26ed817a16fca96ad1d1b0cad39084f5d649a48a74b8b10209019
  #   zshrs-v0.13.1-aarch64-unknown-linux-musl.tar.gz  sha256: 58f57a718431cd68b026a7496df63964c70565ab976f6727ceb7003ac7259344
end
