class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.79"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.79/zshrs-v0.13.79-aarch64-apple-darwin.tar.gz"
      sha256 "418bda28dacae79f9a8810239c3540452873e181ac8557077e580b82ea06fde3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.79/zshrs-v0.13.79-x86_64-apple-darwin.tar.gz"
      sha256 "7736c8c1ed9bffa01bbd328acaad14ebbf5793bd2254ec9a92ea57e8205f1f82"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.79/zshrs-v0.13.79-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0faecd59a89a7c546026604b084daa44fa156b51033343ae366a95320f111f8c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.79/zshrs-v0.13.79-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5d5f2774431ff89e59a8bb728547ad14384afbe56e523fba01dc388d587b9ea"
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
  #   zshrs-v0.13.79-x86_64-unknown-linux-musl.tar.gz  sha256: c96df3330a1d5cb71a9b7d4d9bc8e08ab817ba927145e9b1809d37bb225f71d1
end
