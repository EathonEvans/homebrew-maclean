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

  # 自用 tap：安装后移除隔离标记，跳过 Gatekeeper 首启拦截
  # （应用为本人构建发布；发布给第三方时建议改走公证流程）
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/maclean.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.ethon.maclean.plist",
    "~/Library/Caches/com.ethon.maclean",
  ]
end
