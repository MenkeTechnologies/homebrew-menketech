class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.2/zshrs-v0.12.2-aarch64-apple-darwin.tar.gz"
      sha256 "4a3039df37da38788b0051003087363df11e5882b3d89e270484780686f1c227"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.2/zshrs-v0.12.2-x86_64-apple-darwin.tar.gz"
      sha256 "68332621c2a2272bb31a10fe88150d0f3b267d49cd237e53914f870deb025a74"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.2/zshrs-v0.12.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b57af2864dec9c3b1192e5b96d888534f9c657d5ce7c02cc9f35cbfddebe83a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.2/zshrs-v0.12.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ea12837c2f6fdd0fd1522302f6da320fde044c79288f77251e79f5805270c17"
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
