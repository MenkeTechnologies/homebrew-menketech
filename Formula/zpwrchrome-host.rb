class ZpwrchromeHost < Formula
  desc "Native messaging host for zpwrchrome — UNIX pass + segmented downloader + OTP"
  homepage "https://github.com/MenkeTechnologies/zpwrchrome"
  license "MIT"
  version "0.10.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.10.2/zpwrchrome-host-v0.10.2-aarch64-apple-darwin.tar.gz"
      sha256 "7b3e422f89c28ac4e74d64cbb4f9d76dd0e0a622fe0d81febce73ea58cfcf13c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.10.2/zpwrchrome-host-v0.10.2-x86_64-apple-darwin.tar.gz"
      sha256 "38ee32584e92be604b2d490504e377eff5fff0d77593e107f4e8119795fb34e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.10.2/zpwrchrome-host-v0.10.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63d9daa838c9700f57348cc76515952408f239c58a60575a69fcbf6891fba17e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.10.2/zpwrchrome-host-v0.10.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9370a80f568bb517296b1ab82fbdfb8927c271ef522f698c4de6e258ad7f4752"
    end
  end

  def install
    bin.install "zpwrchrome-host"
  end

  test do
    assert_match "Browserpass host app version", shell_output("#{bin}/zpwrchrome-host --version")
  end
end
