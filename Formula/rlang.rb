class Rlang < Formula
  desc "Compiled R runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rlang"
  license "MIT"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.5/rlang-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "d419a1deb45d44e65fa52f2833a3671094313402d6d31a161553e5ceb5caa062"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.5/rlang-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "995cd098b50a3d81db8cceaa22a4621c8e1cd641660480320731046a02bc98f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.5/rlang-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb63fbdb600753dadb15524d446ac22934610cc2613579b42624a9305bd94580"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.5/rlang-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "53bf151d5aa2f8ccafeb1a2e2cebcfcd598dfec9702ef59f1cbf515b6315328a"
    end
  end

  def install
    bin.install "Rscript"
  end

  test do
    assert_match "42", shell_output("#{bin}/Rscript -e 'print(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   rlang-v0.1.5-x86_64-unknown-linux-musl.tar.gz  sha256: d59b3dd9bdcac7a717ce71ab1287c203adcf8ac43d3a5384a838c28faf566e7b
  #   rlang-v0.1.5-aarch64-unknown-linux-musl.tar.gz  sha256: dbaefe1a6b0e6071ad3a37146d7ec1a4bc8bc3c9402dade7abf0123440f3044c
end
