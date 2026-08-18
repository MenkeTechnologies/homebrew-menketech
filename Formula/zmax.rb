class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.57"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.57/zmax-v0.4.57-aarch64-apple-darwin.tar.gz"
      sha256 "e937fc8c83c2eac9079eef3be39720c0dea626be7c8125dc0607545be605235f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.57/zmax-v0.4.57-x86_64-apple-darwin.tar.gz"
      sha256 "292a7d5f6934c8b32bda6dcd20b40b8dbf48e22237892b5f205731521b8a2adb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.57/zmax-v0.4.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89a4002d88e013d8deed3dc0a0766ff5b235047c46a12e7b40ee9a2c21d1def0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.57/zmax-v0.4.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5591b24535fd3e942fd0c0c39bbdf51d150a53f16facafa5168d9667f85cf57d"
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
