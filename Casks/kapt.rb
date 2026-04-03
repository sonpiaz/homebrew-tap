cask "kapt" do
  version "1.0.0"
  sha256 "9c17d44ec705382787df15cabf07195f8afcedc1b4db3ff37a781e4de6dc4da1"

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
