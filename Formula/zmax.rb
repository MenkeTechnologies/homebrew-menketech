class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.80"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.80/zmax-v0.4.80-aarch64-apple-darwin.tar.gz"
      sha256 "304b7a5c8963e5b7faa5a865cb18c4bc72d8bf0fd1c4c690446dba0af7e192fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.80/zmax-v0.4.80-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "753278ebef89e92cfbe3292a376e4d7ea1db0dc634d85f7a12237be9aaca4a9f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.80/zmax-v0.4.80-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "09c06101c857b08e0d41d3469e74ff1ad0c4ae883c148178fe9fbe53a2a6e1a3"
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
