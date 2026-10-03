class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.5/zshrs-v0.13.5-aarch64-apple-darwin.tar.gz"
      sha256 "725f32b3fa87d245e1f56a4d8a8cbb170c3cf81b282249a6a82443ebf8814867"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.5/zshrs-v0.13.5-x86_64-apple-darwin.tar.gz"
      sha256 "66a16935ebcb322dd841ca0e0382bc0d673c7d8c8755b5915c1f29feeac5e813"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.5/zshrs-v0.13.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ee5cd26876aa8a540b3b3719922efb6cac405bc3a03b3b5a02731b4994a56a6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.5/zshrs-v0.13.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0115dc4dc36dfdb630ce93c5748b1a4c36c53544c61cba5e2c1a2b52d14db64f"
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
  #   zshrs-v0.13.5-x86_64-unknown-linux-musl.tar.gz  sha256: ebdf0d1b5c49d050b379f7af5a5932037485b7cbd60a421cbb1d91b5717e3519
  #   zshrs-v0.13.5-aarch64-unknown-linux-musl.tar.gz  sha256: f2248877f5d917ec8110ebfc344ef2fef9bc47aab19ce6a0a7b8a83090897b54
end
