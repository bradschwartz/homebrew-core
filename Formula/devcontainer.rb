require "language/node"

class Devcontainer < Formula
  desc "Reference implementation for the Development Containers specification"
  homepage "https://containers.dev"
  url "https://registry.npmjs.org/@devcontainers/cli/-/cli-0.37.0.tgz"
  sha256 "91faa34ab83dfd61a72361247816d434a026778806c795910f35343dae4ac591"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "0.37.0", shell_output("#{bin}/devcontainer --version")
  end
end
