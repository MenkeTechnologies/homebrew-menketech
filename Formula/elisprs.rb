class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.4/elisprs-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "f49de6685188f8fbc8684b2fabfc8e6d15e66c93f7df38310b4d02077984b8ff"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.4/elisprs-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c84453eaa85f2e5d9c77629ab634ca210d777c64ef05e8eb952e0ce75bb377b0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.4/elisprs-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3f978da7f4710d04d86c5ad1efec1be8ce1b00607abe06df1cc29c0c6b4bc8d"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.4-x86_64-unknown-linux-musl.tar.gz  sha256: 8904edbb6a7d30216eeeb8706d0666d6d7936843883f5d22d06cea316b0781ba
  #   elisprs-v0.1.4-aarch64-unknown-linux-musl.tar.gz  sha256: 24c363989833a22bf8b868fa12ddd71e31eb0927419707b24a313f15a75f3c3e
end
