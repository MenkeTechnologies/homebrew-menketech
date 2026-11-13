class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.73"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.73/zshrs-v0.13.73-aarch64-apple-darwin.tar.gz"
      sha256 "259d12c311a96a826f1a85f4aa0e9809021ac582982eec99bb60150094285c47"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.73/zshrs-v0.13.73-x86_64-apple-darwin.tar.gz"
      sha256 "4ab7279ae15cb56179149ed999bad2b15322a26614087d5c1dfcbb7b5e696ed2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.73/zshrs-v0.13.73-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ee516ad10e0f2893c51199d8d9a48302c573e07eff88a74192b3ec8bc99cf87"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.73/zshrs-v0.13.73-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e536bea4386ac1fd4d91224806c0158d4fbabd4b9f9f6369b26d333f91bf5814"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.13.73-x86_64-unknown-linux-musl.tar.gz  sha256: ee4a1b3e16f9e9729272cab14511e479114cf5e1da598daff755d90b4afb2548
end
