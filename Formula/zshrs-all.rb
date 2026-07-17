class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.19/zshrs-all-v0.12.19-aarch64-apple-darwin.tar.gz"
      sha256 "a8cccc8fa57d2b80434d22f5d28b664aee80799525737413b95adeda73468979"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.19/zshrs-all-v0.12.19-x86_64-apple-darwin.tar.gz"
      sha256 "552b3ba364d2e689f902aecb8ec05a463125e8ed9a1c4276ac0157f8662b5485"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.19/zshrs-all-v0.12.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8982e3cce81fbb3eeae20016b56c647f4c4914dabd385676f69e1dbe9316c13"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.19/zshrs-all-v0.12.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1eed62492e6918ed5fd8b92b6d18251e94be00d37ace3cadcfeefa1c99764194"
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
