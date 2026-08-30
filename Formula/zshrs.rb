class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.46"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.46/zshrs-v0.12.46-aarch64-apple-darwin.tar.gz"
      sha256 "bd6142262e64010f019bbc2473e90c84ec002cd3180fe3559172a58160d1023a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.46/zshrs-v0.12.46-x86_64-apple-darwin.tar.gz"
      sha256 "8054fcd1304f014b96e65ef44564e7fedd9783e55a21f74f342165b1f62858e4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.46/zshrs-v0.12.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85d0559f63b98bb836453a97de0368f1f5f6dfe525e7402777b711d8898aab21"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.46/zshrs-v0.12.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22969f37984dbbe00c15825f23911fcc399a75835639914b92a61168869e370c"
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
  #   zshrs-v0.12.46-x86_64-unknown-linux-musl.tar.gz  sha256: 89ac36fc1aa352d93d5e523d4a5cc2b434a822d040a05d491e7c996ff49abe1e
  #   zshrs-v0.12.46-aarch64-unknown-linux-musl.tar.gz  sha256: 02eb3b3abb6f39f0fef63d026eb1b75b1c658ec1004a8a06b6d23951c52e74e9
end
