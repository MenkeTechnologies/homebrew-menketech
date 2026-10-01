class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.67"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.67/zshrs-all-v0.12.67-aarch64-apple-darwin.tar.gz"
      sha256 "bf663afd979ebe5aeb886698ef641724fab4ec1a7a8d1da2c2c6042a7a5b7864"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.67/zshrs-all-v0.12.67-x86_64-apple-darwin.tar.gz"
      sha256 "5bc7f650da8f8443dcd303b62ab0450ee97fa6e967e6e735e3c471526f26cc4a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.67/zshrs-all-v0.12.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4207ca7ff333c3bc9e9c2dd09cf9ed79d2f0386e72c250944bb5c8b686b65856"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.67/zshrs-all-v0.12.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23934866128661872bb9ab250322195b926a6d7c2ffa9bb4e915580f45b9c433"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.12.67-x86_64-unknown-linux-musl.tar.gz  sha256: 6a2fd915fe2f23fc7c1aec4f3eab9c01243c4a10a282f9e1fc88d42a97a834cd
  #   zshrs-all-v0.12.67-aarch64-unknown-linux-musl.tar.gz  sha256: ea364a48b374e458cd2af0f92936848aa5de229bc2e3323f268a1077b3988e12
end
