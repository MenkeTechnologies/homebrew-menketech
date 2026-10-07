class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.9/zshrs-v0.13.9-aarch64-apple-darwin.tar.gz"
      sha256 "1bf6f66a230d43738f79d770dc10c81dffe6437513795442a9fe45ba995072e7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.9/zshrs-v0.13.9-x86_64-apple-darwin.tar.gz"
      sha256 "9b8f65ff36be8fff2ce8f24df36f775fea1aeaa6e1976d8652e2e9fd91d60efa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.9/zshrs-v0.13.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59b254f3f32806d01f37b7e47a7fbb45c747855eebd1a16c77a69c902a24f4d7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.9/zshrs-v0.13.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4431ba07daa168dcff4cc9fc2a638ff363a8f277f09fe6daffd0642e836b33e"
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
  #   zshrs-v0.13.9-x86_64-unknown-linux-musl.tar.gz  sha256: 9ab152f3757cd33f1ce523954c91c5d5b0f73e61a4b314265ac67393ce01ce58
  #   zshrs-v0.13.9-aarch64-unknown-linux-musl.tar.gz  sha256: 7646afa935daee25975a1f3612abae6109347d82c3f912a541a3e2dc5df58d9b
end
