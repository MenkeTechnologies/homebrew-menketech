class Tclrs < Formula
  desc "Tcl compiled to fusevm bytecode — a parser and compiler, no bespoke VM or JIT"
  homepage "https://github.com/MenkeTechnologies/tclrs"
  license "MIT"
  version "0.4.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.12/tclrs-v0.4.12-aarch64-apple-darwin.tar.gz"
      sha256 "1370a59a115961d7dc6a7376688d682a81f2937d84ff78094288ab91634252df"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.12/tclrs-v0.4.12-x86_64-apple-darwin.tar.gz"
      sha256 "34586b993e491f592cddcb587966228bec314a4f1fe5b0c2172e2e600f9eec7b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.12/tclrs-v0.4.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f8808878220d981a2e0c67b657b480ec2ab8f8fa379a70bd42009405eb5a111"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.12/tclrs-v0.4.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a82025065eb1e536bcf327e2a58cf550cf5188be959ec1701f53a70e3f765ac4"
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
  #   tclrs-v0.4.12-x86_64-unknown-linux-musl.tar.gz  sha256: 5e3d84dddcaca281febc58b6d953cc8fbf73ad2b7edb02bca49c8b431b009c81
  #   tclrs-v0.4.12-aarch64-unknown-linux-musl.tar.gz  sha256: b27080c6cdc1a299f25be88bafe4015b64005ded99f9ce7c0bd5eabce834921e
end
