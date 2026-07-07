class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.11"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.11/ztmux-v3.7.11-aarch64-apple-darwin.tar.gz"
      sha256 "34478f4554c722d2c8356fbfcd39b099f7522c76d5e6933eb7b13508fd4fb130"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.11/ztmux-v3.7.11-x86_64-apple-darwin.tar.gz"
      sha256 "b3083e25978710b0dd5f8970358596dca3ef664b6c33bbda2a4468c9162c45fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.11/ztmux-v3.7.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e2aff6d5316eb04b1d143d607d5c458371b9f29c981e123c1e26e7a0f8334ef"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.11/ztmux-v3.7.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "195810ac25c10aad207f74e616b3705bbc961efe7e5c649427c086de90426163"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
