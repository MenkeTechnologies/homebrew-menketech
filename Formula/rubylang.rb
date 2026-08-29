class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.8/rubylang-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "89947ee3f08dec89203c8af2d1db137a76f47cd34d989ce91ae97c67f071d198"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.8/rubylang-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "b82f940997eefb2b41cafc5f2413f6ea4ddee89b26994962265b4f98f897a47f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.8/rubylang-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04d46adf4afb3a9c0aeb1bae54672c169ef0b7306bfd26e39ca2def40f5b91ea"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.8/rubylang-v0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bcfcb55cc7987a4de733f2b7c4ff0946028cea0497fee3760232d488e3d34817"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end
end
