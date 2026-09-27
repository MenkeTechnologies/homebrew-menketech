class Tclrs < Formula
  desc "Tcl compiled to fusevm bytecode — a parser and compiler, no bespoke VM or JIT"
  homepage "https://github.com/MenkeTechnologies/tclrs"
  license "MIT"
  version "0.4.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.11/tclrs-v0.4.11-aarch64-apple-darwin.tar.gz"
      sha256 "e1b1401ca35df9eb769bec9e40a1ec102f7d4ab950d8c22cc4034e205ba5d1f1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.11/tclrs-v0.4.11-x86_64-apple-darwin.tar.gz"
      sha256 "77d99847cb9ea3ac074ce38360a56288469876f45307250f074140f251f439ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.11/tclrs-v0.4.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d9d809b3a1304d430378a99682955f1d6e35f33ac98b06190501a470bb49ea8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.11/tclrs-v0.4.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d3035f6c8ddc355a008cf1149873a6ab2dac4050ab3a7b6137df6655267e11f"
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
  #   tclrs-v0.4.11-x86_64-unknown-linux-musl.tar.gz  sha256: 806f203214c400a1a08e7a6350417d1f8f54b238e31b914f753b5cf8a78ca2aa
  #   tclrs-v0.4.11-aarch64-unknown-linux-musl.tar.gz  sha256: 57b9af73d68162fc3b69994744181e8bab8ce07c73bae7f2306f1575ef604cbc
end
