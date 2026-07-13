class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.5/elisprs-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "e1411fcd1adf8744855c89dbd694ce731377ac13d6c44895a3e9ddf3974869f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.5/elisprs-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d06a64538d08d37928e9d2636c4833a4c6d68b393a45f6b82a239829339e103"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.5/elisprs-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0dd2ede8f5cc3edb4cc828e6642b7bf2aecd909ba686e120fd4562206193ae9f"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.5-x86_64-unknown-linux-musl.tar.gz  sha256: 71a6f118fea9f32eca48becd7a306f20aff7ea3c259a3456634d7ea3790a93d7
  #   elisprs-v0.1.5-aarch64-unknown-linux-musl.tar.gz  sha256: 61a81394e9829067ec665a11250b68c3069daa61a5e53f5d507f112b5dbb430a
end
