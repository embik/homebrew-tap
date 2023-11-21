class KubeconfigBikeshed < Formula
  desc "Opinionated tool to manage your kubeconfigs"
  homepage "https://github.com/embik/kubeconfig-bikeshed"
  url "https://github.com/embik/kubeconfig-bikeshed/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "0e260faff0356407e1cd4b8898e8ba16e6f93714beeba79b3a4d643806027016"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/embik/tap"
    sha256 cellar: :any, ventura: "242c65d828139ef7172e40aacc569939c8751b54d9c22878c5903d4587a5430b"
  end

  depends_on "rust" => :build

  depends_on "openssl@3"

  depends_on "fzf" => :optional

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/kbs", "--help"
  end
end
