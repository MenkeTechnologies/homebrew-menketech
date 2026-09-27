class Rlang < Formula
  desc "Compiled R runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rlang"
  license "MIT"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.9/rlang-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "8d90a9fc94f87f6c9dec930e9d8a1127054e1bd31eaecdc320f57dcb58f2409b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.9/rlang-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "55bebb722109f24d872445102292820c391263b316af38be8fffea24117b0d8c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.9/rlang-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7ba09cec3801356e8319394f27c9f1c68165e75cdc2ebeac6648e979415e1d3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.9/rlang-v0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d09f79ebf61847e3ccc4cc398eaba83c7d38ab6eb32597782979515c092d24e6"
    end
  end

  def install
    bin.install "Rscript"
  end

  test do
    assert_match "42", shell_output("#{bin}/Rscript -e 'print(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   rlang-v0.1.9-x86_64-unknown-linux-musl.tar.gz  sha256: fcf9974f22ad181438593d1290f8339d1e13106f33929672c33d2dd53620f99e
  #   rlang-v0.1.9-aarch64-unknown-linux-musl.tar.gz  sha256: bf02996be9a15a3a25e154793db19fdee6074992f505acd9fdbdb2e4ef31a2ad
end
