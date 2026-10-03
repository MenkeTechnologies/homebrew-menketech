class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.4/zshrs-all-v0.13.4-aarch64-apple-darwin.tar.gz"
      sha256 "9b8e6d3346962581a40fd601bdea9438863275ad2eeb389b8a15f41381de3332"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.4/zshrs-all-v0.13.4-x86_64-apple-darwin.tar.gz"
      sha256 "dcd798f43a6d6200bcd12ce20a9f178d9b533672eb3dc22f9cf69c8bce9aa81a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.4/zshrs-all-v0.13.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b4237e27306ecb3db25bd4b502531aaa0381ee1f01f4250ec792c3f43b388d5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.4/zshrs-all-v0.13.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "958d71f490bda8095717505eb92e9b8102241366eb09fc928737a50b64e2ba10"
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
  #   zshrs-all-v0.13.4-x86_64-unknown-linux-musl.tar.gz  sha256: 7abd1bae7145124eb95f6f6112092cba45c4e8335404eb5f50fef39428357279
  #   zshrs-all-v0.13.4-aarch64-unknown-linux-musl.tar.gz  sha256: 5f1a7f6c4c1ab7a5992e3589d8b3ffdc523e8ab32c6aa773efa3e8b556c6daf4
end
