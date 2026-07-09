class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.14"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.14/ztmux-v3.7.14-aarch64-apple-darwin.tar.gz"
      sha256 "3255396cbb03a9984c6bcd5461366598d5ebe975304abe819bf3c9bdef13a74d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.14/ztmux-v3.7.14-x86_64-apple-darwin.tar.gz"
      sha256 "1ac53373a0f8de1d3096111c1cac33b7712118b975322e733b7b4cda3f83593b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.14/ztmux-v3.7.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "faddeff5907e6ae86b138cf5d0fa9dbea3f1649c36f65c624de29d15e83cd672"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.14/ztmux-v3.7.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d579a70e0c693e8ef8988d5700deecc9a4a471a9480645f67040c7aeda1ccb69"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
