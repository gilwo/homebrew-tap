class McpRouter < Formula
  desc "MCP gateway that aggregates multiple MCP servers behind a single endpoint"
  homepage "https://github.com/gilwo/mcp-router-release"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.4.2/mcp-router_0.4.2_darwin_arm64"
      sha256 "77ba09e119496b40ff18272ea5f0c2322a7f6205d022a7f95d002d31fe2738bc"
    else
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.4.2/mcp-router_0.4.2_darwin_amd64"
      sha256 "1eacd3b627d121ce865b9ae74a3b8358d206617978b20e19aa3ab1b3b90f55ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.4.2/mcp-router_0.4.2_linux_arm64"
      sha256 "d00dcdeb732770bc84983c68ad320059079638a7eaede5fa81c488feaaef5f5e"
    else
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.4.2/mcp-router_0.4.2_linux_amd64"
      sha256 "0ea89a4981d45e75a8a2c57ff2fc39576ffea339a4e04ffff534cc4facb8c04c"
    end
  end

  def install
    bin.install Dir["mcp-router*"].first => "mcp-router"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcp-router version")
  end
end
