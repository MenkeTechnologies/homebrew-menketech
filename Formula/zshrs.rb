class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.25"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.25/zshrs-v0.12.25-aarch64-apple-darwin.tar.gz"
      sha256 "0bef7181ab77bd0fa2f2a0f3aea22693b2ba1800bb7d770083b1e064e8c22f89"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.25/zshrs-v0.12.25-x86_64-apple-darwin.tar.gz"
      sha256 "71ef5144668ffc783bdb713342f0c53051e848978999a2f015e946a4b519473f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.25/zshrs-v0.12.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f626233a7fe538fbf9cc0f184a8adbc392d8a721ac6ea5792f1abaf7489ea33e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.25/zshrs-v0.12.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91a1a9e4b2b6a3ca385ae6ecd15380f6a5a975d611da9a511c11d927922507e8"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end
end
