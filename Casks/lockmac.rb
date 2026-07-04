cask "lockmac" do
  version "1.0.0"
  sha256 "2406d68d7e3318a6f055b0882c4d00a268d3d27ad48f4cc9b193ece8387058fd"

  url "https://github.com/Well365/si4lockmac/releases/download/v#{version}/lockmac-#{version}.pkg"
  name "lockmac"
  desc "macOS privacy veil with remote lock, dead-man switch, and emergency purge"
  homepage "https://github.com/Well365/si4lockmac"

  # The macOS app targets Ventura and later.
  depends_on macos: ">= :ventura"

  pkg "lockmac-#{version}.pkg"

  uninstall quit:    "com.lockmac.app",
            pkgutil: "com.lockmac.pkg"

  # Remove user data, caches, and any login agents lockmac installs.
  zap trash: [
    "~/.config/lockmac",
    "~/.cache/lockmac",
    "~/Library/LaunchAgents/com.lockmac.*.plist",
  ]
end
