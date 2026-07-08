class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.3/elisprs-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "8bd3f499a371eab25bc402b37832aaf87c85e094d5de093e085b83b066339232"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.3/elisprs-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ca8dce65a051506cc940fe11cc7166b7252c3f9e7ce096d081031f2da2417c6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.3/elisprs-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cef5da3fc570ed809d8565ffbe02050b8f7572d1df066e652824a52149373f4f"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.3-x86_64-unknown-linux-musl.tar.gz  sha256: 754ffafbc47b67335c2730a9c5b8a581b22ad0971c15d1690e6e0194a72109f5
  #   elisprs-v0.1.3-aarch64-unknown-linux-musl.tar.gz  sha256: c0b443df6b0f4c05d7f26207f5b8eb53bf9a51b71797415d2d71d35efd2de8c0
end
