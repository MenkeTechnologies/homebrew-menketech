class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.34"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.34/zshrs-v0.12.34-aarch64-apple-darwin.tar.gz"
      sha256 "790ba0dd255c7676f7d4426dd5cf4d21c2fbef6d9f09405617218cae15ace601"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.34/zshrs-v0.12.34-x86_64-apple-darwin.tar.gz"
      sha256 "b8b00c166976d94f02dc981a2536e0a2fdc912885f0a9f224b4ee15ece6c86d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.34/zshrs-v0.12.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "114ac61c742fe79f1fce43847cb9c29191f6c47bd151ecad5e0fd9f502935bd8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.34/zshrs-v0.12.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be8e99ed872cf20d293c5967b9a199c4ec2a8e00dac5123c6943877a48440f37"
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
