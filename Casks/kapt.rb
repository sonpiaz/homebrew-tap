cask "kapt" do
  version "1.0.0"
  sha256 "PLACEHOLDER_UPDATE_AFTER_FIRST_RELEASE"

  url "https://github.com/sonpiaz/kapt/releases/download/v#{version}/Kapt-#{version}.zip",
      verified: "github.com/sonpiaz/kapt/"
  name "Kapt"
  desc "Screenshot tool with annotation, OCR, and scrolling capture"
  homepage "https://github.com/sonpiaz/kapt"

  depends_on macos: ">= :sequoia"

  app "Kapt.app"

  zap trash: [
    "~/Library/Preferences/com.sonpiaz.kapt.plist",
    "~/Library/Saved Application State/com.sonpiaz.kapt.savedState",
    "~/Library/Caches/com.sonpiaz.kapt",
  ]
end
