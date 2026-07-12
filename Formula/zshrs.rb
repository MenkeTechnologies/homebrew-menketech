class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.10/zshrs-v0.12.10-aarch64-apple-darwin.tar.gz"
      sha256 "8f07a1f33bcc920d9c52da3bb4aa3e33f902e7db1d5c8b69f8d646533d957065"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.10/zshrs-v0.12.10-x86_64-apple-darwin.tar.gz"
      sha256 "7a73ec3e65af694440c74d1ee1e2e635631261beabb8c108bae9da1151c21466"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.10/zshrs-v0.12.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9820afef7658a765740f680118e4d230b7ede179ab040f5b1b1ad6b5407b7b24"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.10/zshrs-v0.12.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5da1ee7d2d7c3cfe943aabdf885cf33286fa88e7794aebbc9445b813df69b169"
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
