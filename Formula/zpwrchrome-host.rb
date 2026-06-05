class ZpwrchromeHost < Formula
  desc "Native messaging host for zpwrchrome — UNIX pass + segmented downloader + OTP"
  homepage "https://github.com/MenkeTechnologies/zpwrchrome"
  license "MIT"
  version "0.9.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.5/zpwrchrome-host-v0.9.5-aarch64-apple-darwin.tar.gz"
      sha256 "8fb1419efc7cb012614d76928f2fe8d66ce4d65b87674dfa1d081e04c05838f7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.5/zpwrchrome-host-v0.9.5-x86_64-apple-darwin.tar.gz"
      sha256 "7eb7fb8765afeef4333e4ff6733da4f6a480634c624ef6dfad9a9159adedab5c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.5/zpwrchrome-host-v0.9.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "914d9ec5dd3e4d5dc38db946eb91bddef2b45b071e2b5313bf89d27a1563afe6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.5/zpwrchrome-host-v0.9.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "249ae18b32e662f6ad58fc0d41aa332954f11f2067994efd17c00d7676ce895a"
    end
  end

  def install
    bin.install "zpwrchrome-host"
  end

  test do
    assert_match "Browserpass host app version", shell_output("#{bin}/zpwrchrome-host --version")
  end
end
