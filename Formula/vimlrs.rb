class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.2/vimlrs-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "702a771011af030fb65f776e81efb190d5e997411e3ffd6fbcf645d102383e5a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.2/vimlrs-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "068ce8f425ce2c38f5e905c344fb69aae2dbfc84b36496133ca106385393404b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.2/vimlrs-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e791d2d3055fe589bb85a37833753b767ec875340ef47229ff1aa0ed89387907"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.2/vimlrs-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4dc1c5b7e994a98d7f91a44736c6fa340f6e222563da70ad87dc420f3379b729"
    end
  end

  def install
    bin.install "vimlrs"
  end

  test do
    assert_match "vimlrs", shell_output("#{bin}/vimlrs --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.1.2-x86_64-unknown-linux-musl.tar.gz  sha256: 3f8c6c3a73e128647ab7ebb0e0413ebe2c42b2826750861e53b9fda7d6989faf
  #   vimlrs-v0.1.2-aarch64-unknown-linux-musl.tar.gz  sha256: cde42dd3a2581fff2298625b269ead11fc85dc9d8956e7cef046ec2e38651a26
end
