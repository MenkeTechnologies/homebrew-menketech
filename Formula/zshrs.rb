class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.71"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.71/zshrs-v0.13.71-aarch64-apple-darwin.tar.gz"
      sha256 "fb4d021c17799708dc3f07fba0aea8bbd3bd600c1590c2ef15b44980aafbf8f9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.71/zshrs-v0.13.71-x86_64-apple-darwin.tar.gz"
      sha256 "306ad69f5aebfc6eb4685e7793465a1767fd8198cb1294f9d4df205df03219ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.71/zshrs-v0.13.71-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "122752e847571166f8b492ee80e2468a38d02e6e43d9af8f8bbbcfe3d5994e30"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.71/zshrs-v0.13.71-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a62075505f0581ee3d89a8ddf0bd2343fc24836cb8a0749b28b5cc3ce15d19bf"
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
  #   zshrs-v0.13.71-x86_64-unknown-linux-musl.tar.gz  sha256: 8abc81fa2d4dd4907a99c68aca49da8d953a6fda7093194f1def37dd3c93bef3
end
