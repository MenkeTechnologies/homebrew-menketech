class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.54"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.54/zshrs-all-v0.13.54-aarch64-apple-darwin.tar.gz"
      sha256 "08a69f2b6730a6922efe0fc87e8ebab9f5c350f403ce29edff1a7d0534974241"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.54/zshrs-all-v0.13.54-x86_64-apple-darwin.tar.gz"
      sha256 "12fd8334048c1f91ad31e65956333f4c1183cc93a193388b2c41622d888d9158"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.54/zshrs-all-v0.13.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a774f2614660aa5077a04cbc811daf98beeff2ddc0d5fda7552930239b65517d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.54/zshrs-all-v0.13.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee5dbf9e15327ceeae8248dc07af30b0262cfa6889bcb4bee58577bb66f67cb7"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.13.54-x86_64-unknown-linux-musl.tar.gz  sha256: 5e4039db5e52122bcfe24724df643d5bec6c649fc7e9ee1cf1aec4f16ccbda3c
end
