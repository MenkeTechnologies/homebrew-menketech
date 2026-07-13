class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.12/zshrs-v0.12.12-aarch64-apple-darwin.tar.gz"
      sha256 "8f35f34483d6a64400a08dcad5775097fff1eb25a961d7877acf3ebf2c96075e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.12/zshrs-v0.12.12-x86_64-apple-darwin.tar.gz"
      sha256 "d0d22ece5bbf29bad924ed19d1e4965b14ceb8d191fc8d7f3f04420ba4109642"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.12/zshrs-v0.12.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "510458f65451d783e243d6c2baa31a1e297c0710b502e88c1560bef7214042a2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.12/zshrs-v0.12.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a7c75e55052f9e76e520ea0058c84aba9f034028a5a7b183c3dc1c0a7c7c62b"
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
