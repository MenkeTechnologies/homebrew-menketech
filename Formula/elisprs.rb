class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.10/elisprs-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "34f021da1c98549c6770a897c7cfec5bfeb6a947ad86806a99e4fea247be2627"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.10/elisprs-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8bb9cb472a063d12d64a4fedba409166f380ac034a5985638093af118f194b56"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.10/elisprs-v0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0df2d2c27e59553afb47738a0889625ebb470134266941820f9a1a5a8302a248"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.10-x86_64-unknown-linux-musl.tar.gz  sha256: 3b4dda156c9752360a94629010cbe6487bf78828fb3b77915178ed0fde4dc817
  #   elisprs-v0.1.10-aarch64-unknown-linux-musl.tar.gz  sha256: 9db6629a045acc2cc3528a7fc1b99037d8e62161376635beb84ee9736608dfe0
end
