class ZpwrchromeHost < Formula
  desc "Native messaging host for zpwrchrome — UNIX pass + segmented downloader + OTP"
  homepage "https://github.com/MenkeTechnologies/zpwrchrome"
  license "MIT"
  version "0.10.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.10.1/zpwrchrome-host-v0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "83c8ba70fb0eb14b5abe88126b5a8d9229dbf4854f5fbf93a3ccd00902d9ee72"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.10.1/zpwrchrome-host-v0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "7553509a4c138b1c3f673ac1cd9c71551505e251e674787a224559568f0b89e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.10.1/zpwrchrome-host-v0.10.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df42e6173681d297381402d8cf7dc4a3a56048b618f25f5e5185e85598d8741d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.10.1/zpwrchrome-host-v0.10.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a819bf1a8f77364ab355971a3795d14dd371b8f21256f874044c0f1e7e64cdd"
    end
  end

  def install
    bin.install "zpwrchrome-host"
  end

  test do
    assert_match "Browserpass host app version", shell_output("#{bin}/zpwrchrome-host --version")
  end
end
