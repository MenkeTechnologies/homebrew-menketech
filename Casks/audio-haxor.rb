cask "audio-haxor" do
  version "1.28.18"
  sha256 "35c46e39796e9556339056589c35d5ba57c0e1ebb38fcb7eb90f930d7a5bfd55"

  url "https://github.com/MenkeTechnologies/Audio-Haxor/releases/download/v1.28.18/AUDIO_HAXOR_1.28.18_aarch64-v1.28.18-macos-arm64.dmg"
  name "AUDIO_HAXOR"
  desc "Scanner and manager for VST/VST3/AU/CLAP plugins, samples and DAW projects"
  homepage "https://github.com/MenkeTechnologies/Audio-Haxor"

  depends_on macos: ">= :big_sur"

  app "AUDIO_HAXOR.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/AUDIO_HAXOR.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.menketechnologies.audio-haxor",
    "~/Library/Caches/com.menketechnologies.audio-haxor",
    "~/Library/WebKit/com.menketechnologies.audio-haxor",
    "~/Library/Preferences/com.menketechnologies.audio-haxor.plist",
    "~/Library/Saved Application State/com.menketechnologies.audio-haxor.savedState",
  ]
end
