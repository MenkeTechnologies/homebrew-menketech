class ZpwrchromeHost < Formula
  desc "Native messaging host for zpwrchrome — UNIX pass + segmented downloader + OTP"
  homepage "https://github.com/MenkeTechnologies/zpwrchrome"
  license "MIT"
  version "0.9.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.10/zpwrchrome-host-v0.9.10-aarch64-apple-darwin.tar.gz"
      sha256 "fe5a2e617fb064ae240dbc1e8e9de15488bc7b365356197fc97b400b372159a9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.10/zpwrchrome-host-v0.9.10-x86_64-apple-darwin.tar.gz"
      sha256 "1a1eae7be9d3cf4fd6f7033ee4fc36dd0732fc02810dbe5b8b1b5f9221dc20bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.10/zpwrchrome-host-v0.9.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "83ee4d87a7d2853032034a5311f224b6bdce713f76306feb522935c5d4231603"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.10/zpwrchrome-host-v0.9.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8829a941588f3f1b0a9394d8cdb4ce1498a7219d81e4455d9fd090ef07eb880"
    end
  end

  def install
    bin.install "zpwrchrome-host"
  end

  test do
    assert_match "Browserpass host app version", shell_output("#{bin}/zpwrchrome-host --version")
  end
end
