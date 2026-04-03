cask "yap" do
  version "1.0.0"
  sha256 "418c277539b334b8dd8c3461ff63c6889637da99ec5f4aeed7bfadb06089a624"

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
