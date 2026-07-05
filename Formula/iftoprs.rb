class Iftoprs < Formula
  desc "Real-time bandwidth monitor — Rust iftop clone with ratatui TUI, 31 themes"
  homepage "https://github.com/MenkeTechnologies/iftoprs"
  license "MIT"
  version "2.22.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.9/iftoprs-v2.22.9-aarch64-apple-darwin.tar.gz"
      sha256 "8051ced65ba266030e8508abc60484b0e5b5915c86bfc032c62f5f16e22d0b48"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.9/iftoprs-v2.22.9-x86_64-apple-darwin.tar.gz"
      sha256 "8a0c6ad14a6c1d2e10d743116aea0139ce3a4314f0f70bd3b2a257df953b37e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.9/iftoprs-v2.22.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9bc7f5ef4634fdb22c80efa545e7014252ac25b84e9729d458fe0d776febbe3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.9/iftoprs-v2.22.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd2c6f22f5f4e322017d91239b49aaeda22bfe427d92c5259d2650237e10301c"
    end
  end

  def install
    bin.install "iftoprs"
  end

  test do
    assert_match "iftoprs", shell_output("#{bin}/iftoprs --version")
  end
end
