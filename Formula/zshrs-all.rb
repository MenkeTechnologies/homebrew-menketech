class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.27"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.27/zshrs-all-v0.12.27-aarch64-apple-darwin.tar.gz"
      sha256 "c156c876d31ff910d48469e5f0925c251aad2da522076e50cae056ea6d53e9e5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.27/zshrs-all-v0.12.27-x86_64-apple-darwin.tar.gz"
      sha256 "109a26e0398646538775af4a35cbc9a358c1842ed6ce512b4b57fdd1119319f5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.27/zshrs-all-v0.12.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f373d2a9f8485f32c2d5614fbd847b7dea016fd740e24039b6cbadb60fd5b5c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.27/zshrs-all-v0.12.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ee0a6e6c47129590f75f35128eef329009b0d33134d8b8dcd18d1f21749b6f8"
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
