class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.33"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.33/ztmux-v3.7.33-aarch64-apple-darwin.tar.gz"
      sha256 "ed3bba69488c957bf77f6d9d1366198f6bd679ab84d7874b4d355094f7cf9f3b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.33/ztmux-v3.7.33-x86_64-apple-darwin.tar.gz"
      sha256 "34a64962840fa22d9d93dfa6a6e7caa67c5e2a7d4fb4b5f84b8ec794f288a9aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.33/ztmux-v3.7.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b527db46bc64b17112102827bb1b62b5bdd6716dfda5aa044104f63b7e3d2a23"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.33/ztmux-v3.7.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b409f9ac0ed156494eacbac1489c6b871b858e62e508442e144a5444de033ac7"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
