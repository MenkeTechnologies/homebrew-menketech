class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.67"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.67/zshrs-v0.13.67-aarch64-apple-darwin.tar.gz"
      sha256 "8af17cefad217208f1905f952ae9ce333b5478ef473162dfcc705aeada3653bc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.67/zshrs-v0.13.67-x86_64-apple-darwin.tar.gz"
      sha256 "0c48e7cc8309a74cb993e0fe942aeb161ec81edc5cac7c158359da375590e45f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.67/zshrs-v0.13.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ccaa5a7314d8ccb0939b1cde21a57d4db63c861acaca46672b51539d72fda5e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.67/zshrs-v0.13.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "30c5380d4ec1d158c8dc608d6311210899cfd67ee789907035fe856791d8f11e"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.13.67-x86_64-unknown-linux-musl.tar.gz  sha256: 0da47b5ed75547ab21f0a03d00be79c888caffd09cf0aa0a116f4e888351466d
end
