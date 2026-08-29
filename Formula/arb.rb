class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.10/arb-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "3ce886fead9eae81fc68875cecbf127f76f0c78805fe7207cd96c56ed967776f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.10/arb-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "82e1585b654677e6398eceb61cd7a8730b736f89b463bb32f8b0b5f40a6ba182"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.10/arb-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "edd05f105c08f849f736ef6e680e7313f6f36191d52147e993d5e648b519b669"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.10/arb-v0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9adea201eb3fee5edb53ce5297ec1bf0f59fa52c070f5efcec3997ef017a5a72"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.10-x86_64-unknown-linux-musl.tar.gz  sha256: d1252fd6b46469a03af082d1bda5598de8ad9fef8d3a56138762fe7cf7958bca
  #   arb-v0.1.10-aarch64-unknown-linux-musl.tar.gz  sha256: d045536dbf94554054c18b39f19bd2a6a1837dabceb14109e7f85027c041e242
end
