class ZpwrchromeHost < Formula
  desc "Native messaging host for zpwrchrome — Unix pass + segmented downloader + OTP"
  homepage "https://github.com/MenkeTechnologies/zpwrchrome"
  license "MIT"
  version "0.9.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.9/zpwrchrome-host-v0.9.9-aarch64-apple-darwin.tar.gz"
      sha256 "af431020b85806b38a4f29567c103cc095b23ccd4e0acef3150ef77be3160b36"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.9/zpwrchrome-host-v0.9.9-x86_64-apple-darwin.tar.gz"
      sha256 "f6eee37d8c691bdacdd0add7e6d0a1bdd603c1603c839248478c2866b4a058dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.9/zpwrchrome-host-v0.9.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0230eb8e8cda9e22f043dc50ee4529da8d151326e1baca425bbeb73bc0091969"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zpwrchrome/releases/download/host-v0.9.9/zpwrchrome-host-v0.9.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9333a44b5b1e01e7fc853526be80ab4a86ad3367ceb6ef60ec49555361e5f864"
    end
  end

  def install
    bin.install "zpwrchrome-host"
  end

  test do
    assert_match "Browserpass host app version", shell_output("#{bin}/zpwrchrome-host --version")
  end
end
