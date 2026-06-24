class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.5/zshrs-v0.12.5-aarch64-apple-darwin.tar.gz"
      sha256 "4da01b526699f7349a58fe82c56c81afb49c938ff64365bfbadff51e1c35086f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.5/zshrs-v0.12.5-x86_64-apple-darwin.tar.gz"
      sha256 "d1f54bb8d8df8b411b583efda564d22effe12cb1f62b7bb3f5959374a6a35eb2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.5/zshrs-v0.12.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e153961d82dc8e7cef49c45f710f6ee68f310d6e471f990681832b7c96e6c452"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.5/zshrs-v0.12.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58c7053353c475c6f0d9b9bb7b083446e9b5145f9d53ecd53e879b47effa3622"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end
end
