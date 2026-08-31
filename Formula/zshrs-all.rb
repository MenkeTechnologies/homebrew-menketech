class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.56"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.56/zshrs-all-v0.12.56-aarch64-apple-darwin.tar.gz"
      sha256 "9b4431da5fcbfac16300fa58e5b87eb4c73160f74f3fbe361e9a2a0ff3463860"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.56/zshrs-all-v0.12.56-x86_64-apple-darwin.tar.gz"
      sha256 "6945dd8be56da9fc2f00d9aa229e0a2f238dd02929c0355b49f3fd764654bfc7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.56/zshrs-all-v0.12.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f512d78b38ddc239d94ace1eadbd65e03d8029dfed335104dcef520db49f78fc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.56/zshrs-all-v0.12.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6dd8190cdd1dfbdde2607d98431baff264cd1e9a3c151acf4ea7d2f52c45d8bc"
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
  #   zshrs-all-v0.12.56-x86_64-unknown-linux-musl.tar.gz  sha256: 8d299d5f4538ab8da23e0119ac393baa13baec6a2f19097687781f1657d18d59
  #   zshrs-all-v0.12.56-aarch64-unknown-linux-musl.tar.gz  sha256: 74450fb51bfa03a5f2e0cf394e3656215841ec83eff9a50112ad644fa5bd65d4
end
