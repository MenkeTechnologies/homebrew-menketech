class Phplang < Formula
  desc "Compiled PHP runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/phplang"
  license "MIT"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.3/phplang-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "535b9852c2d05f8f81f38bc64259089cc41c8c0f99607d917c66bed7bfe439ce"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.3/phplang-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "51f168b4338fd5cd2b04cb3656d742cc19c1c2df7e15aa82f8df11657536f3ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.3/phplang-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "15946ea62f8818fa43d3474cd5db53b00b898322b51587d5b667b1db50129383"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.3/phplang-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6561639df6f54836c14d11d6c744c1a748af2b079b8a6b3a59459d526d2a8929"
    end
  end

  def install
    bin.install "php"
  end

  test do
    assert_match "42", shell_output("#{bin}/php -r 'echo 6*7;'")
  end

  # Static musl tarballs also published at this release:
  #   phplang-v0.2.3-x86_64-unknown-linux-musl.tar.gz  sha256: 3996541999d9d6cd43d150fdf73f9fb61c4e68991f7699b455e8ba0caac85bf7
  #   phplang-v0.2.3-aarch64-unknown-linux-musl.tar.gz  sha256: 8d2f7cd1a7005ca01a6af60ff8fc65bbaee76b319ca55b1cfc26068bcf9b88d3
end
