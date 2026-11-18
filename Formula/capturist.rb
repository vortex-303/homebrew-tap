class Capturist < Formula
  desc "CLI and local MCP server for Capturist: your Mac screenshots for AI agents"
  homepage "https://capturist.nodetools.org/cli/"
  url "https://github.com/vortex-303/capturist-mcp/releases/download/v0.5.0/capturist-cli.zip"
  sha256 "59bcd5ff9174b62b6115fe505af4e67e124d6dac9dec41c013ff52ee28d9b472"
  license "MIT"

  depends_on macos: :sonoma

  def install
    bin.install "capturist"
  end

  def caveats
    <<~EOS
      Connect your AI apps:
        capturist setup detect --all     # find and connect every AI app on this Mac
        capturist setup hermes           # or one: claude-desktop, chatgpt, claude-code, codex,
                                         # gemini, qwen, copilot, cursor, windsurf, vscode, cline,
                                         # opencode, lmstudio (steps: capturist.nodetools.org/ai/)
      Needs Capturist: https://capturist.nodetools.org
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/capturist --version")
  end
end
