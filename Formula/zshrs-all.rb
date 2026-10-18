class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.55"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.55/zshrs-all-v0.13.55-aarch64-apple-darwin.tar.gz"
      sha256 "776b4712783610e3079a5cb3447c2ab8fb60f74fe152418722061ec95ce17bcf"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.55/zshrs-all-v0.13.55-x86_64-apple-darwin.tar.gz"
      sha256 "97d26f8afed90c7eef4c09c71d35c97ba7e84809bb27641441cb66631498fa34"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.55/zshrs-all-v0.13.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4df726a3db50a0cf0827dba056e0d50d181cb434dd0322e8cc522b85a44a85bc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.55/zshrs-all-v0.13.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4be7c625f0c98b0b38377aaf2205d6d392dc7c2dd27854ce4181e963c3e2237b"
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
  #   zshrs-all-v0.13.55-x86_64-unknown-linux-musl.tar.gz  sha256: 44df8e4090246bde47b88baf7b5d27c11f9db87165149eb5cc38ded1f2f88c19
end
