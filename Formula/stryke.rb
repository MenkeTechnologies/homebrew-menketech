class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.39/stryke-v0.17.39-aarch64-apple-darwin.tar.gz"
      sha256 "6d97e67984fc8378c2e725799dc66bec5b82c7e2db20b038510f7dc2361fb211"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.39/stryke-v0.17.39-x86_64-apple-darwin.tar.gz"
      sha256 "8a442a0ce808ec24738ce6b45c286e2554fe23298f8402784f9ae0d64072ceab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.39/stryke-v0.17.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3460ed1e840a6ee8536d9c46086b512aa2033717480a7e1f94b33436ffb1c458"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.39/stryke-v0.17.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef1d48b7a20bf19ea9795289c608cd65394084e677a7d53ba7e07c1cbfc62b0f"
    end
  end

  def install
    bin.install "stryke"
    bin.install "st"
    bin.install "s"
  end

  test do
    assert_match "hello", shell_output("#{bin}/s -e 'print \"hello\"'")
  end
end
