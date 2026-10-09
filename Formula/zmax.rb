class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.79"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.79/zmax-v0.4.79-aarch64-apple-darwin.tar.gz"
      sha256 "acacfb6567b9d86ea5d28c2b4ec79568b59f1448fb9e356b6951d9574a931ad6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.79/zmax-v0.4.79-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44c7a641258a198dd6a05850a00dc9a87e3b1d9ef97355b732c7b6f93fb28f48"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.79/zmax-v0.4.79-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c2536a3e02f62e70516a809fd9be96962aeea8381384d05200075e9ec92ebf0"
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
