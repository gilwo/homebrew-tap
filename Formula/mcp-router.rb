class McpRouter < Formula
  desc "MCP gateway that aggregates multiple MCP servers behind a single endpoint"
  homepage "https://github.com/gilwo/mcp-router-release"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.4.0/mcp-router_0.4.0_darwin_arm64"
      sha256 "09da26557b0441049107bf2a948c5dab7ffedf2d754c1bdeba5c4bf0afe2ed42"
    else
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.4.0/mcp-router_0.4.0_darwin_amd64"
      sha256 "8b091c32329888ab2d3185b52925b382659ecb337974bae5c43c8a4842ac5b2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.4.0/mcp-router_0.4.0_linux_arm64"
      sha256 "5966ed91c48f578d51be907cb5df73c593908da77bdd986c6c76e463b61326d6"
    else
      url "https://github.com/gilwo/mcp-router-release/releases/download/v0.4.0/mcp-router_0.4.0_linux_amd64"
      sha256 "76fb4cc7db0387653a64d7f43e09eef02783ca2c0ce256b6e9d0a2c46730031a"
    end
  end

  def install
    bin.install Dir["mcp-router*"].first => "mcp-router"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcp-router version")
  end
end
