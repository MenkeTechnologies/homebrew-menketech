class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.22"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.22/zshrs-all-v0.12.22-aarch64-apple-darwin.tar.gz"
      sha256 "90807fc9b0ac90859ecdb6216874dc2160c3bed075c3f7ee485f48c78344f568"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.22/zshrs-all-v0.12.22-x86_64-apple-darwin.tar.gz"
      sha256 "f5a69f4b381cfb1cc0d53b956d4555a7c450c108367fc9f736da28b1ee74c0fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.22/zshrs-all-v0.12.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30b014a75b35292a704f38bb12e2a27f8d43ef732d062d99ad1e53ca10b643cd"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.22/zshrs-all-v0.12.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12efda933b7bcfc5056333db4465a3ee30eeb3b98de197e5641b4af43e4302bb"
    end
  end

  def install
    bin.install "zshrs-daemon"
    bin.install "zd"
  end

  test do
    assert_match "zshrs-daemon #{version}", shell_output("#{bin}/zshrs-daemon --version")
    assert_match "zd #{version}", shell_output("#{bin}/zd --version")
  end
end
