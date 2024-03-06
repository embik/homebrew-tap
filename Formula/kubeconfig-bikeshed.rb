class KubeconfigBikeshed < Formula
  desc "Opinionated tool to manage your kubeconfigs"
  homepage "https://github.com/embik/kubeconfig-bikeshed"
  url "https://github.com/embik/kubeconfig-bikeshed/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "12013f65489af4fdd7c208c291c72e09810c6186ef22ab5e30e84e5dae44bf3a"
  license "Apache-2.0"

  head "https://github.com/embik/kubeconfig-bikeshed.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/embik/tap"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bfd53486469f4feac6997c1c4de80926ec8ce95d7240ee8232082247edbc6167"
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
