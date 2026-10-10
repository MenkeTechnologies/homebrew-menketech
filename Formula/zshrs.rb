class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.22"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.22/zshrs-v0.13.22-aarch64-apple-darwin.tar.gz"
      sha256 "f8a352617ba3754efe9880fc9df85270490d965c8941e524a68ecf545252d063"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.22/zshrs-v0.13.22-x86_64-apple-darwin.tar.gz"
      sha256 "058f6856590366dabc3ec628c8fe88f971ee29745932efdbc142f187365dc42a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.22/zshrs-v0.13.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f18310f572804a1e3890892648a401cd4c7a9862991e93861f7098ff9b923b1b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.22/zshrs-v0.13.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c09f193f13c98d2a504ad5bf2fcd50b3a9012547295baec03d80cdecd0b73db"
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
  #   zshrs-v0.13.22-x86_64-unknown-linux-musl.tar.gz  sha256: 35ab9e9b3a00b4445020ca9b3aa6f2fe9becdb464802c5109f557d9f51300e19
end
