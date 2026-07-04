cask "lockmac" do
  version "1.0.1"
  sha256 "5a2472a8fc97c78c5bca7d1885e55418f5c04909681726770053df2d006e1094"

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
