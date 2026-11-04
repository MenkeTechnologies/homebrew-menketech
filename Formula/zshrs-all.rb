class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.60"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.60/zshrs-all-v0.13.60-aarch64-apple-darwin.tar.gz"
      sha256 "50788bbfc53988dddf3fd43a05bee2fae35defa3c7a7e526dd2d79df7e6f4610"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.60/zshrs-all-v0.13.60-x86_64-apple-darwin.tar.gz"
      sha256 "3fdef013801b32c21fadd2899059c51dd7a86d99aec5ddff1049c18976bcdd61"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.60/zshrs-all-v0.13.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19c63a6c825aba9ff623d02f5e4b03315280316ce44d8495e5df01325e6eb984"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.60/zshrs-all-v0.13.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60b4834817c7984b6c280296079d6d4ed4e68147ff44de3405eca85eb3707527"
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
  #   zshrs-all-v0.13.60-x86_64-unknown-linux-musl.tar.gz  sha256: d29a6ddd7809e8c7022e07f45239711da84cd5d38ed3ad47c3355647c6f0ad22
end
