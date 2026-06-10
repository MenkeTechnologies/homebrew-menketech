class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.11.41"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.41/zshrs-all-v0.11.41-aarch64-apple-darwin.tar.gz"
      sha256 "0271c106d0a9f564986b4f8c0c3a6f63ad979511598c82192aa38413486a6803"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.41/zshrs-all-v0.11.41-x86_64-apple-darwin.tar.gz"
      sha256 "04f26edfbe944350538ca3b34c87aba04aaa3ca27b7860d57367ad5d2cd8e406"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.41/zshrs-all-v0.11.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e945112fa8b6b80fc4a3e3d6a6cc0e145658bb280e1088e256323e8965334574"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.41/zshrs-all-v0.11.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d1aa3ff0049c6120e7777a760cbe314192a3e5549613bfb5a333ef937cf590c"
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
