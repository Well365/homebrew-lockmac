# Alias of the "lockmac" cask so `brew install --cask si4lockmac` also works
# (matches the release/repo brand name). Same pkg, same uninstall/zap.
# build-pkg.sh keeps version + sha256 in lockstep across every Casks/*.rb.
cask "si4lockmac" do
  version "1.0.0"
  sha256 "a85d0647bc9bb29396e96aec07b02ae49551b2d07d69ff0c3114442608d43596"

  url "https://github.com/Well365/si4lockmac/releases/download/v#{version}/lockmac-#{version}.pkg"
  name "si4lockmac"
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
