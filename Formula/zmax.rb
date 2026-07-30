class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.47"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.47/zmax-v0.4.47-aarch64-apple-darwin.tar.gz"
      sha256 "59f139c3c4b449bb68056eb893c03e3e9b0a27c6ba3168720e45b607e7199e6e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.47/zmax-v0.4.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1accd0fb007886a8ca591aff4f762fc33e2666897b22fb8351a4c36321dc2b27"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.47/zmax-v0.4.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec230efbf1b0b8b8af906f834b39855a47cd24b7198f14ae1ee2c95e1a18893b"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"zmax"
  end

  test do
    assert_match "zmax", shell_output("#{bin}/zmax --version")
  end
end
