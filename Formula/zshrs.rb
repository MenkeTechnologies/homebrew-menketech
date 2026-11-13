class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.74"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.74/zshrs-v0.13.74-aarch64-apple-darwin.tar.gz"
      sha256 "250840b53a3e65cc0e799373662860390952cd90798404ef177615b44d2f2bc0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.74/zshrs-v0.13.74-x86_64-apple-darwin.tar.gz"
      sha256 "c887f8a382492f7d0063041fe3b3cbf8b2eb977d3948076e0de913812130b292"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.74/zshrs-v0.13.74-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa0745ac25379ad81731ebd6a02ec7a1351dbf6e51e7299ea957a41c2ceba6cf"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.74/zshrs-v0.13.74-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b85e1294bedf736327ccbb742972d54f96fa06022cfe49c68684a41b221365b4"
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
  #   zshrs-v0.13.74-x86_64-unknown-linux-musl.tar.gz  sha256: 71c9f1c86835ea395631c2a469053683008ecfe9f469782baf24ae7cc94a6156
end
