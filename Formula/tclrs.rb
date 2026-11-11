class Tclrs < Formula
  desc "Tcl compiled to fusevm bytecode — a parser and compiler, no bespoke VM or JIT"
  homepage "https://github.com/MenkeTechnologies/tclrs"
  license "MIT"
  version "0.4.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.13/tclrs-v0.4.13-aarch64-apple-darwin.tar.gz"
      sha256 "e38c16ac5ad011795eb7b17b6bd6d1f8b93cb642c3f2a83864c295e78098228b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.13/tclrs-v0.4.13-x86_64-apple-darwin.tar.gz"
      sha256 "3129228d14cad0a35de260619dd527a694ceb35be4cd10d23dac0a7cf702f932"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.13/tclrs-v0.4.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4cdc72a6cf5c5ec9fce84d96f128cf6967b74d5a8d7bead6d637e8a645927c4e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.13/tclrs-v0.4.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "68c8fbdbe5eb2321f56fce71b99bed38c20816d1fe7fa3346a4deb2bc3be4e5c"
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
  #   tclrs-v0.4.13-x86_64-unknown-linux-musl.tar.gz  sha256: 5d3469d1b15b63d060d3d41bf3f0a5066b69e2d979a6d6e86d355db5c0ce7481
  #   tclrs-v0.4.13-aarch64-unknown-linux-musl.tar.gz  sha256: 6f1bf75fc175c14a357bff70bd38adf723098194d30be328eea2283fb5704e67
end
