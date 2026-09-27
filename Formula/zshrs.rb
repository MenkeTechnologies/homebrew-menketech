class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.66"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.66/zshrs-v0.12.66-aarch64-apple-darwin.tar.gz"
      sha256 "aeda499ab55ccd97f9f6a6e784aace6cf2eb6ce00334b380678ff959fa0d5ce9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.66/zshrs-v0.12.66-x86_64-apple-darwin.tar.gz"
      sha256 "369616ba35789ca2394312b16dc38b5dc7e14e4ace52d753d7fc6810d64b3647"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.66/zshrs-v0.12.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe332cff86508cfa9610450052c833166dd5bf6c72b935636d437ca3c9c65126"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.66/zshrs-v0.12.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cec9cc7707146bcd3c776434bd2a0e3bebef05311104d1f09a5568ff7cc92140"
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
  #   zshrs-v0.12.66-x86_64-unknown-linux-musl.tar.gz  sha256: 017a9c3820c4ed785f6dc5dca8797e0400ad90b464ca2500a3946a82e67c75e5
  #   zshrs-v0.12.66-aarch64-unknown-linux-musl.tar.gz  sha256: c257add492d691de65012494d1a1fbf159a2294d6c4a33e595f408d5bc5ced37
end
