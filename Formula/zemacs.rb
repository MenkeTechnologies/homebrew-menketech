class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.9/zemacs-v0.2.9-aarch64-apple-darwin.tar.gz"
      sha256 "f20a00a0d11b48ed63386e318a6a8e74122ad9297d1b1283d165b69aca914068"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.9/zemacs-v0.2.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "535aeccc2077b449653ae71949b69cfcf4f46d69502db32834eaf18ffac2a403"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.9/zemacs-v0.2.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b74dcbc3d3ed5dd5e6442ec80ab32c31e4522c4a63a1cb7205c8fd9604f71f6"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"zemacs"
  end

  test do
    assert_match "zemacs", shell_output("#{bin}/zemacs --version")
  end
end
