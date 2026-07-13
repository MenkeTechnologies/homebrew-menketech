class Grcrs < Formula
  desc "Generic Colouriser — a faithful Rust port of grc"
  homepage "https://github.com/MenkeTechnologies/grcrs"
  license "GPL-2.0-or-later"
  version "1.13.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/grcrs/releases/download/v1.13.0/grcrs-v1.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "13ff17a14cfd77350e5b168f019697f1151a1ca7d55f005b2e36eaed3e9ec9c4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/grcrs/releases/download/v1.13.0/grcrs-v1.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "a3855258f2a00b2c208e8af02927f27e45df098ef3d936dc8bbbfdf2474af0e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/grcrs/releases/download/v1.13.0/grcrs-v1.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ca5c7832dcb65fa0795854313c358940a7ed523da7ea3992b2941e5cca7fe67"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/grcrs/releases/download/v1.13.0/grcrs-v1.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "77a87a66f7150df13ac703d31a56d95bcd9558574a354c74bb9d336bee8079aa"
    end
  end

  def install
    bin.install "grc"
    bin.install "grcat"
    etc.install "grc.conf"
    (share/"grc").install Dir["conf.*"]
  end

  test do
    assert_match "Colouriser", shell_output("#{bin}/grc --version")
  end

  # Static musl tarballs also published at this release:
  #   grcrs-v1.13.0-x86_64-unknown-linux-musl.tar.gz  sha256: b7fd246a4be48818dbde556d7b3445f73e7db627e745110f35382d1afcc18bb2
  #   grcrs-v1.13.0-aarch64-unknown-linux-musl.tar.gz  sha256: 878a81654bdb6637f146a8ed339243ae44830eda3babf18e14657ac219f6b8c3
end
