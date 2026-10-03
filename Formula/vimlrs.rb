class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.17/vimlrs-v0.2.17-aarch64-apple-darwin.tar.gz"
      sha256 "4944d159430b201274df0ba7100357b5ea9471834a78cb9ae5fb1786a0bd27d3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.17/vimlrs-v0.2.17-x86_64-apple-darwin.tar.gz"
      sha256 "698a0901468bd9477bc44e09bd242b1bf3329db32a1e3fa9f00a857f243e61f8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.17/vimlrs-v0.2.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "825d62911c82931398d7847241bd9f4e41dd11e5ac414a40e040b30e1132682c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.17/vimlrs-v0.2.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b55e4e04dc6d40c0ebfa01bba68ce6315a4e7254a17a574a403815e48a25d14"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.17-x86_64-unknown-linux-musl.tar.gz  sha256: 9d1e2eebca24bdeff4db47c94a323fe4f5e7311e2b32866b8db32a0842d4fe0e
  #   vimlrs-v0.2.17-aarch64-unknown-linux-musl.tar.gz  sha256: 8b8a7aea8ec2082b6d0bd79203b8652d670ed18c6149c4290a460adea568ed6a
end
