class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.80"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.80/zshrs-all-v0.13.80-aarch64-apple-darwin.tar.gz"
      sha256 "27cbe23ca271d01fcf3170581f7a61eff978ed4313b5147828365ceb63f8fede"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.80/zshrs-all-v0.13.80-x86_64-apple-darwin.tar.gz"
      sha256 "4a0acd4b2d2a6c19a3b504706eee94de636c39a37361ad76e4b6fe703f5ad7a0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.80/zshrs-all-v0.13.80-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6833f157b01cf71b70c88fa5100a5a3f8c579224650d944ae928df26f5f99a84"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.80/zshrs-all-v0.13.80-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59921d6541578b53c1f5491fe8df666666d06683a4ba47f19268a14cfad463c6"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.13.80-x86_64-unknown-linux-musl.tar.gz  sha256: 92dc85dc45833d84f8daea5ffdc3aa62ca432c60142fabd0b9c6ff73b49e6bd0
end
