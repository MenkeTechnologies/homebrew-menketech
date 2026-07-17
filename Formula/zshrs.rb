class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.19/zshrs-v0.12.19-aarch64-apple-darwin.tar.gz"
      sha256 "f8ed385220d9bba6669f7d6496cd52e4484e0b51fba24e635f3f10b0d4004bc6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.19/zshrs-v0.12.19-x86_64-apple-darwin.tar.gz"
      sha256 "e51eb54c6586d05c3e7b825829659cee44fe3b000510e2853a07a903d85e36a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.19/zshrs-v0.12.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af207391a25cb1d11d4cd0723d1f2399ce546f345f3eb946c6cedaa7e9b5feee"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.19/zshrs-v0.12.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cda40109c94085b56db7adbd120076160ea65ee5c6b1ced96b68bf7e9138abac"
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
