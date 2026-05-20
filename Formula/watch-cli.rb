class WatchCli < Formula
  desc "Turn any social video into an architecture diagram or working component"
  homepage "https://github.com/sonpiaz/watch-cli"
  # url uses v#{version} interpolation so the auto-bump workflow only
  # edits `version` and `sha256` on each release. See
  # https://github.com/sonpiaz/watch-cli/blob/main/docs/homebrew.md
  version "0.3.1"
  url "https://github.com/sonpiaz/watch-cli/releases/download/v#{version}/watch-cli.tar.gz"
  sha256 "a57891fc82af1dd5e6ae92cf5fe4bde224368a50e7435f3e295d6be5c0d87ecf"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "jq"
  depends_on "yt-dlp"

  def install
    # bin/* scripts shell-source files under lib/. Move both into the
    # formula prefix, then rewrite the bin scripts so that ROOT_DIR
    # resolves to pkgshare (not "$SELF_DIR/..", which under brew's
    # symlink scheme would walk into the wrong tree).
    libexec.install Dir["bin/*"]
    pkgshare.install "lib"
    pkgshare.install "prompts" if File.directory?("prompts")

    bin_files = Dir["#{libexec}/*"]
    bin_files.each do |script|
      inreplace script, %r{ROOT_DIR="\$\(cd "\$SELF_DIR/\.\." && pwd\)"},
                "ROOT_DIR=\"#{pkgshare}\""
    end

    bin.install_symlink bin_files
  end

  test do
    system "#{bin}/watch", "--help"
  end
end
