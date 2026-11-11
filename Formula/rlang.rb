class Rlang < Formula
  desc "Compiled R runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rlang"
  license "MIT"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.11/rlang-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "46c4dbed08061a0df13e6ab622e1ea83abfec0ac60905e321d93167561f95be9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.11/rlang-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "4ba6c0fe478ba9d6a28c8f975ffc9e94e497d1d4b927fe35cfc0098ba85b8c60"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.11/rlang-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "484a42c443fdc84af68ad13fae903e8e6667d61e87cccdbe510c618880b693c8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.11/rlang-v0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e18bd50cd1e0ae6d22810af5ebf287d6a75c63d99c7459b1e1171baa804e5899"
    end
  end

  def install
    bin.install "Rscript"
  end

  test do
    assert_match "42", shell_output("#{bin}/Rscript -e 'print(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   rlang-v0.1.11-x86_64-unknown-linux-musl.tar.gz  sha256: 96fef1d119d03de1588e830e8c1ccfbcb5611038c7cb46b4550ec82c0231e1c2
  #   rlang-v0.1.11-aarch64-unknown-linux-musl.tar.gz  sha256: 1e57ae799656cf59527d221ca774bc61849cab8e655b7f140711f249341ff911
end
