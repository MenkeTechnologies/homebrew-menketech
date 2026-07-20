cask "zwire" do
  version "0.6.55"
  sha256 "cbe3a53be4b1cf0da9f47c940915cd94804d66cc42c78d30c73415aa19059457"

  url "https://github.com/MenkeTechnologies/zwire/releases/download/v#{version}/zwire-#{version}-macos.zip"
  name "zwire"
  desc "Chromium rebrand: zpwrchrome power-tool, cyberpunk theme + new-tab on Blink"
  homepage "https://github.com/MenkeTechnologies/zwire"

  # Ships only the self-contained macOS .app (zwire.app at the archive root of
  # zwire-<version>-macos.zip). Blink base → modern macOS only.
  depends_on macos: :big_sur

  app "zwire.app"

  # State lives under the reverse-DNS bundle id; `zwire` is the pre-0.6 legacy dir.
  zap trash: [
    "~/Library/Application Support/com.menketechnologies.zwire",
    "~/Library/Application Support/zwire",
    "~/Library/Caches/com.menketechnologies.zwire",
    "~/Library/HTTPStorages/com.menketechnologies.zwire",
    "~/Library/Preferences/com.menketechnologies.zwire.plist",
    "~/Library/Saved Application State/com.menketechnologies.zwire.savedState",
    "~/Library/WebKit/com.menketechnologies.zwire",
  ]

  caveats <<~EOS
    zwire.app is ad-hoc signed, not notarized. On first launch macOS Gatekeeper
    will block it. Right-click zwire.app in Finder → Open, or reinstall with:
      brew install --cask --no-quarantine zwire
  EOS
end
