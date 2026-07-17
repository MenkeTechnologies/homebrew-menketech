class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.33"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.33/zmax-v0.4.33-aarch64-apple-darwin.tar.gz"
      sha256 "d1706ec421eebfe83759373972cac07de5bf0da0c1fdb88cc6db5f2cf8ba1051"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.33/zmax-v0.4.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73d58c474248e8af57518ac3d91ac8aaaa170c54111421ba26be9e911ec6d84e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.33/zmax-v0.4.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03d20a57adee847071b132b085177edb00b40e1d304ce5e6a95e04c2baf7c270"
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
