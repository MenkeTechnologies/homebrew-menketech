class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.50"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.50/zmax-v0.4.50-aarch64-apple-darwin.tar.gz"
      sha256 "c461e5b0bfe370c1556bf52a7653cd77d1bf477687f122e98ac08088e2662c7b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.50/zmax-v0.4.50-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e73bdda9fdb226989d9f75eaf0f42c1db171684e1d976bc528cab7e73324da82"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.50/zmax-v0.4.50-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "478d2db61898528f809d7990e125fe767d7264e808590d6699da818f941dd27e"
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
