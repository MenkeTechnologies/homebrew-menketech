class Lsofrs < Formula
  desc "Rust rewrite of lsof — 5–21× faster, 7-tab TUI, 31 cyberpunk themes"
  homepage "https://github.com/MenkeTechnologies/lsofrs"
  license "MIT"
  version "4.11.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.11.0/lsofrs-v4.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "88f285064c3e33e0deeccd7aea115b901fa9332e1b61f2cf1c5ab551e723648d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.11.0/lsofrs-v4.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "e67b24d34ba1e37e755882d57a95d896f5ad3928c18e10ceb67878561af696c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.11.0/lsofrs-v4.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5673caf1f5b4357ca51412b2411448eae132d40fc6d31942e9c7845990ea6c9a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.11.0/lsofrs-v4.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e90c9b27d13d25270962390d86611a170bad2081e8b51f9ff140019ccc06b6d2"
    end
  end

  def install
    bin.install "lsofrs"
    bin.install "lsf"
  end

  test do
    assert_match "lsofrs", shell_output("#{bin}/lsf --version")
  end

  # Static musl tarballs also published at this release:
  #   lsofrs-v4.11.0-x86_64-unknown-linux-musl.tar.gz  sha256: 6f470798cc93a49ec503ffefad5660e446850b16bdd6594eca70e25b667ca31c
  #   lsofrs-v4.11.0-aarch64-unknown-linux-musl.tar.gz  sha256: d0681d5b853a90bc4cc738e3164a4c59db413bbf3be9432a5f958c7e3de6a968
end
