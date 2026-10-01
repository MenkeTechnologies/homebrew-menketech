class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.68"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.68/zshrs-v0.12.68-aarch64-apple-darwin.tar.gz"
      sha256 "d4f20895cb0844a771e97e35748277f37a08c21a9e24fd3ccfce3612523a6d14"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.68/zshrs-v0.12.68-x86_64-apple-darwin.tar.gz"
      sha256 "5e4c31479726984c0165921232b4056ef5799ceb3150f8b6f5c8724f4a1ef6d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.68/zshrs-v0.12.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db07ad2900eca26521cbfb49e7a3e135b0f401220e2cfa39831d81ef64670977"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.68/zshrs-v0.12.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "39febae28a63c83785da6e421a6f8b922ff4422d51c4af2313ba12aa0d92e4b6"
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
  #   zshrs-v0.12.68-x86_64-unknown-linux-musl.tar.gz  sha256: 067eae25447ec151a1f16ae791a52541d5e924eff3aae505a5a4e670fba10769
  #   zshrs-v0.12.68-aarch64-unknown-linux-musl.tar.gz  sha256: d63011a562c5ef6da2df0eaaf7415adbed1ab2878c57c7808b2ab47a3eaa46da
end
