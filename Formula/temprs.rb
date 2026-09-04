class Temprs < Formula
  desc "Temporary file stack manager — atomic flock-protected master record"
  homepage "https://github.com/MenkeTechnologies/temprs"
  license "MIT"
  version "2.9.20"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.20/temprs-v2.9.20-aarch64-apple-darwin.tar.gz"
      sha256 "f9f814ec15de77a37bfcf99b0bc2e5f62eee96370232b5bd243b551a92022001"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.20/temprs-v2.9.20-x86_64-apple-darwin.tar.gz"
      sha256 "44ab31c285cd77693143267f75712f01fc62179e46ed01452b8ff9526fd9b426"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.20/temprs-v2.9.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09742e09684a45d659199a034f820a0e17fa938ec81a7e6777fd1fa8394949e1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.20/temprs-v2.9.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e4cdbf688cf9dcf46f9d93268884f9e7eb81a492dbe5f210fb0bd39a6d7400e"
    end
  end

  def install
    bin.install "temprs"
    bin.install "tp"
  end

  test do
    assert_match "temprs", shell_output("#{bin}/temprs --version")
  end

  # Static musl tarballs also published at this release:
  #   temprs-v2.9.20-x86_64-unknown-linux-musl.tar.gz  sha256: 1d55751c866b1cef3c9d28c72df42d1cdd5cffb754398c5e632e26e705f4620c
  #   temprs-v2.9.20-aarch64-unknown-linux-musl.tar.gz  sha256: 15540c93560e9cd298076ecba55235b1522dab7d11f281bf56a6f990bbb198ab
end
