cask "yap" do
  version "1.0.0"
  sha256 "PLACEHOLDER_UPDATE_AFTER_FIRST_RELEASE"

  url "https://github.com/sonpiaz/yap/releases/download/v#{version}/Yap-#{version}.zip",
      verified: "github.com/sonpiaz/yap/"
  name "Yap"
  desc "Push-to-talk dictation for macOS"
  homepage "https://github.com/sonpiaz/yap"

  depends_on macos: ">= :sonoma"

  app "Yap.app"

  zap trash: [
    "~/Library/Preferences/com.sonpiaz.yap.plist",
    "~/Library/Saved Application State/com.sonpiaz.yap.savedState",
    "~/Library/Caches/com.sonpiaz.yap",
  ]
end
