class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.3/vimlrs-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "d8653359259da7e02650964f379c5cde78f4c7e9c49156298e5e4741b7952fed"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.3/vimlrs-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "db69097d55264cd083d657b9dd3613f4ec0287601eadc339e0fe85901a5aa3df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.3/vimlrs-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3675539b01ea38627f2ebde50e0547e71db7ca56a09b20693c7e024fdd4a700b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.3/vimlrs-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6227bc2b227e00dd2261714432724d06c9149c1d9f5ca6276866e9e97794bb11"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.3-x86_64-unknown-linux-musl.tar.gz  sha256: 080fe9f22940cb6a156e48333e2b6eb20d98ced94d3f4f532dbbc7e056a43318
  #   vimlrs-v0.2.3-aarch64-unknown-linux-musl.tar.gz  sha256: 9d5a66995beb4adf30c7817c14463e8fa0251172e42eafc8cac2acfbf3500f9a
end
