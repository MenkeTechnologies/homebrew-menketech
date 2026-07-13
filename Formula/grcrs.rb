class Grcrs < Formula
  desc "Generic Colouriser — a faithful Rust port of grc"
  homepage "https://github.com/MenkeTechnologies/grcrs"
  license "MIT"
  version "1.13.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/grcrs/releases/download/v1.13.1/grcrs-v1.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "585bbf2b8a77f3519b7150faf331a98e376c10b1f0973d74563f4f7ba8471f23"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/grcrs/releases/download/v1.13.1/grcrs-v1.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "7f915a5f815295c450d06aa94167df299b54547878b07d871c9ba3261e4f183b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/grcrs/releases/download/v1.13.1/grcrs-v1.13.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d9078236e43b1891aa65f892b3e1e1e07b166206d81a5ae436c065357e1e1e0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/grcrs/releases/download/v1.13.1/grcrs-v1.13.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "752f69d84b4fe331f6049f5c988c2cab1880fa403b2f67f3919a902fc35ae3c5"
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
  #   grcrs-v1.13.1-x86_64-unknown-linux-musl.tar.gz  sha256: cec91329efc3a5c1617bda6caca70b846b2ba6da7c8f8664d118071ca0280c8a
  #   grcrs-v1.13.1-aarch64-unknown-linux-musl.tar.gz  sha256: c644844cb7b55dca600e367bc5d29a06435ce5e7ffff15565a2c0b0d76014b44
end
