class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.15/zshrs-v0.13.15-aarch64-apple-darwin.tar.gz"
      sha256 "bbf509e7d6f6f5dcb6c3047a9f24b2a3e58f8cbc355750c2226afe90ca310b7b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.15/zshrs-v0.13.15-x86_64-apple-darwin.tar.gz"
      sha256 "4aff8d8305adb3435d8f3a8875d505efe5a29b7990008f9a9bceccc782b8abbc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.15/zshrs-v0.13.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb37b9f8e194e618014257c9828a423f1839ddc2e1c2de4ca726544c84f9ca56"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.15/zshrs-v0.13.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb8625512c1a30e56c10d6188a03aa5da469c881303c11e40a6404ff88933722"
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
  #   zshrs-v0.13.15-x86_64-unknown-linux-musl.tar.gz  sha256: 98dc71be4d73c0fc26fdf793b09d3bac4ba2fec243b0afd8e104e2a42fdc962a
  #   zshrs-v0.13.15-aarch64-unknown-linux-musl.tar.gz  sha256: 5f6c3efb40632f361ba8f146863fb125d9d1881060e49ff8bed5ae30cb76bfea
end
