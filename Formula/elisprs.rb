class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.16/elisprs-v0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "ffabbd018f155c27abe8ef3a728d3076a34f7e012347f4eff770b21f6b69fb49"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.16/elisprs-v0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5445d65df06842cd63d3a0dc10077a38b2f200cc80fa30faa29d5c7c94c95da3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.16/elisprs-v0.1.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b672ef7c430b18757fba0206c97d2efda384b953b0902ccddd1c6bac897ca021"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.16-x86_64-unknown-linux-musl.tar.gz  sha256: 60f0408013ea3825d1b8ead160c453a69d07d075ec47e6ff95af87f5741c5e3b
  #   elisprs-v0.1.16-aarch64-unknown-linux-musl.tar.gz  sha256: a9b22c31c45d042f587f25f454bb4e1e7e77cb82afadab9013e151f409a72512
end
