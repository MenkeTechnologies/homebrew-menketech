class Rlang < Formula
  desc "Compiled R runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rlang"
  license "MIT"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.8/rlang-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "fc84dc5a779b31cc90cb3e1a24be41e92c5aa08d005055f9422a4d81e6d4f89c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.8/rlang-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "c06794ce46d96d4068cb867afec49ced9cd6a2e5ccd4c712d44b253bf33d1673"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.8/rlang-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fff63e227300a7de9c89200c0d5d76773a295ad3bd4812b9095fc8a6d9604a81"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rlang/releases/download/v0.1.8/rlang-v0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "561181689c05468cbe3f9647d77725b3f5276ecbd5a785284fb955a4da9e01fb"
    end
  end

  def install
    bin.install "Rscript"
  end

  test do
    assert_match "42", shell_output("#{bin}/Rscript -e 'print(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   rlang-v0.1.8-x86_64-unknown-linux-musl.tar.gz  sha256: 0daddbbaf60255944885bcc770f6c802eaeaeff07febe6abd8dc48bdf722dfed
  #   rlang-v0.1.8-aarch64-unknown-linux-musl.tar.gz  sha256: c1dbe1d59398c90b992cef4c8d3fc4f196daeadc5b516efe45feb97ff1c4e1c4
end
