class Tclrs < Formula
  desc "Tcl compiled to fusevm bytecode — a parser and compiler, no bespoke VM or JIT"
  homepage "https://github.com/MenkeTechnologies/tclrs"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.1.0/tclrs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "7b413fa86b37e96b6b4a2c9843cabdb1569fd135bb1135a833225f28a385e2e8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.1.0/tclrs-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "0d485ee71ef61ae5ce31d33e35a3ce55ffcf5d50393427436778676c3b465ba9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.1.0/tclrs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b6c6d983186b9646975386cf9c8daadb3a99203af6e5050aa76ddbc9e52ce562"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.1.0/tclrs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb12664183574481098841a42f38189bc39e372c62526fb8daf79eb1c0b7bd01"
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
  #   tclrs-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: c58db653a889309cfc897dc860d84dbf4eb1d973cfd5d73fe42a273edb807e5b
  #   tclrs-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: ad70e56656155cae302b034992ea4ff90299b57d54ed54128dc09a66114573a4
end
