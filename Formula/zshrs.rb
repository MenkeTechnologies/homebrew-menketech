class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.57"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.57/zshrs-v0.13.57-aarch64-apple-darwin.tar.gz"
      sha256 "1b69145f57aa33ae67465c3f79abda52ac7842afaec182e74c30bdb4d642755b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.57/zshrs-v0.13.57-x86_64-apple-darwin.tar.gz"
      sha256 "486d8b7df5d2c14de7ef3cd2eb592a4e8a85afc9245e3554fc0d8af6c915eba4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.57/zshrs-v0.13.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6cb5605ed570cfb37a8a5985519a7a01da844a117c89af80a56a801ff91090f1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.57/zshrs-v0.13.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "09193a85ab37cbb88161909dce13e0d9b1d7419d64e9759eaf9f7bcb492f7a36"
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
  #   zshrs-v0.13.57-x86_64-unknown-linux-musl.tar.gz  sha256: b01da75d3c42e1dd632829c93f70df9ea769a556cc3c6ec48c62181fb968cd37
end
