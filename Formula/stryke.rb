class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.30"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.30/stryke-v0.16.30-aarch64-apple-darwin.tar.gz"
      sha256 "b5e3e4ddf784bc536f9afbbf942d047db1a52ba0cf7b24af12c0663e92379a3a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.30/stryke-v0.16.30-x86_64-apple-darwin.tar.gz"
      sha256 "2721ed6ec6a54345f33bc2d47a6117c236cb8135e931aa1058cf7b72bb92c5bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.30/stryke-v0.16.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.30/stryke-v0.16.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d07ab3f92de3efe67bdaaeb4d8975e075edfdac1f88948ba4d5a7664d5f50e9f"
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
