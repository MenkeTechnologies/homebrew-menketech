class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.14/zshrs-v0.12.14-aarch64-apple-darwin.tar.gz"
      sha256 "de5253b9fb9edc6344c1fe6b1d8cdffc390936a57aaccefb219cab884499e42d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.14/zshrs-v0.12.14-x86_64-apple-darwin.tar.gz"
      sha256 "49b04c8bdc9823156419c5b8fc24ffd97c9d9328b48a2997aee9aef93fcf7275"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.14/zshrs-v0.12.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9269e27477bfe114d8fbbb037b2572edf2e6964cf74f2e88ef41a5f3fe721fb1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.14/zshrs-v0.12.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72e3c2f6cdbc13997a0b785b1346e2c5b1b4a923caed910729cc8d8274fdd6b4"
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
