class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.72"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.72/zmax-v0.4.72-aarch64-apple-darwin.tar.gz"
      sha256 "e13f0f34be449c54ca0531e5a2b4c223de1fedf456358031dd3218b54b2c8bc9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.72/zmax-v0.4.72-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ecd3aacd54b9c64be79d5f8c7a31071754693984a31008d22053de140cf07ee"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.72/zmax-v0.4.72-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41b6afd7bb52e7b33a480acf422b64cb2822007069b54065da072e0f651b44dc"
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
