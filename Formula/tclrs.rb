class Tclrs < Formula
  desc "Tcl compiled to fusevm bytecode — a parser and compiler, no bespoke VM or JIT"
  homepage "https://github.com/MenkeTechnologies/tclrs"
  license "MIT"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.0/tclrs-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "edd952671d6dd021ba8effc13be5a5ba4d7770414ab61ba4e3b5bbda9caaf057"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.0/tclrs-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "5bb9d2aa825f8bade6a9570daa2c18edb5019e01c8036705e977c117e29d03f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.0/tclrs-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d393d7d4b745c589370c634e0d0cb6d470df20864db97b24ae8065a90617b5ad"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.0/tclrs-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d67af31bbbb5fb1c86c42373b2fccdde9a4e4d861f74767f3ea1de9cc69f90bf"
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
  #   tclrs-v0.4.0-x86_64-unknown-linux-musl.tar.gz  sha256: 34ef6b8b3220cf762c2ddbc73cf21b70dc6d9e487b04bd3e8d95bd0950b757ed
  #   tclrs-v0.4.0-aarch64-unknown-linux-musl.tar.gz  sha256: 2dc4c2d488170a744a7e59032c9b978a6fa69b49bee52755518fe18dc79bfc11
end
