class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.19/arb-v0.1.19-aarch64-apple-darwin.tar.gz"
      sha256 "43eed7c863761c481f8db5856254be2408e2995d6bddac8d711622cca1de15d0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.19/arb-v0.1.19-x86_64-apple-darwin.tar.gz"
      sha256 "889730535be06beb1de1245d57a9389d901ace89b8fc1985194fa67e8b2299ad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.19/arb-v0.1.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8df39a5dd9fff0525a13774692b0bca1111f6d680a00e41c81619cb7ee72a50d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.19/arb-v0.1.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f1fd54289b14e61b58ef72d5ec32629f590c450b95fdb7cbdff012f67df9f36"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.19-x86_64-unknown-linux-musl.tar.gz  sha256: c6069dd60ba53b1930cb150cb0cbf111d55fd4654082d87f5fbf82e8b1bdab26
  #   arb-v0.1.19-aarch64-unknown-linux-musl.tar.gz  sha256: 2fad81863056344d3e1eab60e21b3a7cee72608db3d150fbcfb5831981d0a5d2
end
