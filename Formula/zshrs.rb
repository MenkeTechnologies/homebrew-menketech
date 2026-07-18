class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.21/zshrs-v0.12.21-aarch64-apple-darwin.tar.gz"
      sha256 "d46c9a24aba7c85ab378f05cef1b403f1e91adec0bfa8ee5aa0841bfde0f2ed5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.21/zshrs-v0.12.21-x86_64-apple-darwin.tar.gz"
      sha256 "d94e41fda3e779576dcfdea6d27bae79427a5760ef2a70ced511077108129fb7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.21/zshrs-v0.12.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34d3e89b437b7ccf120f6a9ca8d9def43e101697393dcabc162a0a3aea8f5779"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.21/zshrs-v0.12.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6296f75345e3beed34db553b59c84ab37c92659d80440b8992a898af4c9a0010"
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
