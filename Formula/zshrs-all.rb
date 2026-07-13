class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.13/zshrs-all-v0.12.13-aarch64-apple-darwin.tar.gz"
      sha256 "746dfce808d841131205061a8f49de2720175f946be7ea53aa85d46b7e8c30c2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.13/zshrs-all-v0.12.13-x86_64-apple-darwin.tar.gz"
      sha256 "1b461cad3910eacf36036b8d83bff49bf7e80e4e54714611be677ef988a921bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.13/zshrs-all-v0.12.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "753bdd77d4c09f0fe8dfb616d536afe61a53f05eb34d6ad3762e603a6ed64a74"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.13/zshrs-all-v0.12.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be9dcfcab2a972656df9de4521b5fa5626384ee3d1d27cc332789131ba78856f"
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
