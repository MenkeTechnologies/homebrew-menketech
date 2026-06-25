class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.27"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.27/stryke-v0.17.27-aarch64-apple-darwin.tar.gz"
      sha256 "54a0de43cbce6fe621b72955f8675f2cfa5ecc1f8e6ed5d0a70cfea34688bcaf"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.27/stryke-v0.17.27-x86_64-apple-darwin.tar.gz"
      sha256 "505bae2d92bb365359cd11f87362b843a5bd3b1712e84aba5e73174af4de1200"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.27/stryke-v0.17.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.27/stryke-v0.17.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc6c86482db2578b0a498e59bcfbddfc39764683ecbde53a386fc3b8a34b116d"
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
