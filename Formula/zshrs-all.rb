class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.29"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.29/zshrs-all-v0.12.29-aarch64-apple-darwin.tar.gz"
      sha256 "3fb4fadca0bd8a4b468d6cca71929869b7bb28afeea01ec804a75a7592db0cc7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.29/zshrs-all-v0.12.29-x86_64-apple-darwin.tar.gz"
      sha256 "7ae5c55d6a7e26a62e6211ee154b61cb0335920809ea45c2e04afa9947c12711"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.29/zshrs-all-v0.12.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1904ca74e18cc61b4d4f6bae090de174b74c0357537f4d97d4bf5003b826b66c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.29/zshrs-all-v0.12.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d040fbe2eb0e5030218851be25b0fb663548c4090afeb812ba3d4bc5be7c3ff8"
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
