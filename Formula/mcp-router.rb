class McpRouter < Formula
  desc "MCP gateway that aggregates multiple MCP servers behind a single endpoint"
  homepage "https://github.com/gilwo/mcp-router-release"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.3.0/mcp-router_0.3.0_darwin_arm64"
      sha256 "dd37912e56a8bc4e064396a0f81ef2486e861a03eab4a25c0da42a6ee791e58e"
    else
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.3.0/mcp-router_0.3.0_darwin_amd64"
      sha256 "7d4c15c4a0d8b95318aca581bdf5737e691ce310bf4021fdd8f08af18bd9c408"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.3.0/mcp-router_0.3.0_linux_arm64"
      sha256 "ecc6441f3688336bbc801a48650e2b907094385416434ff54dd06fad5b4bec5b"
    else
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.3.0/mcp-router_0.3.0_linux_amd64"
      sha256 "45140eea276864d5f277c09fb75ee6172b16f18d98dc20c252c0a5dbec320815"
    end
  end

  def install
    bin.install Dir["mcp-router*"].first => "mcp-router"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcp-router version")
  end
end
