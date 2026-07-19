class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.3/rubylang-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "757a38f89700f5c391b490fdbc111c02ed48aa8a710609ae59bbea7207f23efa"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.3/rubylang-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "fc49d5e11995d0c40a9ce1d201557faa15145514686fef253cd814bdc1d1b1de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.3/rubylang-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d4bc2d89da7fccba1b39899e555dbc0de753fc4c14a252a6e6d0e7654f8cf32"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.3/rubylang-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49f22c1e686eb836d548ed002a473a20ee865fc672436bffe5c5fab86d4257d3"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end

  # Static musl tarballs also published at this release:
  #   rubylang-v0.1.3-x86_64-unknown-linux-musl.tar.gz  sha256: 5e97004adf270d6c86b5b5eb6e89cca54daa8882c67d89d81664fbc1b3680854
  #   rubylang-v0.1.3-aarch64-unknown-linux-musl.tar.gz  sha256: 5b9b33465f66e69872439390aea419aea5b92802e3ae9e81f967cb8a2959bd7d
end
