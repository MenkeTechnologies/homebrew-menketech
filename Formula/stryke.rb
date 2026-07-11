class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.38"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.38/stryke-v0.17.38-aarch64-apple-darwin.tar.gz"
      sha256 "6ab87e2e41b1f93ae5329640d7496826f3b14851f8fe617da0d90ae998d9f9fd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.38/stryke-v0.17.38-x86_64-apple-darwin.tar.gz"
      sha256 "a6f6ccd14d14f60d2adb72383186ccdb8dc7586fd0a5323de24c7fbbd8393b93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.38/stryke-v0.17.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4fcf52b77a8dd72646f48ce4374fdbd547fba3693ee291e2fbb1c72a1d8fc2b3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.38/stryke-v0.17.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aefa2539b56d063d579071b9ed0eee35ab916b20ca3b155cb0a857fb5dff4e27"
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
