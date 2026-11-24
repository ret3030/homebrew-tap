cask "pomo" do
  version "0.1.0"
  sha256 "f5d4fef4974a84a179ca422badc683a03ce5d22ee0b4e86019dca368842897ea"

  url "https://github.com/ret3030/pomo/releases/download/v#{version}/Pomo-#{version}.zip"
  name "Pomo"
  desc "Tiny 50/10 pomodoro timer in the menu bar"
  homepage "https://github.com/ret3030/pomo"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Pomo.app"

  # Pomo is signed ad hoc, not notarized, so Gatekeeper would block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Pomo.app"]
  end

  uninstall quit: "com.ret3030.pomo"

  zap trash: "~/Library/Preferences/com.ret3030.pomo.plist"
end
