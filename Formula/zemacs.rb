class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.11/zemacs-v0.4.11-aarch64-apple-darwin.tar.gz"
      sha256 "be5ed7faf6bd204eaaef18652d281281b27154b3f78200bbf1220c165b2c89b3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.11/zemacs-v0.4.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78cf6e3d479d463ea06779c13e910081966f95cad1a969826985037dc665bc1b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.11/zemacs-v0.4.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c55e837966b7c694e06a973031c2f32891b5aaef9e1cae9e2f725c01dd3505d"
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
