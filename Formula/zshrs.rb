class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.11.40"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.40/zshrs-v0.11.40-aarch64-apple-darwin.tar.gz"
      sha256 "afd030d6dc06a361fa82831565022cc9ac923f7b89143dff9e7f75e13b8cf668"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.40/zshrs-v0.11.40-x86_64-apple-darwin.tar.gz"
      sha256 "0e102d95c48f5fbbc4892ca4033109142dc29d90b78fdd750bbef951b097e152"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.40/zshrs-v0.11.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eee8f9fca7a81f0e9bb1639a6c4577cc2727bc60da5300213b0387e72bfe90e0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.40/zshrs-v0.11.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e845d57f95db74ca23a4f3f35580d7deef8da6eb452bb22ec37617be6b0ec4a6"
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
