class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.58"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.58/zshrs-all-v0.12.58-aarch64-apple-darwin.tar.gz"
      sha256 "6c3ec9e3929fb69497274da0e62191503a8990659e6ee255e48a57232a3fb9d7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.58/zshrs-all-v0.12.58-x86_64-apple-darwin.tar.gz"
      sha256 "41a4ca5754786ad1b3a5e84101c682dec65e35cf4a5548fa4f593e062757229f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.58/zshrs-all-v0.12.58-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6fd4c3e7261e7853c8a3cf5039c7798c88f10bb321685777d5ec9c31fbd2eae"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.58/zshrs-all-v0.12.58-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "362d7b413d19008ad57837965ca9086e73c0d9ace742a00100b0f391d951f753"
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
  #   zshrs-all-v0.12.58-x86_64-unknown-linux-musl.tar.gz  sha256: d43d76472c86a93b8035d21df1058d03fd380c5405d04a7105069702150ac04f
  #   zshrs-all-v0.12.58-aarch64-unknown-linux-musl.tar.gz  sha256: 22d7e10f0483933bf6c0ee6c3dd2c3a4b803b8a4a689c634578d93d6f8445a5c
end
