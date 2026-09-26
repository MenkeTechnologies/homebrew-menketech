class Rlang < Formula
  desc "Compiled R runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rlang"
  license "MIT"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.7/rlang-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "04c8e0b5388b339b69b422c30408baa9d3e17f6faf1b4a2066d5e800ddf41db3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.7/rlang-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "7130821fde640372630ebc52b6fbea485d929923daa24fd461d5dd47dadccba0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.7/rlang-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "683045bd46231b924886f394152b57a04e6c6d04ba916d50435bcce154b64acf"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.7/rlang-v0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "162caf262cbb09d8b85db5ef9dcd1d63ca190af5a55444ee258171c87c17830f"
    end
  end

  def install
    bin.install "Rscript"
  end

  test do
    assert_match "42", shell_output("#{bin}/Rscript -e 'print(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   rlang-v0.1.7-x86_64-unknown-linux-musl.tar.gz  sha256: 996cf1647c371b4cb1faf01e2986fdeaf2ec79d191354b6c4ba795fe4b24d3cd
  #   rlang-v0.1.7-aarch64-unknown-linux-musl.tar.gz  sha256: f4cf1c7b43a2145c0af37105650c17d0ea544f704c832a91ef6e7c7fd0094e15
end
