class GoRs < Formula
  desc "Compiled Go runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/go-rs"
  license "MIT"
  version "0.1.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.12/go-rs-v0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "7b0b060b61911e99251c768aed1b8bbd8fbdffa7170010149bbfc043f9608d48"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.12/go-rs-v0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "758e54fbb42c407cfea7e014acd38ab78bd31ca89f2ce5d1874e17d7307b2625"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.12/go-rs-v0.1.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "762203e5152b9786c687d622f59133197c23864bcc751ec67f76a04ed8a9a4d4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.12/go-rs-v0.1.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "99eebf9ae7db645b26d221cad7f04c0f9c220a485cf41206bcc9a1987f5ab4c5"
    end
  end

  def install
    bin.install "go"
  end

  test do
    assert_match "go-rs", shell_output("#{bin}/go version")
  end

  # Static musl tarballs also published at this release:
  #   go-rs-v0.1.12-x86_64-unknown-linux-musl.tar.gz  sha256: 5573d4a376eec98268123b4534fa747d1e189f0562d40a6197b20eeb650420f2
  #   go-rs-v0.1.12-aarch64-unknown-linux-musl.tar.gz  sha256: f1fef11cfb2834ecde3a0f994e48c2147a1a6ce38ce879bcad430e693e81d429
end
