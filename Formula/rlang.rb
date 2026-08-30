class Rlang < Formula
  desc "Compiled R runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rlang"
  license "MIT"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.6/rlang-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "26a50de415172616318934c60ee245cf425eca265c4714050b7f7e001a9b4e96"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.6/rlang-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "a20b0c08253d9569399508e4639b07b90f8065d85594e0360b5d846be2164794"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.6/rlang-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e48e8089a44af066eeb0b05bdd6946ea97889d79a0c4ec692ae59e5d10c91cd"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.6/rlang-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b3ad89a72cfa7e7205b97f0c777b3695a1c569255942184546f0672eb2cc825d"
    end
  end

  def install
    bin.install "Rscript"
  end

  test do
    assert_match "42", shell_output("#{bin}/Rscript -e 'print(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   rlang-v0.1.6-x86_64-unknown-linux-musl.tar.gz  sha256: be28e0d0deac6b26b81dad80d0482e7bd66140bf90ded50355e5ddd0cbd037f9
  #   rlang-v0.1.6-aarch64-unknown-linux-musl.tar.gz  sha256: 53fe78658ebae48800f6ca4ef2c57104f8db6b0ffd30c4b676ac543614bd86d9
end
