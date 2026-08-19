class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.35"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.35/zshrs-v0.12.35-aarch64-apple-darwin.tar.gz"
      sha256 "f92060c599644d86d399cb790569a944f3217d30816b4a9bd0bee7cab0bf28c0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.35/zshrs-v0.12.35-x86_64-apple-darwin.tar.gz"
      sha256 "f74a5da3207312725584f4abac061765ecee8176bd37300c05167d91cd97cf22"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.35/zshrs-v0.12.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35a104feba3aa19e621bfac79ed02bbb42f9fd0c3b7b7b014775704a4eb9717c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.35/zshrs-v0.12.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb8a22f74d2eda79d03b835cd77a80c4d9a671876e6a40f7d3334037a1539b82"
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
