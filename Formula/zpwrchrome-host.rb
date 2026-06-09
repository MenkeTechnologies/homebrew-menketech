class ZpwrchromeHost < Formula
  desc "Native messaging host for zpwrchrome — Unix pass + segmented downloader + OTP"
  homepage "https://github.com/MenkeTechnologies/zpwrchrome"
  license "MIT"
  version "0.9.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.6/zpwrchrome-host-v0.9.6-aarch64-apple-darwin.tar.gz"
      sha256 "e495d75b0321551a5b76b01f0cd977520fde1d9e034a1abf7f13c5f6f455123d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.6/zpwrchrome-host-v0.9.6-x86_64-apple-darwin.tar.gz"
      sha256 "08ddad0a87165e5cc74c4a5953f4a0be946b6f11a9f45509669f341f81b79a07"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.6/zpwrchrome-host-v0.9.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d60a745fb008390a39ba808ec14baa1580bc6a12e9a35bce5e52b6e75fa72b49"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.6/zpwrchrome-host-v0.9.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2514b3f5fc17851eb05199d72167acb0ad5baa6697c6d0851ad063b8d4adb508"
    end
  end

  def install
    bin.install "zpwrchrome-host"
  end

  test do
    assert_match "Browserpass host app version", shell_output("#{bin}/zpwrchrome-host --version")
  end
end
