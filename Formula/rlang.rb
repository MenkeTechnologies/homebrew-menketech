class Rlang < Formula
  desc "Compiled R runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rlang"
  license "MIT"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.4/rlang-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "835c7593500721baba635a862a297e18c1b6633c7c6d3e0d55a61f7d5b55f5bc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.4/rlang-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "61b9ba650f6556f4fbbb666945e9f64627c0149de31a3f68cd6af50e204c3cf9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.4/rlang-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de6e54bae6fee191acce93048a42c4212613a3832b72fb9190790a7a8e1e99a2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.4/rlang-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8cf63cbe037b93631fd582ce15920ebcee7971f24c40fc85ab803cf8eab453b3"
    end
  end

  def install
    bin.install "Rscript"
  end

  test do
    assert_match "42", shell_output("#{bin}/Rscript -e 'print(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   rlang-v0.1.4-x86_64-unknown-linux-musl.tar.gz  sha256: 8575373dd7bf047c9c1e58920ed1ed9a1a6b341c0bbb3ff83fbd37b261929b79
  #   rlang-v0.1.4-aarch64-unknown-linux-musl.tar.gz  sha256: 884cb180c4fdb6d9172040cbaae042e8e63152ec6353b19e1dfdfe81a298e518
end
