class Zshrs < Formula
  desc "The first compiled Unix shell — drop-in zsh replacement with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.11.14"

  on_macos do
      on_arm do
        url "https://github.com/MenkeTechnologies/zshrs/releases/download/v#{version}/zshrs-v#{version}-aarch64-apple-darwin.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
      on_intel do
        url "https://github.com/MenkeTechnologies/zshrs/releases/download/v#{version}/zshrs-v#{version}-x86_64-apple-darwin.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
  end

  on_linux do
      on_intel do
        url "https://github.com/MenkeTechnologies/zshrs/releases/download/v#{version}/zshrs-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c \'echo hi\'")
  end
end
