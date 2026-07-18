class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.2/rubylang-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "53359a2859b5b394f994c69938800b4a189295d7f5bbfbfa091be67ea57d95eb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.2/rubylang-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "a7b16287b2e8c0c93bfb235c5baa392f65a5449ba1da30bf2fc685ab77ee0979"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.2/rubylang-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61768ddcc7d5b33f031ed4e968b744aa71e4eae1286079af25ad312f6aaed6e9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.2/rubylang-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b6cbc88258582f9359b29b39005ce06cb261bc3f8cb959633fa67555205326de"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end

  # Static musl tarballs also published at this release:
  #   rubylang-v0.1.2-x86_64-unknown-linux-musl.tar.gz  sha256: b1b87863f8ddd5672c352d9c9789e3d25e871091435c79964c05fac08f6ee9c5
  #   rubylang-v0.1.2-aarch64-unknown-linux-musl.tar.gz  sha256: 1cefc8aa30aebeb6118bc843d4013485d5491bc448bdc95deebae8f83c01a7a6
end
