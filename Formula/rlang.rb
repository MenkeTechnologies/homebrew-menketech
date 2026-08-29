class Rlang < Formula
  desc "Compiled R runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rlang"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.3/rlang-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "c58dbc94c0bf902691202060355600e73171286d0cbfda8220f76d57e6ef1237"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.3/rlang-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "fb23c690745e955a540b1f9f7195f1a0e2a0ee2ed4788a1ad3f479e6ebf83f04"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.3/rlang-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6d1c4478ea1c776c7bcd0779feb369b8d410cdf1d7de7d6cea663492c4835a5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.3/rlang-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6db0c44f67ad5e077645f1afae5b907cebcf955dedc5ed0e58b5b6304c9df3b6"
    end
  end

  def install
    bin.install "Rscript"
  end

  test do
    assert_match "42", shell_output("#{bin}/Rscript -e 'print(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   rlang-v0.1.3-x86_64-unknown-linux-musl.tar.gz  sha256: ac8a0ab5a6e0d60027e4c0cd54ca2c599cae2b027fa788330022d36f8f763010
  #   rlang-v0.1.3-aarch64-unknown-linux-musl.tar.gz  sha256: 015fc6a3d2772d775b14a442cfc107e31237b010067ef34088dbe16df3200af8
end
