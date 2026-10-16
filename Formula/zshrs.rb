class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.48"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.48/zshrs-v0.13.48-aarch64-apple-darwin.tar.gz"
      sha256 "1db8892ece4ba3b99b51615a8c8abebbbdd24da64e9d51e283bd28d7757eae3d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.48/zshrs-v0.13.48-x86_64-apple-darwin.tar.gz"
      sha256 "1f07dcad88c73e344da0a441af850b220774e9a6909edb0caab0c8fe1f5c7241"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.48/zshrs-v0.13.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f38be1d2ccd21ef4bd5e842180b278f097fd07394113aa317c8e6e846364e088"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.48/zshrs-v0.13.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0fe490978a6f3062c3ae54a90eadb4a7b2fa384b626e690aaa8633406d27069e"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.13.48-x86_64-unknown-linux-musl.tar.gz  sha256: 85da83d080384bfb81f040e215e2e220920fb12141dd78d340a49aeaf5e54d68
end
