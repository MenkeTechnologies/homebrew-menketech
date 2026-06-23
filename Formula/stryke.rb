class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.24"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.24/stryke-v0.17.24-aarch64-apple-darwin.tar.gz"
      sha256 "d74ca9fc2abb33c0c89eff7cfebeda6fd1cc71f4d85b992f7f524cfa98a08a71"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.24/stryke-v0.17.24-x86_64-apple-darwin.tar.gz"
      sha256 "eca4b6d8ba29b03fda09ec0040a3db2c1d825cdea4de33d4b6f20322ea17144f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.24/stryke-v0.17.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.24/stryke-v0.17.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5665084e1b59ba73bcfa7c888909da38e453bb68421eb26071a76574c00b22e"
    end
  end

  def install
    bin.install "stryke"
    bin.install "st"
    bin.install "s"
  end

  test do
    assert_match "hello", shell_output("#{bin}/s -e 'print \"hello\"'")
  end
end
