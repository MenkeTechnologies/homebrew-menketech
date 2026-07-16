class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.30"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.30/zmax-v0.4.30-aarch64-apple-darwin.tar.gz"
      sha256 "c1b86587092bb5c4a4317084603908452d0f5b75ec07c51db29721178e9cbde5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.30/zmax-v0.4.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "24752b077a61b329eaf9278108a05982d929ea4812ab5c7d71d8342c8d04ac54"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.30/zmax-v0.4.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d032a290d81e031930ec27c4bb22c85e90435592e58eb2c6e8b8bde47fb30c4"
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
