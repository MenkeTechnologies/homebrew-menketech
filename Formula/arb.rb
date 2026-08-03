class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.3/arb-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "2bbacfe7658696270c009f05efe0f57b8b04fa9710d3323019dfa836f35ce8dc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.3/arb-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "071ac26e8058896de73514ea85f92ffb9ac960d51c3ca10f1dc01bc493b6fe76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.3/arb-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d05b63b0748e5394609cf2e16123917b073148951d4c8cf45746efc878e1f28"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.3/arb-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "71b69c1a7cc76f5321faab1706e9f4cdeaa9deb963ac48c53b9f29289720500c"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.3-x86_64-unknown-linux-musl.tar.gz  sha256: 77700a31566aa8650061b835cbc4fdbf1005d30a8d05098b3487e2c651149fa2
  #   arb-v0.1.3-aarch64-unknown-linux-musl.tar.gz  sha256: 04136747e520fd9289b241e5c538365c55bb9c1afdd79923b7aca303d9347abd
end
