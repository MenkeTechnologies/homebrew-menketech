class Lsofrs < Formula
  desc "Rust rewrite of lsof — 5–21× faster, 7-tab TUI, 31 cyberpunk themes"
  homepage "https://github.com/MenkeTechnologies/lsofrs"
  license "MIT"
  version "4.8.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.8.5/lsofrs-v4.8.5-aarch64-apple-darwin.tar.gz"
      sha256 "00cbd39f7490a3d9773a4f662bbb710cee9b59095e9b7009eaa3bb3ce03638ce"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.8.5/lsofrs-v4.8.5-x86_64-apple-darwin.tar.gz"
      sha256 "a1a73fc325f83c9f75ae70bfc5f8c577d11148cab735d919907efc395cb02b6e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.8.5/lsofrs-v4.8.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e7fb9a34fe84e3712b1261ca763d9c5f7d84f4630f26a3807a3b793a956a0df"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.8.5/lsofrs-v4.8.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "397cfd669a67c37cc5a939d455cc8caaff4a53d05720bd2d070f657382063ac2"
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
  #   lsofrs-v4.8.5-x86_64-unknown-linux-musl.tar.gz  sha256: b71b2f2adb636623ab07790c2396761ba8d7b346a91c7e115432a677665c38e8
  #   lsofrs-v4.8.5-aarch64-unknown-linux-musl.tar.gz  sha256: b0176ceafe852409fa434e6ce27355d3bf351833a4fde28d157c742520257de9
end
