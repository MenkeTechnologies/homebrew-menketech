class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.26"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.26/stryke-v0.17.26-aarch64-apple-darwin.tar.gz"
      sha256 "648bf05865ff777b819b85afd94fe6339bbbaa257c5a3e864fcd6533750d5d70"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.26/stryke-v0.17.26-x86_64-apple-darwin.tar.gz"
      sha256 "2574ce47efe066fbf11b9985c3b5c27127ba2304f8d9b1355edcf74f85b9e3a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.26/stryke-v0.17.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.26/stryke-v0.17.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7069537b67dc5528498258469836b85d1466d7f1f7594ed8fff3f590bf7a6b06"
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
