class KubeconfigBikeshed < Formula
  desc "Opinionated tool to manage your kubeconfigs"
  homepage "https://github.com/embik/kubeconfig-bikeshed"
  url "https://github.com/embik/kubeconfig-bikeshed/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "3223589c3d4a501aeff9bb6fb9918d6cd8b71de34537353a6fa3fcade10683b1"
  license "Apache-2.0"

  head "https://github.com/embik/kubeconfig-bikeshed.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/embik/tap"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "147e13b783b4afadc63923449e9c65d3379e35b7e9f638105b7637344c6d92fd"
  end

  depends_on "rust" => :build
  depends_on "fzf" => :optional

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/kbs", "--help"
  end
end
