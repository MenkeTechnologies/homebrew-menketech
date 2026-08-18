class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.34"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.34/zshrs-all-v0.12.34-aarch64-apple-darwin.tar.gz"
      sha256 "9a997e77f187d08662213e49e82a2ef0becadd4a4b2a12c4a1d2daf4fd2add8d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.34/zshrs-all-v0.12.34-x86_64-apple-darwin.tar.gz"
      sha256 "d9ab212e634a985aa41c96246340806ec02fbdadc186d2f34080c7eed28115e9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.34/zshrs-all-v0.12.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0049bac6d1177769d8ef01acb7f924a9a649f078cc799e3d45f6050790bbabc8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.34/zshrs-all-v0.12.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "74543f382aabdb9888fe914e00af39ceee6a0611141dd150283d5dfd0e67c8a3"
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
