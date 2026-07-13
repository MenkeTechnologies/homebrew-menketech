class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.13/zshrs-v0.12.13-aarch64-apple-darwin.tar.gz"
      sha256 "bd3497ed06488d57b9d9d726155099c481703f65c7defcb45f9c07df610cc4f3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.13/zshrs-v0.12.13-x86_64-apple-darwin.tar.gz"
      sha256 "4087e1771e90ddd18cee827fd8b99dc5cf1cdd892219e76e593d2f0b18953676"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.13/zshrs-v0.12.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc237c1181ec67633b9de625f7e4ab40b5efdc038a92970f80f46b22d788cdd4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.13/zshrs-v0.12.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d43ef46552a9a78157d61b99bb82f7bb6950c34e7375ae572c8584774684141d"
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
