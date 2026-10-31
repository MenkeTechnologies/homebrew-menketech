class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.58"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.58/zshrs-v0.13.58-aarch64-apple-darwin.tar.gz"
      sha256 "a897e03cc0c8f927fba20f258be20e7967d23d829f19206e83f20fd0b6e06228"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.58/zshrs-v0.13.58-x86_64-apple-darwin.tar.gz"
      sha256 "fb7bf7826af70b23ffd506eea7b696bb8efae1932d4f249583f91058677dc53e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.58/zshrs-v0.13.58-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "81fee283aaef7565970d15d19610164f844f340512c0cfe6ed91c9dec83a03b2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.58/zshrs-v0.13.58-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f1f8a1bdc891f584484cec0363a76fe2bcb64d96ec80c9f6d141af21c0c4b22a"
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
  #   zshrs-v0.13.58-x86_64-unknown-linux-musl.tar.gz  sha256: 403a7822eac74cc7ce98fa26ca3e0fa901dba88e3ea51ca522fed2e46f8649e4
end
