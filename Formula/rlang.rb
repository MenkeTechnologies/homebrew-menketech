class Rlang < Formula
  desc "Compiled R runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rlang"
  license "MIT"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.10/rlang-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "cf4fc2a0a79a2a2cf80dd539d733a01ff76545feca481a0a0b2b19cd62e756d1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.10/rlang-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "2c7ec6199a6cf9ab4b73431a025f18c49a5f97e1e3ed2e686476003a35cb6102"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.10/rlang-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73a074a3254da672da2e0fceeb842a039a1c0fbd797ee5a058f8159dd2e03eb9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.10/rlang-v0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "934a1144b0a01b4cfd13c13a18590555bf38ecece9337ce1fdec6d55769e65cc"
    end
  end

  def install
    bin.install "Rscript"
  end

  test do
    assert_match "42", shell_output("#{bin}/Rscript -e 'print(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   rlang-v0.1.10-x86_64-unknown-linux-musl.tar.gz  sha256: 55acb0b4245c64cd555a706df32b2c419e43ef0b9a0ae057f1ee1e703c36c2ff
  #   rlang-v0.1.10-aarch64-unknown-linux-musl.tar.gz  sha256: c4b8d2ee7904b3d95e1f6c118636a7074a51c429c8340c80a7875df691bf6c55
end
