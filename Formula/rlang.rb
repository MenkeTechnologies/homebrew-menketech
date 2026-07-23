class Rlang < Formula
  desc "Compiled R runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rlang"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.0/rlang-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "656fccb1fbf93b5f7c215fdbb60984055f45eddbadf1ca391fe5ea28c5d304c7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.0/rlang-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "0f8230a8d97676d79d60991d8056ab9761c8c5e70ae7e5a4538cdc31054c791e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.0/rlang-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a1eef2c20e726716a1fd7891be1cfb6f0309a849b797d916b0f4c6159dd2941"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.0/rlang-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4e596da82072efc94943eed102d36f70997c4ae6128a3388f385e59b6fc394b7"
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
