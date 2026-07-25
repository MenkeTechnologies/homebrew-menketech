class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.43"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.43/zmax-v0.4.43-aarch64-apple-darwin.tar.gz"
      sha256 "36d7a8157d14bf6f8976820ebe1340090ea84c0adba22df7dc6d39494f19cb8b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.43/zmax-v0.4.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65ec93f8a833f9f7cf2f2c4019313601a557737451598ce1662a765f17a6a4fc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.43/zmax-v0.4.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95d157ec8e675c0eced879265278c1467ae84aefee1aa9b884995b6ab4808950"
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
