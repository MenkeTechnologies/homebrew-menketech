class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "MIT"
  version "0.5.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.8/htoprs-v0.5.8-aarch64-apple-darwin.tar.gz"
      sha256 "5487974abcb6fa3d139ae6a2e238080862a48387540566b8463306f1e160ce55"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.8/htoprs-v0.5.8-x86_64-apple-darwin.tar.gz"
      sha256 "528d19cc593e90c3ed1bd3590300b83e72154cfdcfa2f44cad41b2e125399a66"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.8/htoprs-v0.5.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f00694cb304a865173c33eb99d57db790b50d116780508d27591f8361d8aee3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.8/htoprs-v0.5.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb9171c7bcdc390ca1811dc967a30b54eb2dfed7c0cf0c443ba91c784bd37c7d"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
