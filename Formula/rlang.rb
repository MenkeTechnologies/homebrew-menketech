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
  #   rlang-v0.1.2-x86_64-unknown-linux-musl.tar.gz  sha256: 23e2bd1bd169051d08a7d91dac64b6f2b7fc33c739ad152dc7f34dc4b5e2c869
  #   rlang-v0.1.2-aarch64-unknown-linux-musl.tar.gz  sha256: 1b11f1d2f01a6f909a814c5b742061bb1c17d66f633de34bf7a3ac1b140deccc
end
