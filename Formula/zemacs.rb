class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.14/zemacs-v0.2.14-aarch64-apple-darwin.tar.gz"
      sha256 "f94095f245ecf1f9d5aa8e204cd1903fc87e668023782309a9b1e1526e85ecdb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.14/zemacs-v0.2.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e34b2f9b37ae089b702c7b7c9ea55c4b048405affb8687407a739b9ec3948c5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.14/zemacs-v0.2.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f98191645a464c3474042f46512b965e1282322e54f7764b3111115e7d30a57d"
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
