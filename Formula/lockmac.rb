class Lockmac < Formula
  include Language::Python::Virtualenv

  desc "macOS privacy veil — black out the screen (not a lock) with Telegram remote"
  homepage "https://github.com/Well365/lockMac"
  # Stable: a published release tarball of the repo. Generate + hash with:
  #   git archive --format=tar.gz --prefix=lockmac-0.2.0/ HEAD > lockmac-0.2.0.tar.gz
  #   shasum -a 256 lockmac-0.2.0.tar.gz
  # then upload it to the GitHub release tagged v0.2.0.
  url "https://github.com/Well365/lockMac/releases/download/v0.2.0/lockmac-0.2.0.tar.gz"
  # sha256 of the tarball above — REGENERATE before publishing a new tag.
  sha256 "9befb2606495ddf13d99817ef7c3826248b175c6e32e6cb28d5424ebea75ad1a"
  license "MIT"
  version "0.2.0"

  # Install with no release needed:  brew install --HEAD <this-formula>
  head "https://github.com/Well365/lockMac.git", branch: "main"

  depends_on "python@3.12"
  # The Swift overlay is compiled on first run; that needs Xcode Command Line
  # Tools (swiftc). Homebrew can't depend on those, so document it in the caveats.

  def install
    # standalone repo: pyproject.toml is at the root for both stable and HEAD
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/lockmac"
    bin.install_symlink libexec/"bin/veilkit"
  end

  def caveats
    <<~EOS
      lockmac compiles its Swift overlay on first use — this needs Xcode
      Command Line Tools:
        xcode-select --install

      Get started:
        lockmac setup        # password + login autostart
        lockmac tg-setup     # bind a Telegram bot for remote /lock /unlock
        lockmac on / off
    EOS
  end

  test do
    assert_match "lockMac:", shell_output("#{bin}/lockmac status")
  end
end
