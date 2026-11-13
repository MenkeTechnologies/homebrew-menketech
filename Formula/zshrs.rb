class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.68"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.68/zshrs-v0.13.68-aarch64-apple-darwin.tar.gz"
      sha256 "c4d5dc38ffea752268560535421c8369b1368925f9dc0e25440a651149788b2f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.68/zshrs-v0.13.68-x86_64-apple-darwin.tar.gz"
      sha256 "744b3e1f8f9555846b89a8100c137871917e45643c1a3f0c628d52919a419748"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.68/zshrs-v0.13.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c97bc89e4915fcbcd28a9e41df4166e181bc946a68f54bc31fec0f4e778c2df5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.68/zshrs-v0.13.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83ec71d469ccddc879527371d370fd7c3539137ea2ce34f5cb64e98d3300d07b"
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
  #   zshrs-v0.13.68-x86_64-unknown-linux-musl.tar.gz  sha256: 6cc0ea890adc3b783718f46ecdc6973d052cadaa02336025582ff1c218294b28
end
