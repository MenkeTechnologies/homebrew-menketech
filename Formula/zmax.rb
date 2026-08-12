class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.51"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.51/zmax-v0.4.51-aarch64-apple-darwin.tar.gz"
      sha256 "bbd580e354252ca5c1abe429a567729eb8a98ed871ddf75bc9bef10ae9a49b67"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.51/zmax-v0.4.51-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9181d1526c7afc642b2de2ed663a2e1f3a58ddcb5c5c3e4f51d5c482f8f5ebf3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.51/zmax-v0.4.51-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4f027d73b7e9116e2eee49b46e042b48f5a29b36142ad9dd9e427278a771985"
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
