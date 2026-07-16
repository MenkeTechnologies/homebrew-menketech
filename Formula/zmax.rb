class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.31"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.31/zmax-v0.4.31-aarch64-apple-darwin.tar.gz"
      sha256 "4cbc2eadfb5003bee6438d9256591c9702eabc54dd180a34b76ef5e4f6045a79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.31/zmax-v0.4.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41f711390e6cdcfc7b7acd9280c74dc8c511191daba3f8de8401306bad49bc58"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.31/zmax-v0.4.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0eeaa1b67c3990c7b5de6c5fad049d87d9a3366df8e35be087c669a6db19d015"
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
