class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.24"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.24/zshrs-v0.12.24-aarch64-apple-darwin.tar.gz"
      sha256 "4d1455645a96c604e775468d8c2e60cd4c88f78edf09f2ba042b4de91f41cd45"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.24/zshrs-v0.12.24-x86_64-apple-darwin.tar.gz"
      sha256 "4c61fde73902e823a1bbf76e12f4c9ace30eb75c85b6c0f26229cefe6aef4bcc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.24/zshrs-v0.12.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "330b59c5d28b018b343c87f464ff91e5a06f8ff8107bb9bdc0e328727e4c7d8a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.24/zshrs-v0.12.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b8acf1f634fedec9d21404916491c6a2912eb9f5fbf09a72dd8e8b523f3f719"
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
