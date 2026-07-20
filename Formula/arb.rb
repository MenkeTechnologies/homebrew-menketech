class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.0.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.6/arb-v0.0.6-aarch64-apple-darwin.tar.gz"
      sha256 "b2d05784d6af3641611d25ec62f58a3a8fb405adc252246da6f4cc46404944d4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.6/arb-v0.0.6-x86_64-apple-darwin.tar.gz"
      sha256 "92849b4d07c5fd65996c7cea1a7b300810d07897d7f9e526f25bba2802e8f230"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.6/arb-v0.0.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51009ad2a105208c031e2439466e4633246c4e6bc9160241121d969ed59b69c3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.6/arb-v0.0.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4269996fa69696498d4a8468e35ddb3a42e18bbe663f2eb0d2cb17518512851"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.0.6-x86_64-unknown-linux-musl.tar.gz  sha256: 701e1a250a494900e6bccd77f0f3af693916f21e5c83417dec3a5e39a490224a
  #   arb-v0.0.6-aarch64-unknown-linux-musl.tar.gz  sha256: 546bfd59a9c06521f8d39383dd1b59ea1b89037f216a30fd16de4561536439a2
end
