class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.19/zshrs-v0.13.19-aarch64-apple-darwin.tar.gz"
      sha256 "a2eaba431be4e363cf2aa31939aa0a52d0355d243410e9df2a9237676871cf48"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.19/zshrs-v0.13.19-x86_64-apple-darwin.tar.gz"
      sha256 "444724adf8a434625bf66ec1ef38500a19f8fcee886af8f4b125d7e9be32aeba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.19/zshrs-v0.13.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ff4b71eee28eae2bb4c411350023520db1ed46698c6c3fac8efaef32a51aedb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.19/zshrs-v0.13.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "40ee6916b68ba2fe7650ae53dd44bd050248bca3e85ceb354549a9fea88db224"
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
  #   zshrs-v0.13.19-x86_64-unknown-linux-musl.tar.gz  sha256: 920bf8b9be454a7cbe7fc91c92471e0e21a0f12678b4347cbbaf1d544889b541
end
