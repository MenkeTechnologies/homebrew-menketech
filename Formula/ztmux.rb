class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.38"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.38/ztmux-v3.7.38-aarch64-apple-darwin.tar.gz"
      sha256 "e0abd39338f05ca576cc0134ee36ece87b6a1353f448c2478037dbc420409cf5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.38/ztmux-v3.7.38-x86_64-apple-darwin.tar.gz"
      sha256 "62454bcc0c292d2ab2641dffb665dc4bd61c50f2c27ea7f7a07ca7e0da5a4de4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.38/ztmux-v3.7.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b108a3993641c6844a799c1b08c0f441d612fe19287fb7666e75334cd6b40b01"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.38/ztmux-v3.7.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b50b6cdeb651a0eb04e45d9e1eaecfc699650d18bafbe23c85df6407651be27"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
