class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.16/zshrs-all-v0.13.16-aarch64-apple-darwin.tar.gz"
      sha256 "f15459610b9554d852def7e61f1fdb00d2701dbbb2fcc004561caef6d3ad4e90"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.16/zshrs-all-v0.13.16-x86_64-apple-darwin.tar.gz"
      sha256 "bac7a9e6d23b76d449ecebb9eeb9f207cdc13163d6c45a922265c124d609e29e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.16/zshrs-all-v0.13.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98d6dfa9dd41ee469c880b6c0696907d9188b14b067f071ff2ed5c81f8856836"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.16/zshrs-all-v0.13.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ce509f47af621bb28e735f315ed8f591034cf283fc41ac678aaf72ccae419fe"
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
  #   zshrs-all-v0.13.16-x86_64-unknown-linux-musl.tar.gz  sha256: e42de953db14335bba524da852f2c39669dfb38679f004b6ef42479564fdbdc9
  #   zshrs-all-v0.13.16-aarch64-unknown-linux-musl.tar.gz  sha256: a59fb502c27ef6f37573a978ebb3fbf8ef7f14d7a280afb7475f9a3688e21a19
end
