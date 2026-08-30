class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.54"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.54/stryke-v0.17.54-aarch64-apple-darwin.tar.gz"
      sha256 "692109622dd978188a930689e1e479e51654fdffc0a41ff84bdabe4fb150705f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.54/stryke-v0.17.54-x86_64-apple-darwin.tar.gz"
      sha256 "afcabeb49a80dafa9a449a02367d1b001a9f761b2d50920af101a1f32e459020"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.54/stryke-v0.17.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8003cda023690099c47226d87aae851145d5902d79b9a72708502af26a8af7f2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.54/stryke-v0.17.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fbb4cdcc996713380edd4f234d1da12ecb99de8a6bae18ef7b8738e989b6da1d"
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
