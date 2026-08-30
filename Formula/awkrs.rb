class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.5.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.4/awkrs-v0.5.4-aarch64-apple-darwin.tar.gz"
      sha256 "cb2fb5c860d350e2b1c8ffe9982557f82d41edec959ae1ead523debec065452c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.4/awkrs-v0.5.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "393fd0fba8aa5faa1bb4bb1d243feccef3964a20939887de51fecf4f42529465"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.4/awkrs-v0.5.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "402cb0a873f7a5deaba5b78cd19115ef493c52d05e365403b6c009dab7d9d8a6"
    end
  end

  def install
    bin.install "awkrs"
    bin.install "aw"
  end

  test do
    assert_match "hi", shell_output("echo hi | #{bin}/awkrs \x27{print}\x27").strip
  end
end
