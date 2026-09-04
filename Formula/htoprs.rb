class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "MIT"
  version "0.5.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.16/htoprs-v0.5.16-aarch64-apple-darwin.tar.gz"
      sha256 "e749e55229b11465e8ca858cb71896ee7fb0f933c7b717da4fab19f76977703f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.16/htoprs-v0.5.16-x86_64-apple-darwin.tar.gz"
      sha256 "d4d9e0ac25a4700440f5880e25ab89096f9dcf35ed9371fbb52b6f49f9a2b4f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.16/htoprs-v0.5.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd1b235a8dcefe2e16a09a0efbed4d558fa4870d582c0be7818f1ff8eb6b66ac"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.16/htoprs-v0.5.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5891a400d184c288bae2860e3915194b6b85f945ac8dd6d30e5a461b3f58a945"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
