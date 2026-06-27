class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.32"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.32/stryke-v0.17.32-aarch64-apple-darwin.tar.gz"
      sha256 "dd86e4a57ef4d9977402c8c6e6919c7c625f7880da62b9bcf33d77cdedc20385"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.32/stryke-v0.17.32-x86_64-apple-darwin.tar.gz"
      sha256 "69b29f574edfdffd41d5a5926e86608a56035fffb710b487ba187acea83a8f25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.32/stryke-v0.17.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f06bcbfe6a6086c29c3b67d520cf3d6d3933f0c0a67147a16864e5f768e874d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.32/stryke-v0.17.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41a4b56a7c6a60a8637e622e87de437431bc4468b0013269257afb750db9f5ec"
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
