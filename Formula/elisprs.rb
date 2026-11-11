class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.20"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.20/elisprs-v0.1.20-aarch64-apple-darwin.tar.gz"
      sha256 "a2ab32ef5d1203509e928b451bbadc886d3ebe114e2fff91e94ddedea5dbe0d3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.20/elisprs-v0.1.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26c83f31758a21414e184c9e9c383e3cd4a87d075de503478b35335c8337ebfe"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.20/elisprs-v0.1.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18cf1125bd11ee663b586cf316c3f5eaa02f02dfc849061ca286a34f25cdde32"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.20-x86_64-unknown-linux-musl.tar.gz  sha256: 1525d10296e7657ad87fccc8763a6686a775bbe989db9731472b01be5e153aac
  #   elisprs-v0.1.20-aarch64-unknown-linux-musl.tar.gz  sha256: ba2dbc88b094d6d878a0c075cdb49f342862793122a446672db0c6a989a3cc96
end
