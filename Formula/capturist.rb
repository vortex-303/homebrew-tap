class Capturist < Formula
  desc "CLI and local MCP server for Capturist: your Mac screenshots for AI agents"
  homepage "https://capturist.nodetools.org/cli/"
  url "https://github.com/vortex-303/capturist-mcp/releases/download/v0.4.2/capturist-cli.zip"
  sha256 "fd9cb4bbf39ed4333369ebe5d0f4fb082d305f4913ca118afe8281c1885b99be"
  license "MIT"

  depends_on macos: :sonoma

  def install
    bin.install "capturist"
  end

  def caveats
    <<~EOS
      Connect your AI apps:
        capturist setup claude-desktop   # Claude (desktop app)
        capturist setup chatgpt          # ChatGPT (desktop app) and Codex
        capturist setup claude-code      # Claude Code
      Needs Capturist: https://capturist.nodetools.org
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/capturist --version")
  end
end
