class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.73"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.73/zmax-v0.4.73-aarch64-apple-darwin.tar.gz"
      sha256 "60dd6edc598b41c49bff33ee24956c413a7563116fd490f9a3655a06301dcac8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.73/zmax-v0.4.73-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "928e5feabbf442ba43bf4784a7bb14100de50ad06c377b66cfd7ca7bf0bb9cac"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.73/zmax-v0.4.73-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04b966da70dbaedbba0f0f4d0a2a1bdc40b49d3e744d5eed05c13c1a59e2b73a"
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
