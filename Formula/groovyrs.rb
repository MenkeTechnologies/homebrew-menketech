class Groovyrs < Formula
  desc "Compiled Groovy runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/groovyrs"
  license "MIT"
  version "0.1.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.14/groovyrs-v0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "5251fd05c015a288025281cc589965bffc154de1043ee61986cacb2cb45328bc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.14/groovyrs-v0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "7896e95360940570fc0ce6f9d323ad4c61ebd3fd20405d0d010e6aff26f3b761"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.14/groovyrs-v0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6958add003487736821428153381927f087f2b9ef88a3d5725570f31e5b3b72"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.14/groovyrs-v0.1.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06cefb63f08f6eb9980c717a1a6198bca3002f80b39ccb56fae4947d0d3a0f68"
    end
  end

  def install
    bin.install "groovy"
  end

  test do
    (testpath/"t.groovy").write("println(6*7)")
    assert_match "42", shell_output("#{bin}/groovy #{testpath}/t.groovy")
  end

  # Static musl tarballs also published at this release:
  #   groovyrs-v0.1.14-x86_64-unknown-linux-musl.tar.gz  sha256: 5a68a09305eb973d2a692be4e2b984c43e693548f79c3a906fe93f31c630c8b3
  #   groovyrs-v0.1.14-aarch64-unknown-linux-musl.tar.gz  sha256: fec97f6aed53b1501ce579b3d5ed5030ef3e020fec6c89f5af7426da59d10a17
end
