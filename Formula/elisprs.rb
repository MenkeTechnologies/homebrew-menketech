class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.9/elisprs-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "fbeadaf20e90f069730fc19705b9316ab6989ec393aa09a84bc028ef6ca9605c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.9/elisprs-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e95d71543ccee5ab0f91b1f7ab0b116665738f1e12a95381c1e87ad9cf2e5b44"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.9/elisprs-v0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f61856541f8c2a3b577eb5b5f06cb1e78b489bbc893e5d0fa5f7324cd21bae06"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.9-x86_64-unknown-linux-musl.tar.gz  sha256: fc15cffe414cd0e3231eff0e862f113cbf24fe1882eeb3f1878d532b36ee5cd1
  #   elisprs-v0.1.9-aarch64-unknown-linux-musl.tar.gz  sha256: b03477f139eeceebd7a759d5dcfae6d82b4afca07de9d3478df46f8c33f02296
end
