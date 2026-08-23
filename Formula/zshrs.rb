class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.37"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.37/zshrs-v0.12.37-aarch64-apple-darwin.tar.gz"
      sha256 "1f4ddeca51dd749783c7d52880936666657af2f8c9b0494b4fb240a8e1f0e711"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.37/zshrs-v0.12.37-x86_64-apple-darwin.tar.gz"
      sha256 "dd55cc02e239a1b3c9b6d6e9291741da8154cdda97455fa76167e5fa2d79a27e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.37/zshrs-v0.12.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2251f2f457a8ab108b6fe71e9efc97cc0f2bfbf5413115320ef710d73636c25d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.37/zshrs-v0.12.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "16312d1158b8ee100b32e1f4609a979a06ce44cf0d3a937acf3fe4d5ef019127"
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
