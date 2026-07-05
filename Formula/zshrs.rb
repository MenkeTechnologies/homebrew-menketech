class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.7/zshrs-v0.12.7-aarch64-apple-darwin.tar.gz"
      sha256 "ac8575af6c5073ab2296c8bb1067c4d0b54638ff385e123c24b6d48060aa96e3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.7/zshrs-v0.12.7-x86_64-apple-darwin.tar.gz"
      sha256 "9e35ff1c7533151d585f01785c5f9f84188cfd6dcbf45898902a4a4ee386d424"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.7/zshrs-v0.12.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a9cd938ed30cda6daf4398e119c0f67181cbf03f93e037539f78c7c2a9a3cc9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.7/zshrs-v0.12.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "19ae1425793afa397642e35ca14733c691834e9439197e7c8dc3e13f18593dbb"
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
