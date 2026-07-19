class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.7/elisprs-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "3137468748e4e89acec13525cd57f79d6147199845d2962e1927df9704229f5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.7/elisprs-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7bcd0e0a9c30ceb12c587ecf746b3b73c472b213a49fe50f0cd8683a62d20687"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.7/elisprs-v0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3044bcb8d716e32e70868f4420cb968f88e5645eaf0be8be8c1f87b57b0ef238"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.7-x86_64-unknown-linux-musl.tar.gz  sha256: 3b938466790ba2fa1cfdc2b0d3d6820b8c348c028bc95d0db532a50b57fa6040
  #   elisprs-v0.1.7-aarch64-unknown-linux-musl.tar.gz  sha256: dcd0901743d8b6129deeeb189eb3a473bf39c16034d3f6aba4123a7cf1afad92
end
