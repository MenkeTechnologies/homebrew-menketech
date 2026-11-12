class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.64"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.64/zshrs-all-v0.13.64-aarch64-apple-darwin.tar.gz"
      sha256 "df798c81c291b556c7e1c759895068c28682c2837f93d8c6e56beeb90d942ffc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.64/zshrs-all-v0.13.64-x86_64-apple-darwin.tar.gz"
      sha256 "226c633b976c2a5995463f83131f710d45ab975a60bf3b666c6a8ac5a49918f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.64/zshrs-all-v0.13.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d973c12fdbe8beff244d548fc123f9aee1baa42fa569fa92d0bae66510408dd2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.64/zshrs-all-v0.13.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a435220368ed129d442e198464c8b5e5386cc179e1dda15c62176658aef81d15"
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
  #   zshrs-all-v0.13.64-x86_64-unknown-linux-musl.tar.gz  sha256: 6223c1a469a233e8dd49ee3875af5dbf8e2d8f949ab31a09b40acb9218c4f097
end
