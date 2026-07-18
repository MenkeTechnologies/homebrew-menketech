class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.35"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.35/zmax-v0.4.35-aarch64-apple-darwin.tar.gz"
      sha256 "4b964a7abd5d9486e036c3b7f41c2da96e23fa90d5837a2968790bec0022859f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.35/zmax-v0.4.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "609f7f4f6518c66ff3c106eba12403f9551e20e805139ca985f89b69b1480d27"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.35/zmax-v0.4.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b29e78dd2ac2cf1a0df86bc41e00dc65f668b94d1f1267d8929e649f0bd9bc00"
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
