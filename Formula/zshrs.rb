class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.4/zshrs-v0.13.4-aarch64-apple-darwin.tar.gz"
      sha256 "8aacbd7b0208e4ae934992ac17ad572d52833b58e1e79e4735526d9b68ccd858"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.4/zshrs-v0.13.4-x86_64-apple-darwin.tar.gz"
      sha256 "633182ea0d5286d1a26916ef124c3eadaeabba1374d3d0a5fb95d1a1442f31ed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.4/zshrs-v0.13.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73b9c2dc77532b10834e52e6d9d297c8de8af3c6e375b972d6a63c5b10d3ae24"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.4/zshrs-v0.13.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e58d2aa48bc14df66c628b8c43690a29a68f8b0005c3dd4664b71291bbbb52c8"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.13.4-x86_64-unknown-linux-musl.tar.gz  sha256: 737659963fdfe4de91a5638da4c8d5e919abf7918e3ed02ba69a624087fb8404
  #   zshrs-v0.13.4-aarch64-unknown-linux-musl.tar.gz  sha256: d5bcab4a40967271db15dc8344925e4f7e16e29437f3b39d1a458316c85559a2
end
