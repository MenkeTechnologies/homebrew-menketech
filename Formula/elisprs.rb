class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.6/elisprs-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "1bda273f8fed15f9c0498736d37c77544dc5cfa78781d1f2b2e6eeec46afe16e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.6/elisprs-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3da89785bd3cdce7054b855a4cbd9caa072ddd6ab61aee6fb3db3ef0e0243137"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.6/elisprs-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06b38fd0e7b1be8dfb1d65b8f91866fcc2e8b0f93d95077eb2352840bdeb1b35"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.6-x86_64-unknown-linux-musl.tar.gz  sha256: 2b4cd5f33df48b0eb42392dd54062be46636b3cecf31e79e887f0115fb7b910c
  #   elisprs-v0.1.6-aarch64-unknown-linux-musl.tar.gz  sha256: d1c9112b6a4e91e345897dbdf86d53b826a81569409df11e4c5196cec3ecc776
end
