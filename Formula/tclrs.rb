class Tclrs < Formula
  desc "Tcl compiled to fusevm bytecode — a parser and compiler, no bespoke VM or JIT"
  homepage "https://github.com/MenkeTechnologies/tclrs"
  license "MIT"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.3.0/tclrs-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "521bfa0f45ca40cf61fefac61f2638c8a1d98c56ea13dd34979abe4d95c467dd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.3.0/tclrs-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "b3d071a331d33c730fa19b7f59afd6dfdb060638ed207ade3487b5b3b068a6e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.3.0/tclrs-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b386bc84845711a2219a81ff5610aea07175fc9bd92aa2c84bf10c7085651a1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.3.0/tclrs-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff5ba22324eba3cab31206f90eaac612dc824cd770db623b6e5e722ca18a5767"
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
  #   tclrs-v0.3.0-x86_64-unknown-linux-musl.tar.gz  sha256: f150a1d93613b78f55fe482492d510dcf3cca51b36f9734f0a7f46482925c16c
  #   tclrs-v0.3.0-aarch64-unknown-linux-musl.tar.gz  sha256: 16f9b88ba8aec07157856d732091aad8d250c368294dcdab85f1c1823497827e
end
