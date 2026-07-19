class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.24"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.24/zshrs-all-v0.12.24-aarch64-apple-darwin.tar.gz"
      sha256 "cd9b2b8e50f71ba5140b1afa981f7fed92b568641e101b814621b676270af901"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.24/zshrs-all-v0.12.24-x86_64-apple-darwin.tar.gz"
      sha256 "7af02f6cf9233c68a4de75a8ae689adc62d679be1b1b13b027923a3a3321d1ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.24/zshrs-all-v0.12.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "83355987fc732db7e0aeb5e5b391061451a2dc37879674ac34bcba061dae249f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.24/zshrs-all-v0.12.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bbfd6bda194a7433cae32c17e9428732afce779bc70e17ec99ef766fdc7ec5f9"
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
end
