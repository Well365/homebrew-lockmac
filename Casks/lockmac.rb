cask "lockmac" do
  version "1.0.3"
  sha256 "fdfcc851595e2b7b180320f887e2bcf1c348e1f8999e921290ce2698a642b2b4"

  url "https://github.com/Well365/si4lockmac/releases/download/v1.0.3/lockmac-1.0.3-26787a-md5-1efd6a.pkg"
  name "lockmac"
  desc "macOS privacy veil with remote lock, dead-man switch, and emergency purge"
  homepage "https://github.com/Well365/si4lockmac"

  # The macOS app targets Ventura and later.
  depends_on macos: ">= :ventura"

  pkg "lockmac-1.0.3-26787a-md5-1efd6a.pkg"

  uninstall quit:    "com.lockmac.app",
            pkgutil: "com.lockmac.pkg"

  # Remove user data, caches, and any login agents lockmac installs.
  zap trash: [
    "~/.config/lockmac",
    "~/.cache/lockmac",
    "~/Library/LaunchAgents/com.lockmac.*.plist",
  ]
end
