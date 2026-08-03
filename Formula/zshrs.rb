class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.29"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.29/zshrs-v0.12.29-aarch64-apple-darwin.tar.gz"
      sha256 "68a30338121379e79a7a96798a8187df73c54e585af3045bceefa6eff96b3bbc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.29/zshrs-v0.12.29-x86_64-apple-darwin.tar.gz"
      sha256 "7d437251c989aef04ab61a28a113a63379d676c1c9c66e290cfa3dbff390bd10"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.29/zshrs-v0.12.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57bc37c2759ce9ccd613f2806ba1db1fcbd3e95fcb5338f7794dd33b95f7f5d0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.29/zshrs-v0.12.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3dc5518390d462a72b17dc6d225dce2746aae6766c53bf82397dbb8a71f4499"
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
