class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.52"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.52/zshrs-v0.12.52-aarch64-apple-darwin.tar.gz"
      sha256 "7e350da090f949f5126ffbb4e23b2b38551d519cff822a7a3ab0aba3279d3160"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.52/zshrs-v0.12.52-x86_64-apple-darwin.tar.gz"
      sha256 "3ad0b3cf331154448e080ddce94f8fc1b2f1d593560c4e8c29f9da15727ecda0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.52/zshrs-v0.12.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ecaecacf8d4295b48525e8f44e8969786b0359be0f38289d4452016371116e5c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.52/zshrs-v0.12.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2d835e3d9078e226b75fd8b18da32fd42439f5d17a3041e5c637a4c7b87219d"
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
  #   zshrs-v0.12.52-x86_64-unknown-linux-musl.tar.gz  sha256: d4274abf35f7fabd6feb797ca69a344d7eb7507b29a1621ed96b6de9b2f0f1c3
  #   zshrs-v0.12.52-aarch64-unknown-linux-musl.tar.gz  sha256: 17435c7fbac4f311d4f8ddfb65bd2ea8e1d268a23be65f433cf3536aeb8c4a3b
end
