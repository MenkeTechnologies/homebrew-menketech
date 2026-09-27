class Tclrs < Formula
  desc "Tcl compiled to fusevm bytecode — a parser and compiler, no bespoke VM or JIT"
  homepage "https://github.com/MenkeTechnologies/tclrs"
  license "MIT"
  version "0.4.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.10/tclrs-v0.4.10-aarch64-apple-darwin.tar.gz"
      sha256 "2b6b83794eff3da1b686d129fb5383b00d6c8081efbbb2920184d78be69f5f64"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.10/tclrs-v0.4.10-x86_64-apple-darwin.tar.gz"
      sha256 "716806e61b7859f78b71cb4e42eba8c20449ee0a5ed4b327a690293d920dbc42"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.10/tclrs-v0.4.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76138c8ccb6c7b73a9af7033986e00c2b0f22c7bd4326e34662e2b0604de9430"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.10/tclrs-v0.4.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a60c0bebd7b8de78604116fb7523eea3ec07329478f4ef17bca0307ba2ca971d"
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
  #   tclrs-v0.4.10-x86_64-unknown-linux-musl.tar.gz  sha256: 3847db14c7cc1b563d4cfe4258b378e5a22779b2c9c0baf2f2d11bb50fe5ab2b
  #   tclrs-v0.4.10-aarch64-unknown-linux-musl.tar.gz  sha256: 4f50ba6c7135d30b351306f2c0de984d96bd2b411752c75c685d25d2958506d0
end
