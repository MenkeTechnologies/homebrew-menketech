class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.16/zshrs-v0.13.16-aarch64-apple-darwin.tar.gz"
      sha256 "6512e62d3a6754b5f0477859e372b7dfa1dd3bdcc9761fc862cbe908b6971f3b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.16/zshrs-v0.13.16-x86_64-apple-darwin.tar.gz"
      sha256 "efed1d7978e9352038291d831b84fb54ba61027d823603803bad4007cba2eb7a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.16/zshrs-v0.13.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d12d8658169bd3f940aee5c9197b8f2c82392eed47c37b64826d2602d1920608"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.16/zshrs-v0.13.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ace8577c56b4361a37b6844d8f48f976bb843e1dbdacaaad0f29b2cb2b395564"
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
  #   zshrs-v0.13.16-x86_64-unknown-linux-musl.tar.gz  sha256: 5cc61bd9d0da3dfc75e419b84e2e96ef1b8cfa541744bed2b2e68fc7ddedf9ec
  #   zshrs-v0.13.16-aarch64-unknown-linux-musl.tar.gz  sha256: 1e5b97be5920c3f70bb88609d184b8e10e41273777708953f4a02af71e6ba860
end
