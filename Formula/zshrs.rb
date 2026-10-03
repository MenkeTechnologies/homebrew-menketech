class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.8/zshrs-v0.13.8-aarch64-apple-darwin.tar.gz"
      sha256 "2b180a71c9c20870c48f3fd93f27529c2547257cb778e2bc750e900fcc197aea"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.8/zshrs-v0.13.8-x86_64-apple-darwin.tar.gz"
      sha256 "e4c785078db5afcc415612e9e1e7624cebf303068e1170c30b2318577b4c158f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.8/zshrs-v0.13.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1944302c542cbda8fb5aac174a5f3599705cfed4a58bf747ea68145fbdcbb737"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.8/zshrs-v0.13.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f3ddcac145df905df389dc3f4ec4dd6e3196cd83f124b929e97effdd3439604"
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
  #   zshrs-v0.13.8-x86_64-unknown-linux-musl.tar.gz  sha256: a1c638026cef818db66eaaf71ba602e6791451a49f64212111e711a2905abde1
  #   zshrs-v0.13.8-aarch64-unknown-linux-musl.tar.gz  sha256: cc4e0b9d0ff9859b74d95b1258d6c85978bb305c80f9be5fda38f8612721832d
end
