class McpRouter < Formula
  desc "MCP gateway that aggregates multiple MCP servers behind a single endpoint"
  homepage "https://github.com/gilwo/mcp-router-release"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.4.1/mcp-router_0.4.1_darwin_arm64"
      sha256 "359e16e809dfd3d87d3b34ce35919b0cf8d8396aef51250219a11eaffa650b80"
    else
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.4.1/mcp-router_0.4.1_darwin_amd64"
      sha256 "c496b6eecbe3261c14bc2758d7fc82d0b041458fada683eea17c1086b80d53db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.4.1/mcp-router_0.4.1_linux_arm64"
      sha256 "9c0da7c5c5b87294adefec43e32db38584f4eb7f915026840048815a39b52b6a"
    else
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.4.1/mcp-router_0.4.1_linux_amd64"
      sha256 "a6da5c71074ebc69feb8ee5904293dcea0d48eeae19b82ee0015952cc5200044"
    end
  end

  def install
    bin.install Dir["mcp-router*"].first => "mcp-router"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcp-router version")
  end
end
