class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.0/zshrs-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "4b661c083afdc99c4950416c858ac5b002e282abeffb004819bd9b89ec198f99"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.0/zshrs-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "10cf166d74175dc561d091dacd1a6d9a98bd07015b1e2dc5acf0ba524267b1a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.0/zshrs-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "58a4d2dbdff7b0b505f70cc181c83d015dc3652cf9fe6349fb39a6d34a6830ef"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.0/zshrs-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0aebf4af373faf0abe965d032940320f1de378d44c953ac0238808ecda9874ca"
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
