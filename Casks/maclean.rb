cask "maclean" do
  version "1.0"
  sha256 "183bb8615a611f6bb10ace50db8c308491eb0e6b4e2c377d922210db4ea2f6fd"

  url "https://github.com/EathonEvans/maclean/releases/download/v#{version}/maclean-#{version}.dmg"
  name "Maclean"
  desc "极简 macOS 菜单栏工具：显示器休眠 · 清洁模式"
  homepage "https://github.com/EathonEvans/maclean"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  app "maclean.app"

  zap trash: [
    "~/Library/Preferences/com.ethon.maclean.plist",
    "~/Library/Caches/com.ethon.maclean",
  ]
end
