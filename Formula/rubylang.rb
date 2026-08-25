class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.6/rubylang-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "b7a91a1f834bb76eb8bdbcc9081684a1c769f74096d598a19361048c2e9f3aac"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.6/rubylang-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "91526aa5a2a7a5730c41ea5d5906f55533122293bc37f41d8926b1e3583904fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.6/rubylang-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b3ef8a9843b9beb07c5b50293f6dd0461754aa98fc7493095954ce71148dd9c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.6/rubylang-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5bf22c9c36c513dd46ee8258461e892ce3964eb69135e610e46097e2cf7da405"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end
end
