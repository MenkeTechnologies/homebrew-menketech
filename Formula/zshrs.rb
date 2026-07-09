class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.9/zshrs-v0.12.9-aarch64-apple-darwin.tar.gz"
      sha256 "ce32752c6639ba88d1c1513642cd1969e031269801f7a66305180afc78fa0d75"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.9/zshrs-v0.12.9-x86_64-apple-darwin.tar.gz"
      sha256 "124e6364a8544d5aac06efa7dd4291e2be92d00dfc196a09bb335ed63d987389"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.9/zshrs-v0.12.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec9db75e855acb56a20e9479caac21cffb32307760c187164d0c2c859b9384c2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.9/zshrs-v0.12.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1036355f2bf11ca4cdedcd8a3a261582c1ef682d6f145a475d27aac285dc6be1"
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
