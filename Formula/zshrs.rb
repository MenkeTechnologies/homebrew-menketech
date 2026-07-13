class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.11/zshrs-v0.12.11-aarch64-apple-darwin.tar.gz"
      sha256 "d36b53432f07a23bff032ac58e121d9e9c6ec5ca78567453d8304388aa1b110a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.11/zshrs-v0.12.11-x86_64-apple-darwin.tar.gz"
      sha256 "69b2ee506634c12da541f8c5633b6c703ba38e03d555e8341addbc569ed0601a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.11/zshrs-v0.12.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2be5df75c87f9b8304310772f781a25284b8fc8cbfd95bf872f5b9f3cb97c924"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.11/zshrs-v0.12.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e3756487e198a1d763c4fd8e48e660f7d872e624845e64f417df8537b1049fea"
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
