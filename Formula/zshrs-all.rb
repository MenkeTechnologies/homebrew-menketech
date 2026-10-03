class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.7/zshrs-all-v0.13.7-aarch64-apple-darwin.tar.gz"
      sha256 "343b7edb98c8c44127ba8902e9f3b382d89598c443a5af38d81066e6b5651df9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.7/zshrs-all-v0.13.7-x86_64-apple-darwin.tar.gz"
      sha256 "c92cd93f867973056f62566f285b993e2ea02472768c26f909e0351de644cd63"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.7/zshrs-all-v0.13.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4bfe07fbd090785bd7f7d795245f6e89fc669b063e164089789c11f694997ec0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.7/zshrs-all-v0.13.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3bad0106d8eec8e05bfa582025f39c65b036a2f5ceb321008361fafcfd19f5c6"
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
  #   zshrs-all-v0.13.7-x86_64-unknown-linux-musl.tar.gz  sha256: b0767f8a06ca3b3baf7124ea14b7c000e6c05648dd12b8b82acc94336c48c604
  #   zshrs-all-v0.13.7-aarch64-unknown-linux-musl.tar.gz  sha256: 275754e17f60eab07bb69dfa9072c53f532908d06f76973a2549cd0edc26ba6d
end
