cask "lockmac" do
  version "1.0.2"
  sha256 "2677a285e601190d9eb5ae3edfde90bbbd7b10fb0de26001959f8942669df51d"

  url "https://github.com/Well365/si4lockmac/releases/download/v1.0.2/lockmac-1.0.2-4d986f-md5-4cc95b.pkg"
  name "lockmac"
  desc "macOS privacy veil with remote lock, dead-man switch, and emergency purge"
  homepage "https://github.com/Well365/si4lockmac"

  # The macOS app targets Ventura and later.
  depends_on macos: ">= :ventura"

  pkg "lockmac-1.0.2-4d986f-md5-4cc95b.pkg"

  uninstall quit:    "com.lockmac.app",
            pkgutil: "com.lockmac.pkg"

  # Remove user data, caches, and any login agents lockmac installs.
  zap trash: [
    "~/.config/lockmac",
    "~/.cache/lockmac",
    "~/Library/LaunchAgents/com.lockmac.*.plist",
  ]
end
