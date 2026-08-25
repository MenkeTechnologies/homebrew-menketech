class Rlang < Formula
  desc "Compiled R runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rlang"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.2/rlang-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "899d45ef681baee506eddf01a01026190d5fdf03817b4945def0cf20a661ba3c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.2/rlang-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "a41c929301a56323ee645cb5c3e0da11782f1c262b6741ec8b97266bffef5d29"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.2/rlang-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e4034f52682918edabcd3c4250c2aaf428f0fe3451444f20a012515d4e3d9c4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.2/rlang-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34c1de9b942b184eb33b2ddea1015db3f49dd40138135e365c13df3e5a5aaf80"
    end
  end

  def install
    bin.install "Rscript"
  end

  test do
    assert_match "42", shell_output("#{bin}/Rscript -e 'print(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   rlang-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: 78b91718df492d07d34a674b12230b5a1dc797478f7ff84af3a4d6ce5f5320d8
  #   rlang-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: 6340219e53c491cd7ada76c6600332846ba692150e6136f12d43aa4768f57e8b
end
