class Tclrs < Formula
  desc "Tcl compiled to fusevm bytecode — a parser and compiler, no bespoke VM or JIT"
  homepage "https://github.com/MenkeTechnologies/tclrs"
  license "MIT"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.2.0/tclrs-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "8b327e55554d551e31e1d057638b29c127c0bdd5a9d3d8ac6a2ed194ee94a161"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.2.0/tclrs-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "e990ee6d969376e14bf208f1509f164ce390e5388f554a9e37496a316064d38c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.2.0/tclrs-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e4f1f604ea20fff768e029d6a737b738b5e9a93876fccd5bcef99da160704a50"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.2.0/tclrs-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0bf4f0e48c1ac0020f0851a4788fc325408a7a0ac52dfdb937dac22ae1a0436"
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
  #   tclrs-v0.2.0-x86_64-unknown-linux-musl.tar.gz  sha256: e708f9c6b63b55b26bae7495df572580324ab54e685bd8fbb4b04044de1024c0
  #   tclrs-v0.2.0-aarch64-unknown-linux-musl.tar.gz  sha256: 90448627224deade1678e1f16095baa6068d9fb338647356f0e79a39dedc9eb0
end
