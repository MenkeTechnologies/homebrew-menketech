class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.67"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.67/zshrs-all-v0.13.67-aarch64-apple-darwin.tar.gz"
      sha256 "90aaec2bc8295afceb88d229365bc4ff072ea4cb6f5f703bb868ce3446f93b6c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.67/zshrs-all-v0.13.67-x86_64-apple-darwin.tar.gz"
      sha256 "69b1b160fbb7995cb14e4d12daabc17f6cb0777e47d0d018acfecb33533c218c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.67/zshrs-all-v0.13.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8dc2e6ec3115d3fdd6bf33be7733ca48b09dde9f80a1659a345e8a717b84ad1f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.67/zshrs-all-v0.13.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fede2e47130852c9d51cc6f5260c07e410297fed544d9f1dd7b666ff76cc12db"
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
  #   zshrs-all-v0.13.67-x86_64-unknown-linux-musl.tar.gz  sha256: 531076c0e36fb36a6185ae7fc49cb4b8b5057d109093d8baf62cbf5a8486dc49
end
