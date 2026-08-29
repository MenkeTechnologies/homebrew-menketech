class Tclrs < Formula
  desc "Tcl compiled to fusevm bytecode — a parser and compiler, no bespoke VM or JIT"
  homepage "https://github.com/MenkeTechnologies/tclrs"
  license "MIT"
  version "0.4.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.2/tclrs-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "3080db169e45bc593b5134a632d9b797b3a8dcaf47017798afba3a8f9da7234c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.2/tclrs-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "aef98d1197b3d826625c25a26cb16770ad37646e0383d61e2368e52f59aaf761"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.2/tclrs-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af2bdcb1ff1a6a5a3a2130571607f5601460bcb12ac5cb0c3a88f3f0c315071b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.2/tclrs-v0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f7aaa022fee7388e6690125eebed383c951aa407ed2e6b4fefc38a6065924de"
    end
  end

  def install
    bin.install "tclrs"
  end

  test do
    assert_match "tclrs", shell_output("#{bin}/tclrs --version")
    assert_equal "3", shell_output("#{bin}/tclrs -c \x27puts [expr {1+2}]\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   tclrs-v0.4.2-x86_64-unknown-linux-musl.tar.gz  sha256: 51bfaa11cc198f24984a62fdc9f36165581987cba99af26f086fb1f1759c5c0a
  #   tclrs-v0.4.2-aarch64-unknown-linux-musl.tar.gz  sha256: 348c100b401f8bddb8b32c1b18e1c9c6c0aa29e9674c9c1816e71ed01110c3a3
end
