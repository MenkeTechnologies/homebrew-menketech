class Phplang < Formula
  desc "Compiled PHP runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/phplang"
  license "MIT"
  version "0.2.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.17/phplang-v0.2.17-aarch64-apple-darwin.tar.gz"
      sha256 "dd556b1ced39274d9c3686a359d667536b10d187a7829e11c4a9bcf49bee4af4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.17/phplang-v0.2.17-x86_64-apple-darwin.tar.gz"
      sha256 "e5adc05193f18117f47a9810882ba54f13ffc55f7572aad2a3a1eab520e64b32"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.17/phplang-v0.2.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2516e3fe67c5d0bc2ca21d9ce68a9f3ec446c135c5e387f3d0beef5c25be87d3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.17/phplang-v0.2.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "89556d669d3a9e75bc2620466230635fc8e0715aff6ecf4ca86feace70410c09"
    end
  end

  def install
    bin.install "php"
  end

  test do
    assert_match "42", shell_output("#{bin}/php -r 'echo 6*7;'")
  end

  # Static musl tarballs also published at this release:
  #   phplang-v0.2.17-x86_64-unknown-linux-musl.tar.gz  sha256: 49d02afe09788c30897a7b3946ce38ce5c8bf80962031ec1633bcb01c84817f1
  #   phplang-v0.2.17-aarch64-unknown-linux-musl.tar.gz  sha256: 8d3b3bf65451484a8a71c7930f963ad579891bf5899f4715b53169e0fae533fa
end
